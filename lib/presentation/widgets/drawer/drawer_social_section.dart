import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// Sosyal medya linki veri modeli.
class _SocialLink {
  final IconData icon;
  final String label;
  final String url;
  final Color color;

  const _SocialLink({
    required this.icon,
    required this.label,
    required this.url,
    required this.color,
  });
}

/// Drawer sosyal medya bölümü – 4 sosyal medya butonu.
class DrawerSocialSection extends StatelessWidget {
  const DrawerSocialSection({super.key});

  static const _links = [
    _SocialLink(
      icon: FontAwesomeIcons.facebook,
      label: 'Facebook',
      url: 'https://tr-tr.facebook.com/erzurumspor',
      color: Color(0xFF1877F2),
    ),
    _SocialLink(
      icon: FontAwesomeIcons.instagram,
      label: 'Instagram',
      url: 'https://instagram.com/erzurumspor',
      color: Color(0xFFE4405F),
    ),
    _SocialLink(
      icon: FontAwesomeIcons.xTwitter,
      label: 'X (Twitter)',
      url: 'https://twitter.com/erzurumspor',
      color: Color(0xFFFFFFFF),
    ),
    _SocialLink(
      icon: FontAwesomeIcons.youtube,
      label: 'YouTube',
      url: 'https://www.youtube.com/@erzurumsporfk4176',
      color: Color(0xFFFF0000),
    ),
  ];

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _links
          .map(
            (link) => Expanded(
              child: GestureDetector(
                onTap: () => _launch(link.url),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: link.color.withValues(alpha: 0.2)),
                  ),
                  child: Column(
                    children: [
                      FaIcon(link.icon, color: link.color, size: 20),
                      const SizedBox(height: 6),
                      Text(
                        link.label,
                        style: AppTextStyles.labelSm.copyWith(
                          fontSize: 9,
                          color: AppColors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
