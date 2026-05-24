import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/product.dart';
import '../../../widgets/common_widgets.dart';

/// Mağaza sayfasındaki öne çıkan ürün banner'ı.
class ShopBanner extends StatelessWidget {
  final Product product;

  const ShopBanner({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bannerHeight = (screenHeight * 0.45).clamp(280.0, 420.0);

    return Container(
      height: bannerHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.8),
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Ürün görseli
          CachedNetworkImage(
            imageUrl: product.imageUrl,
            fit: BoxFit.cover,
            alignment: Alignment.centerRight,
            placeholder: (_, __) => Container(color: AppColors.surfaceContainer),
            errorWidget: (_, __, ___) => Container(color: AppColors.surfaceContainer),
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.background,
                  AppColors.background.withValues(alpha: 0.8),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Gold thread
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.primary,
                  AppColors.tertiaryFixed,
                  Colors.transparent,
                ]),
              ),
            ),
          ),
          // İçerik
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 24, height: 1, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Text(
                        'YENİ SEZON',
                        style: AppTextStyles.labelMd.copyWith(
                          color: AppColors.primary,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('24/25 İç\nSaha\nForması', style: AppTextStyles.headlineLg),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      'Karanlıktan doğan güç. Yeni sezon iç saha forması ile takımını destekle.',
                      style: AppTextStyles.bodyMd.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 13,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GoldButton(label: 'Hemen Al', icon: Icons.shopping_bag, onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
