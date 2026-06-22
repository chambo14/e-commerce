import '../entities/category.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts({String? categoryId, String? searchQuery});
  Future<Product> getProductById(String id);
  Future<List<Category>> getCategories();
  Future<void> updateStock(String productId, int newStock);
}
