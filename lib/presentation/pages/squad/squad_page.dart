import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/models/player.dart';
import '../../../domain/models/staff_member.dart';
import '../../../domain/repositories/repositories.dart';
import 'widgets/player_grid_card.dart';
import 'widgets/head_coach_card.dart';
import 'widgets/staff_list_item.dart';

class SquadPage extends StatefulWidget {
  final ISquadRepository squadRepository;
  const SquadPage({super.key, required this.squadRepository});

  @override
  State<SquadPage> createState() => _SquadPageState();
}

class _SquadPageState extends State<SquadPage> {
  late Future<List<dynamic>> _squadFuture;

  @override
  void initState() {
    super.initState();
    _squadFuture = Future.wait([
      widget.squadRepository.getPlayers(),
      widget.squadRepository.getTechnicalStaff(),
      widget.squadRepository.getSupportStaff(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _squadFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Veriler yüklenirken bir hata oluştu.',
              style: AppTextStyles.bodyLg.copyWith(color: Colors.redAccent),
            ),
          );
        }

        final data = snapshot.data;
        if (data == null || data.isEmpty) {
          return const SizedBox.shrink();
        }

        final players = data[0] as List<Player>;
        final techStaff = data[1] as List<StaffMember>;
        final supportStaff = data[2] as List<StaffMember>;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSquadHeader(),
              const SizedBox(height: 16),
              _buildPlayersSection(players),
              const SizedBox(height: 24),
              _buildTechnicalStaffSection(techStaff),
              const SizedBox(height: 24),
              _buildSupportStaffSection(supportStaff),
            ],
          ),
        );
      },
    );
  }

  /// Kadro başlığı.
  Widget _buildSquadHeader() {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.primary.withValues(alpha: 0.2))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('A Takım Kadrosu', style: AppTextStyles.headlineLg),
          const SizedBox(height: 4),
          Text(
            '2025-2026 Sezonu şampiyonluk yolundaki Erzurumspor FK savaşçıları.',
            style: AppTextStyles.bodyMd,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  /// Futbolcular bölümü.
  Widget _buildPlayersSection(List<Player> players) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.groups, color: AppColors.primary, size: 32),
            const SizedBox(width: 12),
            Text('Futbolcular', style: AppTextStyles.headlineLg),
          ],
        ),
        const SizedBox(height: 16),
        if (players.isEmpty)
          Text('Henüz oyuncu eklenmedi.', style: AppTextStyles.bodyMd)
        else
          LayoutBuilder(
            builder: (context, constraints) {
              const spacing = 12.0;
              final cardWidth = (constraints.maxWidth - spacing) / 2;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: players
                    .map(
                      (p) => SizedBox(
                        width: cardWidth,
                        child: PlayerGridCard(player: p),
                      ),
                    )
                    .toList(),
              );
            },
          ),
      ],
    );
  }

  /// Teknik heyet bölümü.
  Widget _buildTechnicalStaffSection(List<StaffMember> techStaff) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.psychology, color: AppColors.primary, size: 30),
            const SizedBox(width: 12),
            Text('Teknik Kadro', style: AppTextStyles.headlineLg),
          ],
        ),
        const SizedBox(height: 12),
        if (techStaff.isNotEmpty)
          HeadCoachCard(staff: techStaff.firstWhere((s) => s.role == 'Teknik Direktör')),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            const spacing = 12.0;
            final cardWidth = (constraints.maxWidth - spacing) / 2;
            final otherStaff = techStaff.where((s) => s.role != 'Teknik Direktör').toList();

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: otherStaff
                  .map(
                    (s) => SizedBox(
                      width: cardWidth,
                      child: StaffListItem(staff: s),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  /// Destek ekibi bölümü.
  Widget _buildSupportStaffSection(List<StaffMember> supportStaff) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.medical_services, color: AppColors.primary, size: 30),
            const SizedBox(width: 12),
            Text('Destek Ekibi', style: AppTextStyles.headlineLg),
          ],
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            const spacing = 12.0;
            final cardWidth = (constraints.maxWidth - spacing) / 2;
            final otherStaff = supportStaff.toList();

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: otherStaff
                  .map(
                    (s) => SizedBox(
                      width: cardWidth,
                      child: StaffListItem(staff: s),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
