import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_constants.dart';

/// Erzurumspor FK özel AppBar widget'ı.
/// Menü butonu Scaffold'un endDrawer'ını açar.
class ErzurumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ErzurumAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.8),
        border: Border(
          bottom: BorderSide(color: AppColors.primaryContainer.withValues(alpha: 0.2)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(AppAssets.logoPath, width: 40, height: 40, fit: BoxFit.contain),
            ),
            const SizedBox(width: 8),
            Text(AppConstants.appName.toUpperCase(), style: AppTextStyles.brandTitle),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.onSurface),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ],
        ),
      ),
    );
  }
}
