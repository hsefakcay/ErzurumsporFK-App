import 'package:flutter/material.dart';
import '../../../domain/models/product.dart';
import '../../../domain/repositories/repositories.dart';
import 'widgets/shop_banner.dart';
import 'widgets/product_card.dart';

/// Shop page — product showcase layout.
/// SRP: Only manages the shop page layout.
/// Sub-widgets are defined in separate files.
class ShopPage extends StatelessWidget {
  final IShopRepository shopRepository;

  const ShopPage({super.key, required this.shopRepository});

  @override
  Widget build(BuildContext context) {
    final products = shopRepository.getProducts();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Auto-rotating product carousel banner
          if (products.isNotEmpty) ShopBanner(products: products),
          const SizedBox(height: 20),
          // Product grid
          _buildProductGrid(products),
        ],
      ),
    );
  }

  /// Responsive product grid layout.
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
