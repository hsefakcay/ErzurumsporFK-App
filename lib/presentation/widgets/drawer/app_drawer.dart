import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import 'drawer_contact_section.dart';
import 'drawer_header.dart';
import 'drawer_menu_section.dart';
import 'drawer_social_section.dart';
import 'drawer_utils.dart';

/// Erzurumspor FK yan menü (drawer) widget'ı.
/// Menü, sosyal medya ve iletişim bölümlerini bir araya getirir.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xF0101014),
          border: Border(
            left: BorderSide(color: AppColors.primaryContainer.withValues(alpha: 0.25)),
          ),
        ),
        child: const SafeArea(
          child: Column(
            children: [
              AppDrawerHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Menü ──
                      DrawerSectionTitle('MENÜ'),
                      DrawerMenuSection(),
                      SizedBox(height: 24),
                      DrawerDivider(),
                      SizedBox(height: 24),

                      // ── Sosyal Medya ──
                      DrawerSectionTitle('SOSYAL MEDYA'),
                      SizedBox(height: 8),
                      DrawerSocialSection(),
                      SizedBox(height: 24),
                      DrawerDivider(),
                      SizedBox(height: 24),

                      // ── İletişim ──
                      DrawerSectionTitle('İLETİŞİM'),
                      SizedBox(height: 12),
                      DrawerContactSection(),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
