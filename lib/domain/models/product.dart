/// Mağaza ürün modeli
class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final bool isNew;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    this.isNew = false,
  });

  String get formattedPrice {
    final intPrice = price.toInt();
    return '$intPrice TL';
  }
}
