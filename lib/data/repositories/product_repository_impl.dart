import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../mock/mock_data.dart';

/// Mock implementation — remplacer par les appels API réels
class ProductRepositoryImpl implements ProductRepository {
  final List<Product> _products = List.from(MockData.products);

  @override
  Future<List<Product>> getProducts({
    String? categoryId,
    String? searchQuery,
  }) async {
    // TODO: remplacer par appel API avec filtres
    await Future.delayed(const Duration(milliseconds: 500));
    var result = List<Product>.from(_products);
    if (categoryId != null) {
      result = result.where((p) => p.categoryId == categoryId).toList();
    }
    if (searchQuery != null && searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      result = result
          .where((p) =>
              p.name.toLowerCase().contains(query) ||
              p.description.toLowerCase().contains(query))
          .toList();
    }
    return result;
  }

  @override
  Future<Product> getProductById(String id) async {
    // TODO: remplacer par appel API
    await Future.delayed(const Duration(milliseconds: 300));
    return _products.firstWhere(
      (p) => p.id == id,
      orElse: () => throw Exception('Produit introuvable'),
    );
  }

  @override
  Future<List<Category>> getCategories() async {
    // TODO: remplacer par appel API
    await Future.delayed(const Duration(milliseconds: 300));
    return MockData.categories;
  }

  @override
  Future<void> updateStock(String productId, int newStock) async {
    // TODO: remplacer par appel API
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      _products[index] = _products[index].copyWith(stock: newStock);
    }
  }
}
