class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final List<String> features;
  final String imageUrl;
  final int stock;
  final String categoryId;
  final double rating;
  final int reviewCount;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    this.features = const [],
    required this.imageUrl,
    required this.stock,
    required this.categoryId,
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  bool get isInStock => stock > 0;
  bool get isLowStock => stock > 0 && stock <= 5;
  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  int get discountPercent {
    if (!hasDiscount) return 0;
    return (((originalPrice! - price) / originalPrice!) * 100).round();
  }

  Product copyWith({int? stock}) {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      originalPrice: originalPrice,
      features: features,
      imageUrl: imageUrl,
      stock: stock ?? this.stock,
      categoryId: categoryId,
      rating: rating,
      reviewCount: reviewCount,
    );
  }
}
