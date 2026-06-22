import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../providers/cart_provider.dart';
import '../../providers/delivery_provider.dart';
import '../../widgets/cart_item_widget.dart';
import '../delivery/delivery_screen.dart';

class CartScreen extends ConsumerWidget {
  /// Si [isEmbedded] est true, l'écran est affiché dans le BottomNav (sans AppBar externe)
  final bool isEmbedded;

  const CartScreen({super.key, this.isEmbedded = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final cartTotal = ref.watch(cartTotalProvider);
    final selectedLocation = ref.watch(selectedDeliveryLocationProvider);

    final deliveryFee = selectedLocation?.deliveryFee ?? 4.99;
    final total = cartItems.isEmpty ? 0.0 : cartTotal + deliveryFee;

    final body = cartItems.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 100,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Votre panier est vide',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ajoutez des articles pour commencer',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 48)),
                  icon: const Icon(Icons.shopping_bag_outlined),
                  label: const Text('Parcourir les produits'),
                ),
              ],
            ),
          )
        : Column(
            children: [
              // Liste articles
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 8),
                    ...cartItems.map(
                      (item) => CartItemWidget(
                        item: item,
                        onRemove: () => ref
                            .read(cartProvider.notifier)
                            .removeFromCart(item.product.id),
                        onQuantityChanged: (qty) => ref
                            .read(cartProvider.notifier)
                            .updateQuantity(item.product.id, qty),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Option livraison sélectionnée
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const DeliveryScreen(),
                          ),
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                const Icon(Icons.local_shipping_outlined,
                                    color: AppColors.primary),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Mode de livraison',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      Text(
                                        selectedLocation?.name ??
                                            'Choisir la livraison',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      if (selectedLocation != null)
                                        Text(
                                          selectedLocation.estimatedTime,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color:
                                                  AppColors.textSecondary),
                                        ),
                                    ],
                                  ),
                                ),
                                Text(
                                  selectedLocation != null
                                      ? '${selectedLocation.deliveryFee.toStringAsFixed(2)} €'
                                      : '+4.99 €',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.chevron_right,
                                    size: 20,
                                    color: AppColors.textSecondary),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              // Récapitulatif & bouton commander
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 20,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Sous-total
                    _SummaryRow(
                      label: 'Sous-total',
                      value: '${cartTotal.toStringAsFixed(2)} €',
                    ),
                    const SizedBox(height: 8),
                    _SummaryRow(
                      label: 'Livraison',
                      value: cartItems.isEmpty
                          ? '-'
                          : '${deliveryFee.toStringAsFixed(2)} €',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(),
                    ),
                    _SummaryRow(
                      label: 'Total',
                      value: '${total.toStringAsFixed(2)} €',
                      isTotal: true,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const DeliveryScreen(),
                        ),
                      ),
                      icon: const Icon(Icons.local_shipping_outlined),
                      label: const Text('Choisir la livraison'),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Vider le panier'),
                            content: const Text(
                                'Êtes-vous sûr de vouloir vider votre panier ?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Annuler'),
                              ),
                              TextButton(
                                onPressed: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .clearCart();
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                    foregroundColor: AppColors.error),
                                child: const Text('Vider'),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text(
                        'Vider le panier',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );

    if (isEmbedded) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
              'Mon Panier (${cartItems.fold(0, (s, i) => s + i.quantity)})'),
        ),
        body: body,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Mon Panier (${cartItems.fold(0, (s, i) => s + i.quantity)})'),
      ),
      body: body,
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight:
                isTotal ? FontWeight.bold : FontWeight.normal,
            color:
                isTotal ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: FontWeight.bold,
            color: isTotal ? AppColors.secondary : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
