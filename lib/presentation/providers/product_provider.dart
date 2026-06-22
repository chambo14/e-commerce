import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>(
  (ref) => ProductRepositoryImpl(),
);

/// Catégorie sélectionnée pour le filtre (null = toutes)
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

/// Texte de recherche
final searchQueryProvider = StateProvider<String>((ref) => '');

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  return ref.watch(productRepositoryProvider).getCategories();
});

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final categoryId = ref.watch(selectedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  return ref.watch(productRepositoryProvider).getProducts(
        categoryId: categoryId,
        searchQuery: searchQuery.isEmpty ? null : searchQuery,
      );
});

final productDetailProvider =
    FutureProvider.family<Product, String>((ref, productId) async {
  return ref.watch(productRepositoryProvider).getProductById(productId);
});
