import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../pages/wallpapers/wallpapers_page.dart';

/// Menü öğesi veri modeli.
class DrawerMenuItem {
  final String label;
  final void Function(BuildContext)? onTap;

  const DrawerMenuItem({required this.label, this.onTap});
}

/// Drawer menü bölümü – Navigasyon linkleri listesi.
class DrawerMenuSection extends StatelessWidget {
  const DrawerMenuSection({super.key});

  static final _items = [
    DrawerMenuItem(
      label: 'Duvar Kağıtları',
      onTap: (context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const WallpapersPage()),
      ),
    ),
    const DrawerMenuItem(label: 'Yönetim Kurulu'),
    const DrawerMenuItem(label: 'Tesisler'),
    const DrawerMenuItem(label: 'Başarılar'),
    const DrawerMenuItem(label: 'Hakkımızda'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _items.map((item) => _MenuItemTile(item: item)).toList(),
    );
  }
}

/// Tek bir menü satırı.
class _MenuItemTile extends StatelessWidget {
  final DrawerMenuItem item;

  const _MenuItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: item.onTap != null ? () => item.onTap!(context) : null,
          borderRadius: BorderRadius.circular(10),
          splashColor: AppColors.primary.withValues(alpha: 0.08),
          highlightColor: AppColors.primary.withValues(alpha: 0.04),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.label,
                    style: AppTextStyles.labelMd.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.onSurfaceVariant.withValues(alpha: 0.4),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
