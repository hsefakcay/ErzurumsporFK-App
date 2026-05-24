import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/repositories/repositories.dart';
import 'widgets/tab_button.dart';
import 'widgets/fixture_view.dart';
import 'widgets/standings_table.dart';

/// Fikstür ve Puan Durumu sayfası.
/// SRP: Sadece tab geçişlerini ve sayfa düzenini yönetir.
/// Alt widget'lar ayrı dosyalarda tanımlıdır.
class FixturePage extends StatefulWidget {
  final IMatchRepository matchRepository;
  final IStandingsRepository standingsRepository;

  const FixturePage({
    super.key,
    required this.matchRepository,
    required this.standingsRepository,
  });

  @override
  State<FixturePage> createState() => _FixturePageState();
}

class _FixturePageState extends State<FixturePage> {
  int _activeTab = 0; // 0: Fikstür, 1: Puan Durumu

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPageHeader(),
          const SizedBox(height: 24),
          _buildTabSwitcher(),
          const SizedBox(height: 24),
          _buildTabContent(),
        ],
      ),
    );
  }

  /// Sayfa başlığı.
  Widget _buildPageHeader() {
    return Center(
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(text: 'Sezon ', style: AppTextStyles.headlineXl),
                TextSpan(
                  text: 'Merkezi',
                  style: AppTextStyles.headlineXl.copyWith(color: AppColors.primary),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 8),
          Text('2025/2026 Trendyol 1. Lig', style: AppTextStyles.bodyLg),
        ],
      ),
    );
  }

  /// Tab seçici.
  Widget _buildTabSwitcher() {
    return Row(
      children: [
        Expanded(
          child: FixtureTabButton(
            icon: Icons.calendar_month,
            label: 'Fikstür',
            isActive: _activeTab == 0,
            onTap: () => setState(() => _activeTab = 0),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FixtureTabButton(
            icon: Icons.format_list_numbered,
            label: 'Puan Durumu',
            isActive: _activeTab == 1,
            onTap: () => setState(() => _activeTab = 1),
          ),
        ),
      ],
    );
  }

  /// Tab içeriği.
  Widget _buildTabContent() {
    if (_activeTab == 0) {
      return FixtureView(matchRepository: widget.matchRepository);
    }
    return StandingsTable(standingsRepository: widget.standingsRepository);
  }
}
