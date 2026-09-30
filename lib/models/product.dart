
class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl = '',
    required this.category,
    required this.stock,
  });
}

class DiscountedProduct extends Product {
  final int discountPercent;

  const DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    super.imageUrl = '',
    required super.category,
    required super.stock,
    required this.discountPercent,
  });
}