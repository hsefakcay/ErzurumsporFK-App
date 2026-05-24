import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/match.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/team_logo.dart';
import '../utils/date_utils.dart';

/// Fikstür listesindeki maç satırı.
/// Kompakt bir şekilde maç bilgilerini gösterir.
class FixtureListItem extends StatelessWidget {
  final Match match;

  const FixtureListItem({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          // Tarih bilgisi
          SizedBox(
            width: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${match.matchDate.day} ${monthShort(match.matchDate.month)}',
                  style: AppTextStyles.labelMd.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '${match.matchDate.hour.toString().padLeft(2, '0')}:${match.matchDate.minute.toString().padLeft(2, '0')}',
                  style: AppTextStyles.bodyMd.copyWith(
                    color: AppColors.onSurface.withValues(alpha: 0.7),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          // Takım bilgileri
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    match.homeTeamShort,
                    style: AppTextStyles.labelMd.copyWith(
                      color: match.isHome
                          ? AppColors.primary
                          : AppColors.onSurface.withValues(alpha: 0.8),
                      fontWeight: match.isHome ? FontWeight.bold : FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 6),
                  TeamLogo(
                    url: match.homeTeamLogoUrl,
                    isErzurum: match.homeTeam.toLowerCase().contains('erzurum'),
                    size: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      '-',
                      style: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                  ),
                  TeamLogo(
                    url: match.awayTeamLogoUrl,
                    isErzurum: match.awayTeam.toLowerCase().contains('erzurum'),
                    size: 28,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    match.awayTeamShort,
                    style: AppTextStyles.labelMd.copyWith(
                      color: !match.isHome
                          ? AppColors.primary
                          : AppColors.onSurface.withValues(alpha: 0.8),
                      fontWeight: !match.isHome ? FontWeight.bold : FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant, size: 20),
        ],
      ),
    );
  }
}
