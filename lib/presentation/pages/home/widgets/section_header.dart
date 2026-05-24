import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Bölüm başlığı widget'ı.
/// Her bölümün üstünde ikon + başlık + opsiyonel trailing gösterir.
class SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;

  const SectionHeader({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primaryContainer, size: 28),
        const SizedBox(width: 12),
        Expanded(child: Text(title, style: AppTextStyles.headlineMd)),
        if (trailing != null) trailing!,
      ],
    );
  }
}
