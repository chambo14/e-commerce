import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../domain/entities/category.dart';
import '../../providers/cart_provider.dart';
import '../../providers/product_provider.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/product_card.dart';
import 'product_detail_screen.dart';

const _allCategory = Category(id: '', name: 'Tous', iconName: 'all_inclusive');

class ProductListScreen extends ConsumerStatefulWidget {
  /// Si [isEmbedded] est true, l'écran est affiché dans le BottomNav (sans AppBar externe)
  final bool isEmbedded;

  const ProductListScreen({super.key, this.isEmbedded = false});

  @override
  ConsumerState<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: ref.read(searchQueryProvider),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    final body = Column(
      children: [
        // Barre de recherche
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            onChanged: (value) =>
                ref.read(searchQueryProvider.notifier).state = value,
            decoration: InputDecoration(
              hintText: 'Rechercher un produit...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        ref.read(searchQueryProvider.notifier).state = '';
                      },
                    )
                  : null,
            ),
          ),
        ),
        // Filtre catégories
        SizedBox(
          height: 70,
          child: categoriesAsync.when(
            data: (categories) {
              final allCategories = [_allCategory, ...categories];
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: allCategories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final cat = allCategories[index];
                  final isAll = cat.id.isEmpty;
                  return CategoryChip(
                    category: cat,
                    isSelected: isAll
                        ? selectedCategory == null
                        : selectedCategory == cat.id,
                    onTap: () => ref
                        .read(selectedCategoryProvider.notifier)
                        .state = isAll ? null : cat.id,
                  );
                },
              );
            },
            loading: () =>
                const Center(child: CircularProgressIndicator(strokeWidth: 2)),
            error: (e, _) => const SizedBox(),
          ),
        ),
        const SizedBox(height: 8),
        // Compteur résultats
        productsAsync.when(
          data: (products) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${products.length} produit${products.length > 1 ? 's' : ''}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.sort, size: 20),
                  onPressed: () {
                    // TODO: bottom sheet de tri
                  },
                ),
              ],
            ),
          ),
          loading: () => const SizedBox(),
          error: (_, __) => const SizedBox(),
        ),
        // Grille produits
        Expanded(
          child: productsAsync.when(
            data: (products) {
              if (products.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search_off,
                          size: 80, color: AppColors.textSecondary),
                      const SizedBox(height: 16),
                      const Text(
                        'Aucun produit trouvé',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          _searchController.clear();
                          ref.read(searchQueryProvider.notifier).state = '';
                          ref
                              .read(selectedCategoryProvider.notifier)
                              .state = null;
                        },
                        child: const Text('Réinitialiser les filtres'),
                      ),
                    ],
                  ),
                );
              }
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: products.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    product: product,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) =>
                            ProductDetailScreen(productId: product.id),
                      ),
                    ),
                    onAddToCart: product.isInStock
                        ? () {
                            ref
                                .read(cartProvider.notifier)
                                .addToCart(product, 1);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${product.name} ajouté au panier'),
                                backgroundColor: AppColors.success,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        : null,
                  );
                },
              );
            },
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Erreur: ${e.toString()}')),
          ),
        ),
      ],
    );

    if (widget.isEmbedded) {
      return Scaffold(
        appBar: AppBar(title: const Text('Produits')),
        body: body,
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Produits')),
      body: body,
    );
  }
}
