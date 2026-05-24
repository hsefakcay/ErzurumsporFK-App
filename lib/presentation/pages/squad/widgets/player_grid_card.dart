import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/player.dart';
import '../../../widgets/common_widgets.dart';

/// Oyuncu grid kartı.
/// 2 sütunlu grid'de her bir oyuncuyu gösterir.
class PlayerGridCard extends StatelessWidget {
  final Player player;

  const PlayerGridCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.72,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.surfaceContainer,
          border: Border.all(
            color: player.isCaptain
                ? AppColors.primary.withValues(alpha: 0.4)
                : AppColors.outline.withValues(alpha: 0.15),
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Kaptan gold thread
            if (player.isCaptain)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(height: 2, color: AppColors.primary),
              ),
            // Oyuncu görseli
            CachedNetworkImage(
              imageUrl: player.imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              placeholder: (_, __) => Container(color: AppColors.surfaceContainer),
              errorWidget: (_, __, ___) => Container(
                color: AppColors.surfaceContainer,
                child: const Icon(Icons.person, color: AppColors.outline, size: 40),
              ),
            ),
            // Forma numarası watermark
            Positioned(
              top: 6,
              right: 8,
              child: Text(
                '${player.jerseyNumber}'.padLeft(2, '0'),
                style: AppTextStyles.headlineLg.copyWith(
                  fontSize: 28,
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
            ),
            // Kaptan rozeti
            if (player.isCaptain)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'C',
                    style: AppTextStyles.labelMd.copyWith(
                      fontSize: 10,
                      color: AppColors.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            // Pozisyon bilgisi
            Positioned(
              bottom: 32,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [PositionChip(label: player.position)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
