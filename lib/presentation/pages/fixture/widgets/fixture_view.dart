import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/match.dart';
import '../../../../domain/repositories/repositories.dart';
import 'fixture_match_card.dart';
import 'fixture_list_item.dart';

/// Fikstür sekmesi görünümü.
/// Sıradaki maçı ve gelecek maçları listeler.
class FixtureView extends StatelessWidget {
  final IMatchRepository matchRepository;

  const FixtureView({super.key, required this.matchRepository});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        matchRepository.getNextMatch(),
        matchRepository.getUpcomingMatches(),
      ]),
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
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                'Fikstür yüklenemedi',
                style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
              ),
            ),
          );
        }

        final nextMatch = snapshot.data?[0] as Match?;
        final upcoming = snapshot.data?[1] as List<Match>? ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sıradaki maç başlığı
            Row(
              children: [
                const Icon(Icons.event_available, color: AppColors.primary),
                const SizedBox(width: 8),
                Flexible(child: Text('Sıradaki Maç', style: AppTextStyles.headlineMd)),
              ],
            ),
            const SizedBox(height: 16),
            if (nextMatch != null)
              FixtureMatchCard(match: nextMatch)
            else
              Text(
                'Planlanmış maç bulunamadı',
                style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
              ),
            const SizedBox(height: 24),
            // Gelecek fikstür başlığı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text('Gelecek Fikstür', style: AppTextStyles.headlineMd)),
                TextButton(
                  onPressed: () {},
                  child: Text('Tümü', style: AppTextStyles.labelMd),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (upcoming.isEmpty)
              Text(
                'Gelecek maç bulunamadı',
                style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
              )
            else
              ...upcoming.map(
                (m) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: FixtureListItem(match: m),
                ),
              ),
          ],
        );
      },
    );
  }
}
