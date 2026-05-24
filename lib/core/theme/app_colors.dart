import 'package:flutter/material.dart';

/// Erzurumspor FK Prestige tasarım sistemi renk paleti.
/// Material Design 3 token isimlendirmesine uygun.
abstract final class AppColors {
  // Primary
  static const Color primary = Color(0xFFF2CA50);
  static const Color onPrimary = Color(0xFF3C2F00);
  static const Color primaryContainer = Color(0xFFD4AF37);
  static const Color onPrimaryContainer = Color(0xFF554300);
  static const Color inversePrimary = Color(0xFF735C00);
  static const Color primaryFixed = Color(0xFFFFE088);
  static const Color primaryFixedDim = Color(0xFFE9C349);
  static const Color onPrimaryFixed = Color(0xFF241A00);
  static const Color onPrimaryFixedVariant = Color(0xFF574500);

  // Secondary
  static const Color secondary = Color(0xFFAFC8F0);
  static const Color onSecondary = Color(0xFF163152);
  static const Color secondaryContainer = Color(0xFF2F486A);
  static const Color onSecondaryContainer = Color(0xFF9EB7DE);
  static const Color secondaryFixed = Color(0xFFD4E3FF);
  static const Color secondaryFixedDim = Color(0xFFAFC8F0);
  static const Color onSecondaryFixed = Color(0xFF001C3A);
  static const Color onSecondaryFixedVariant = Color(0xFF2F486A);

  // Tertiary
  static const Color tertiary = Color(0xFFF3CA50);
  static const Color onTertiary = Color(0xFF3D2F00);
  static const Color tertiaryContainer = Color(0xFFD5AF37);
  static const Color onTertiaryContainer = Color(0xFF564300);
  static const Color tertiaryFixed = Color(0xFFFFE08B);
  static const Color tertiaryFixedDim = Color(0xFFEAC249);
  static const Color onTertiaryFixed = Color(0xFF241A00);
  static const Color onTertiaryFixedVariant = Color(0xFF584400);

  // Error
  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);
  static const Color onErrorContainer = Color(0xFFFFDAD6);

  // Surface & Background
  static const Color surface = Color(0xFF131313);
  static const Color surfaceDim = Color(0xFF131313);
  static const Color surfaceBright = Color(0xFF3A3939);
  static const Color surfaceContainerLowest = Color(0xFF0E0E0E);
  static const Color surfaceContainerLow = Color(0xFF1C1B1B);
  static const Color surfaceContainer = Color(0xFF201F1F);
  static const Color surfaceContainerHigh = Color(0xFF2A2A2A);
  static const Color surfaceContainerHighest = Color(0xFF353534);
  static const Color onSurface = Color(0xFFE5E2E1);
  static const Color onSurfaceVariant = Color(0xFFD0C5AF);
  static const Color inverseSurface = Color(0xFFE5E2E1);
  static const Color inverseOnSurface = Color(0xFF313030);
  static const Color surfaceTint = Color(0xFFE9C349);
  static const Color surfaceVariant = Color(0xFF353534);
  static const Color background = Color(0xFF131313);
  static const Color onBackground = Color(0xFFE5E2E1);

  // Outline
  static const Color outline = Color(0xFF99907C);
  static const Color outlineVariant = Color(0xFF4D4635);

  // Gold gradient colors
  static const Color goldStart = Color(0xFFD4AF37);
  static const Color goldEnd = Color(0xFFC5A028);

  // Transparent overlays
  static const Color blackOverlay60 = Color(0x99000000);
  static const Color blackOverlay40 = Color(0x66000000);
  static const Color blackOverlay20 = Color(0x33000000);
  static const Color primaryOverlay10 = Color(0x1AF2CA50);
  static const Color primaryOverlay20 = Color(0x33F2CA50);
  static const Color primaryOverlay30 = Color(0x4DF2CA50);
}
