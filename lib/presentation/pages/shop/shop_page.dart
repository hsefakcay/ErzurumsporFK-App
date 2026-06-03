import 'package:flutter/material.dart';
import '../../../domain/models/product.dart';
import '../../../domain/repositories/repositories.dart';
import 'widgets/shop_banner.dart';
import 'widgets/product_card.dart';

/// Mağaza sayfası.
/// SRP: Sadece mağaza sayfasının düzenini (layout) yönetir.
/// Ürünleri fiyat göstermeden tanıtım (showcase) olarak listeler.
/// "Hemen Al" butonu dış mağaza sitesine yönlendirir.
class ShopPage extends StatelessWidget {
  final IShopRepository shopRepository;

  const ShopPage({super.key, required this.shopRepository});

  @override
  Widget build(BuildContext context) {
    final products = shopRepository.getProducts();
    final featured = shopRepository.getFeaturedProduct();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Öne çıkan ürün banner'ı (Efsane Çubuklu Forma)
          if (featured != null) ShopBanner(product: featured),
          const SizedBox(height: 20),
          // Ürün grid'i
          _buildProductGrid(products),
        ],
      ),
    );
  }

  /// Ürün grid layout'u.
  Widget _buildProductGrid(List<Product> products) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
        final spacing = 12.0;
        final cardWidth =
            (constraints.maxWidth - spacing * (crossAxisCount - 1)) / crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: products
              .map(
                (p) => SizedBox(
                  width: cardWidth,
                  child: ProductCard(product: p),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
