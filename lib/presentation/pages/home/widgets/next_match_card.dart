import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/match.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/team_logo.dart';

/// Ana sayfadaki sıradaki maç kartı.
/// Geri sayım, takım logoları ve maç bilgilerini gösterir.
class NextMatchCard extends StatelessWidget {
  final Match match;

  const NextMatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final diff = match.matchDate.difference(DateTime.now());
    final days = diff.inDays.clamp(0, 99).toString().padLeft(2, '0');
    final hours = (diff.inHours % 24).clamp(0, 23).toString().padLeft(2, '0');
    final mins = (diff.inMinutes % 60).clamp(0, 59).toString().padLeft(2, '0');

    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Lig ve hafta bilgisi
          Text(
            '${match.league} - ${match.week}. Hafta',
            style: AppTextStyles.labelMd.copyWith(color: AppColors.primary, letterSpacing: 2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          // Stadyum bilgisi
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, size: 14, color: AppColors.onSurfaceVariant),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  match.stadium,
                  style: AppTextStyles.bodyMd.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Tarih
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(_formatFullDate(match.matchDate), style: AppTextStyles.headlineMd),
          ),
          const SizedBox(height: 16),
          // Takımlar
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.surfaceBright.withValues(alpha: 0.5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TeamLogo(
                        url: match.homeTeamLogoUrl,
                        isErzurum: match.homeTeam.toLowerCase().contains('erzurum'),
                        size: 48,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        match.homeTeamShort,
                        style: AppTextStyles.headlineMd.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'VS',
                    style: AppTextStyles.headlineLg.copyWith(
                      color: AppColors.primaryContainer,
                      fontSize: 24,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TeamLogo(
                        url: match.awayTeamLogoUrl,
                        isErzurum: match.awayTeam.toLowerCase().contains('erzurum'),
                        size: 48,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        match.awayTeamShort,
                        style: AppTextStyles.headlineMd.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Geri sayım
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CountdownDigit(value: days, label: 'GÜN'),
                const _CountdownSeparator(),
                _CountdownDigit(value: hours, label: 'SAAT'),
                const _CountdownSeparator(),
                _CountdownDigit(value: mins, label: 'DAK'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatFullDate(DateTime d) {
    const months = [
      'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran',
      'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık',
    ];
    const days = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar'];
    return '${d.day} ${months[d.month - 1]} ${days[d.weekday - 1]}, ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
  }
}

/// Geri sayım rakam kutusu.
class _CountdownDigit extends StatelessWidget {
  final String value;
  final String label;

  const _CountdownDigit({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: AppTextStyles.headlineXl.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTextStyles.labelMd.copyWith(fontSize: 10, color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

/// Geri sayım ayırıcısı (iki nokta üst üste).
class _CountdownSeparator extends StatelessWidget {
  const _CountdownSeparator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 6, right: 6),
      child: Text(':', style: AppTextStyles.headlineLg.copyWith(color: AppColors.surfaceBright)),
    );
  }
}
