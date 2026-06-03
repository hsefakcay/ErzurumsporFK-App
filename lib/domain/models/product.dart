/// Shop product model
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

  /// Whether the product image is a local asset.
  bool get isLocalAsset => localAssetPath != null;
}
