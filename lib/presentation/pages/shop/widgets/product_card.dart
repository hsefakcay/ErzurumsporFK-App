import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/product.dart';

/// Product showcase card widget.
/// Displays product image and name without price information.
/// "Buy Now" button redirects to the external store website.
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  Future<void> _launchStore() async {
    final uri = Uri.parse(AppUrls.store);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Gold accent line at top
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, AppColors.primary, Colors.transparent],
              ),
            ),
          ),
          // Product image — fills card width
          AspectRatio(
            aspectRatio: 0.85,
            child: Stack(
              fit: StackFit.expand,
              children: [
                _buildProductImage(),
                if (product.isNew)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        'YENİ',
                        style: AppTextStyles.labelMd.copyWith(
                          fontSize: 9,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Product info section
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.name,
                  style: AppTextStyles.bodySm,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _launchStore,
                    icon: const Icon(Icons.shopping_bag_outlined, size: 14),
                    label: const Text('HEMEN AL', style: TextStyle(fontSize: 10)),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the product image widget.
  /// Uses local asset if available, otherwise falls back to a placeholder icon.
  Widget _buildProductImage() {
    if (product.isLocalAsset) {
      return Image.asset(
        product.localAssetPath!,
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (_, __, ___) => const Icon(Icons.image, color: AppColors.outline),
      );
    }
    // Fallback: placeholder for future network image support
    return const Icon(Icons.image, color: AppColors.outline);
  }
}
