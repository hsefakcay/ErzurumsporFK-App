import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../domain/models/staff_member.dart';

/// Destek ekibi listesi.
/// Doktor, fizyoterapist vb. personeli listeler.
class SupportStaffList extends StatelessWidget {
  final List<StaffMember> staff;

  const SupportStaffList({super.key, required this.staff});

  IconData _iconForRole(String role) {
    if (role.toUpperCase().contains('KULUP DOKTORU')) return Icons.health_and_safety;
    if (role.toUpperCase().contains('FİZYOTERAPİST')) return Icons.self_improvement;
    if (role.toUpperCase().contains('K')) return Icons.restaurant;
    return Icons.person;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: staff.asMap().entries.map((e) {
          final isLast = e.key == staff.length - 1;
          final s = e.value;
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: isLast
                ? null
                : BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.outline.withValues(alpha: 0.1)),
                    ),
                  ),
            child: Row(
              children: [
                Icon(_iconForRole(s.role), color: AppColors.onSurfaceVariant),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(s.name, style: AppTextStyles.bodyMd.copyWith(fontWeight: FontWeight.w600)),
                    Text(
                      s.role,
                      style: AppTextStyles.bodyMd.copyWith(
                        fontSize: 14,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
