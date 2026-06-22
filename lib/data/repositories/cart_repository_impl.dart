import '../../domain/entities/cart_item.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/cart_repository.dart';

/// Mock implementation — remplacer par les appels API réels (panier côté serveur)
class CartRepositoryImpl implements CartRepository {
  final List<CartItem> _cart = [];

  @override
  Future<List<CartItem>> getCart() async {
    // TODO: remplacer par appel API
    return List.from(_cart);
  }

  @override
  Future<void> addToCart(Product product, int quantity) async {
    // TODO: remplacer par appel API
    final index = _cart.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _cart[index] = _cart[index].copyWith(
        quantity: _cart[index].quantity + quantity,
      );
    } else {
      _cart.add(CartItem(product: product, quantity: quantity));
    }
  }

  @override
  Future<void> removeFromCart(String productId) async {
    // TODO: remplacer par appel API
    _cart.removeWhere((item) => item.product.id == productId);
  }

  @override
  Future<void> updateQuantity(String productId, int quantity) async {
    // TODO: remplacer par appel API
    final index = _cart.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      if (quantity <= 0) {
        _cart.removeAt(index);
      } else {
        _cart[index] = _cart[index].copyWith(quantity: quantity);
      }
    }
  }

  @override
  Future<void> clearCart() async {
    // TODO: remplacer par appel API
    _cart.clear();
  }
}
