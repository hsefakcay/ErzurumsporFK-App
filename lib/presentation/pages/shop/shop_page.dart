import 'package:flutter/material.dart';
import '../../../domain/models/product.dart';
import '../../../domain/repositories/repositories.dart';
import '../../widgets/common_widgets.dart';
import 'widgets/shop_banner.dart';
import 'widgets/product_card.dart';

/// Mağaza sayfası.
/// SRP: Sadece mağaza sayfasının düzenini (layout) yönetir.
/// Alt widget'lar ayrı dosyalarda tanımlıdır.
class ShopPage extends StatefulWidget {
  final IShopRepository shopRepository;

  const ShopPage({super.key, required this.shopRepository});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String _selectedCategory = 'Tümü';

  @override
  Widget build(BuildContext context) {
    final categories = widget.shopRepository.getCategories();
    final products = widget.shopRepository.getProductsByCategory(_selectedCategory);
    final featured = widget.shopRepository.getFeaturedProduct();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Öne çıkan ürün banner'ı
          if (featured != null) ShopBanner(product: featured),
          const SizedBox(height: 20),
          // Kategori filtreleri
          _buildCategoryFilters(categories),
          const SizedBox(height: 20),
          // Ürün grid'i
          _buildProductGrid(products),
        ],
      ),
    );
  }

  /// Kategori chip'leri.
  Widget _buildCategoryFilters(List<String> categories) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) => CategoryChip(
          label: categories[i],
          isSelected: categories[i] == _selectedCategory,
          onTap: () => setState(() => _selectedCategory = categories[i]),
        ),
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
