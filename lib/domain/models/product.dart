/// Mağaza ürün modeli
class Product {
  final String id;
  final String name;
  final String category;
  final double? price;
  final String? imageUrl;
  final String? localAssetPath;
  final String? description;
  final bool isNew;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    this.price,
    this.imageUrl,
    this.localAssetPath,
    this.description,
    this.isNew = false,
  });

  String? get formattedPrice {
    if (price == null) return null;
    final intPrice = price!.toInt();
    return '$intPrice TL';
  }

  /// Ürünün görseli local asset mi?
  bool get isLocalAsset => localAssetPath != null;
}
