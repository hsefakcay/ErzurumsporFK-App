import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Puan durumu açıklama renkleri.
class StandingsLegend extends StatelessWidget {
  const StandingsLegend({super.key});

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.labelSm.copyWith(fontSize: 10);
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: [
        _LegendItem(color: const Color(0xFF22C55E), label: 'Direkt Çıkma', style: style),
        _LegendItem(color: const Color(0xFF3B82F6), label: 'Terfi Playoff', style: style),
        _LegendItem(color: const Color(0xFFF59E0B), label: 'Eleme Playoff', style: style),
        _LegendItem(color: const Color(0xFFEF4444), label: 'Küme Düşme', style: style),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final TextStyle style;

  const _LegendItem({required this.color, required this.label, required this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label, style: style),
      ],
    );
  }
}
