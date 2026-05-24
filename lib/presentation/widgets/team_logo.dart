import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/app_colors.dart';

/// Takım logosu widget'ı.
/// Hem Home hem Fixture sayfalarında ortak kullanılır.
class TeamLogo extends StatelessWidget {
  final String? url;
  final bool isErzurum;
  final double size;

  const TeamLogo({super.key, this.url, required this.isErzurum, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.surfaceContainer,
        border: Border.all(
          color: isErzurum ? AppColors.primary : AppColors.outlineVariant,
          width: isErzurum ? 1.5 : 1,
        ),
      ),
      padding: EdgeInsets.all(isErzurum ? size * 0.1 : 0),
      child: ClipOval(
        child: isErzurum && url == null
            ? Image.asset('assets/images/erzurumspor_logo.png', fit: BoxFit.contain)
            : url != null
                ? CachedNetworkImage(
                    imageUrl: url!,
                    fit: BoxFit.contain,
                    placeholder: (_, __) => const SizedBox(),
                    errorWidget: (_, __, ___) => FallbackIcon(size: size),
                  )
                : FallbackIcon(size: size),
      ),
    );
  }
}

/// Takım logosu bulunamadığında gösterilen yedek ikon.
class FallbackIcon extends StatelessWidget {
  final double size;
  const FallbackIcon({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.shield_outlined,
        size: size * 0.5,
        color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
      ),
    );
  }
}
