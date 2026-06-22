import '../entities/cart_item.dart';
import '../entities/product.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCart();
  Future<void> addToCart(Product product, int quantity);
  Future<void> removeFromCart(String productId);
  Future<void> updateQuantity(String productId, int quantity);
  Future<void> clearCart();
}
