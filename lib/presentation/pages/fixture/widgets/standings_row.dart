import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/standing.dart';

/// Puan durumu tablosundaki her bir takım satırı.
class StandingsRow extends StatelessWidget {
  final Standing standing;

  const StandingsRow({super.key, required this.standing});

  Color _getDescriptionColor() {
    final desc = standing.description?.toLowerCase() ?? '';
    if (desc.contains('promotion') && !desc.contains('playoff')) {
      return const Color(0xFF22C55E); // yeşil - direkt çıkma
    } else if (desc.contains('promotion playoff')) {
      return const Color(0xFF3B82F6); // mavi - playoff
    } else if (desc.contains('qualification playoff')) {
      return const Color(0xFFF59E0B); // turuncu - playoff
    } else if (desc.contains('relegation')) {
      return const Color(0xFFEF4444); // kırmızı - düşme
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final isErzurum = standing.isErzurumspor;
    final descColor = _getDescriptionColor();

    final textStyle = AppTextStyles.bodyMd.copyWith(
      fontSize: 12,
      fontWeight: isErzurum ? FontWeight.w700 : FontWeight.w400,
      color: isErzurum ? AppColors.primary : AppColors.onSurface,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isErzurum ? AppColors.primary.withValues(alpha: 0.08) : Colors.transparent,
      ),
      child: Row(
        children: [
          // Sıra + açıklama rengi
          SizedBox(
            width: 24,
            child: Row(
              children: [
                if (descColor != Colors.transparent)
                  Container(
                    width: 3,
                    height: 16,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: descColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                Expanded(
                  child: Text(
                    '${standing.rank}',
                    style: textStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          // Takım adı + logo
          Expanded(
            child: Row(
              children: [
                if (standing.badgeUrl != null && standing.badgeUrl!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: CachedNetworkImage(
                      imageUrl: standing.badgeUrl!,
                      width: 20,
                      height: 20,
                      placeholder: (_, __) => const SizedBox(width: 20, height: 20),
                      errorWidget: (_, __, ___) => Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.surfaceContainer,
                        ),
                        child: Center(
                          child: Text(
                            standing.teamName.isNotEmpty ? standing.teamName[0] : '?',
                            style: textStyle.copyWith(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: Text(
                    standing.teamName,
                    style: textStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          // İstatistikler
          SizedBox(
            width: 28,
            child: Text('${standing.played}', style: textStyle, textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 28,
            child: Text('${standing.won}', style: textStyle, textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 28,
            child: Text('${standing.drawn}', style: textStyle, textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 28,
            child: Text('${standing.lost}', style: textStyle, textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 32,
            child: Text(
              standing.goalDifference > 0
                  ? '+${standing.goalDifference}'
                  : '${standing.goalDifference}',
              style: textStyle.copyWith(
                color: standing.goalDifference > 0
                    ? const Color(0xFF22C55E)
                    : standing.goalDifference < 0
                        ? const Color(0xFFEF4444)
                        : AppColors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 32,
            child: Text(
              '${standing.points}',
              style: textStyle.copyWith(
                fontWeight: FontWeight.w800,
                color: isErzurum ? AppColors.primary : AppColors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
