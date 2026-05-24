import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/standing.dart';
import '../../../../domain/repositories/repositories.dart';
import '../../../widgets/common_widgets.dart';
import 'standings_row.dart';
import 'standings_legend.dart';

/// Puan durumu tablosu.
/// Tüm takımları sıralı olarak gösterir.
class StandingsTable extends StatefulWidget {
  final IStandingsRepository standingsRepository;

  const StandingsTable({super.key, required this.standingsRepository});

  @override
  State<StandingsTable> createState() => _StandingsTableState();
}

class _StandingsTableState extends State<StandingsTable> {
  late Future<List<Standing>> _standingsFuture;

  @override
  void initState() {
    super.initState();
    _standingsFuture = widget.standingsRepository.getStandings();
  }

  void _refresh() {
    setState(() {
      _standingsFuture = widget.standingsRepository.getStandings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Standing>>(
      future: _standingsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        if (snapshot.hasError) {
          return _ErrorWidget(onRetry: _refresh);
        }

        final standings = snapshot.data ?? [];
        if (standings.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                'Puan durumu bulunamadı.',
                style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
              ),
            ),
          );
        }

        return Column(
          children: [
            // Başlık
            Row(
              children: [
                const Icon(Icons.emoji_events, color: AppColors.primary),
                const SizedBox(width: 8),
                Text('Puan Durumu', style: AppTextStyles.headlineMd),
                const Spacer(),
                Text(
                  standings.first.season,
                  style: AppTextStyles.labelSm.copyWith(color: AppColors.onSurfaceVariant),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Tablo
            GlassCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  const _TableHeader(),
                  const Divider(height: 1, color: AppColors.outlineVariant, thickness: 0.5),
                  ...standings.asMap().entries.map((entry) {
                    final index = entry.key;
                    final standing = entry.value;
                    return Column(
                      children: [
                        StandingsRow(standing: standing),
                        if (index < standings.length - 1)
                          Divider(
                            height: 1,
                            color: AppColors.outlineVariant.withValues(alpha: 0.3),
                            thickness: 0.5,
                          ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const StandingsLegend(),
          ],
        );
      },
    );
  }
}

/// Tablo başlık satırı.
class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.labelSm.copyWith(
      color: AppColors.onSurfaceVariant,
      fontSize: 10,
      fontWeight: FontWeight.w600,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Row(
        children: [
          SizedBox(width: 24, child: Text('#', style: style)),
          Expanded(child: Text('TAKIM', style: style)),
          SizedBox(
            width: 28,
            child: Text('O', style: style, textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 28,
            child: Text('G', style: style, textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 28,
            child: Text('B', style: style, textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 28,
            child: Text('M', style: style, textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 32,
            child: Text('AV', style: style, textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 32,
            child: Text('P', style: style, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

/// Hata durumu widget'ı.
class _ErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const _ErrorWidget({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const Icon(Icons.cloud_off, color: AppColors.onSurfaceVariant, size: 48),
            const SizedBox(height: 16),
            Text(
              'Veri yüklenemedi',
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
            ),
            const SizedBox(height: 12),
            GoldButton(label: 'Tekrar Dene', onPressed: onRetry),
          ],
        ),
      ),
    );
  }
}
