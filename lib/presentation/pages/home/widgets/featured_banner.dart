import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/news_article.dart';
import '../../../widgets/common_widgets.dart';

/// Ana sayfadaki öne çıkan haber banner'ı.
/// Tam ekran genişliğinde, gradient overlay ve CTA butonu içerir.
class FeaturedBanner extends StatelessWidget {
  final NewsArticle article;

  const FeaturedBanner({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bannerHeight = (screenHeight * 0.5).clamp(320.0, 500.0);

    return Container(
      height: bannerHeight,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.8),
            blurRadius: AppRadius.xxl,
            offset: const Offset(0, 110),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Arka plan görseli
          CachedNetworkImage(
            imageUrl: article.imageUrl,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(color: AppColors.surfaceContainer),
            errorWidget: (_, __, ___) => Container(color: AppColors.surfaceContainer),
          ),
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.surfaceContainerLowest.withValues(alpha: 0.3),
                  AppColors.surfaceContainerLowest,
                ],
              ),
            ),
          ),
          // Üst gold thread
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.primary.withValues(alpha: 0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // İçerik
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  PositionChip(label: article.category),
                  Text(
                    article.title,
                    style: AppTextStyles.headlineLg,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    article.content ?? "",
                    style: AppTextStyles.labelSm,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.md),
                  GoldButton(label: 'Detayları Gör', icon: Icons.arrow_forward, onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
