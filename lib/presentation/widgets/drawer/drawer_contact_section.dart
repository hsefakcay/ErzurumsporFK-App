import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// Drawer iletişim bölümü – Telefon, faks, e-posta, adres kartı.
class DrawerContactSection extends StatelessWidget {
  const DrawerContactSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryContainer.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kulüp adı
          Text('Erzurumspor FK', style: AppTextStyles.brandSubTitle),
          const SizedBox(height: 16),
          // Telefon
          _ContactRow(
            icon: Icons.phone_rounded,
            label: 'Telefon',
            value: '0442 233 63 61',
            onTap: () => _launch('tel:+904422336361'),
          ),
          const SizedBox(height: 12),
          // Faks
          const _ContactRow(icon: Icons.fax_rounded, label: 'Faks', value: '0442 234 56 12'),
          const SizedBox(height: 12),
          // E-posta
          _ContactRow(
            icon: Icons.email_rounded,
            label: 'E-Posta',
            value: 'info@erzurumsporfk.org',
            onTap: () => _launch('mailto:info@erzurumsporfk.org'),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 36),
            child: GestureDetector(
              onTap: () => _launch('mailto:b.bld.erzurumspor@hotmail.com'),
              child: Text(
                'b.bld.erzurumspor@hotmail.com',
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.secondary,
                  fontSize: 11,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.secondary.withValues(alpha: 0.4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Adres
          _ContactRow(
            icon: Icons.location_on_rounded,
            label: 'Adres',
            value: 'Ömer Nasuhi Bilmen Mah.\nFarabi Bulvarı No:8\nYakutiye / Erzurum',
            onTap: () => _launch(
              'https://maps.google.com/?q=Ömer+Nasuhi+Bilmen+Mahallesi+Farabi+Bulvarı+No:8+Yakutiye+Erzurum',
            ),
          ),
        ],
      ),
    );
  }
}

/// Tek bir iletişim satırı (ikon + etiket + değer).
class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _ContactRow({required this.icon, required this.label, required this.value, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: AppColors.primaryContainer, size: 14),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant.withValues(alpha: 0.6),
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: AppTextStyles.bodySm.copyWith(
                    color: onTap != null ? AppColors.secondary : AppColors.onSurface,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          if (onTap != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                Icons.open_in_new_rounded,
                color: AppColors.onSurfaceVariant.withValues(alpha: 0.3),
                size: 14,
              ),
            ),
        ],
      ),
    );
  }
}
