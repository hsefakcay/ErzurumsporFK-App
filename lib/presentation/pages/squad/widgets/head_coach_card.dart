import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../domain/models/staff_member.dart';

/// Teknik direktör kartı.
/// Teknik heyetin başındaki kişiyi büyük ve merkezi olarak gösterir.
class HeadCoachCard extends StatelessWidget {
  final StaffMember staff;

  const HeadCoachCard({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: staff.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(color: AppColors.surfaceContainer),
                  errorWidget: (_, __, ___) => Container(color: AppColors.surfaceContainer),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
