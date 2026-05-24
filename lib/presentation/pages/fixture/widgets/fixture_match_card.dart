import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/match.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/team_logo.dart';
import '../utils/date_utils.dart';

/// Fikstür sayfasındaki ana maç kartı.
/// Sıradaki maçı detaylı olarak gösterir.
class FixtureMatchCard extends StatelessWidget {
  final Match match;

  const FixtureMatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Hafta ve tarih etiketi
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Hafta ${match.week} • ${formatDate(match.matchDate)}',
                style: AppTextStyles.labelMd.copyWith(color: AppColors.primary),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Takımlar
          Row(
            children: [
              // Ev sahibi
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TeamLogo(
                      url: match.homeTeamLogoUrl,
                      isErzurum: match.homeTeam.toLowerCase().contains('erzurum'),
                      size: 56,
                    ),
                    const SizedBox(height: 6),
                    Text(match.homeTeamShort, style: AppTextStyles.headlineMd.copyWith(fontSize: 18)),
                  ],
                ),
              ),
              // VS
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'VS',
                      style: AppTextStyles.headlineLg.copyWith(
                        color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      match.stadium,
                      style: AppTextStyles.bodyMd.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 11,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Deplasman
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TeamLogo(
                      url: match.awayTeamLogoUrl,
                      isErzurum: match.awayTeam.toLowerCase().contains('erzurum'),
                      size: 56,
                    ),
                    const SizedBox(height: 6),
                    Text(match.awayTeamShort, style: AppTextStyles.headlineMd.copyWith(fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GoldButton(label: 'Bilet Al', onPressed: () {}),
        ],
      ),
    );
  }
}
