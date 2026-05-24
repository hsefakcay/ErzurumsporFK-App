import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Tipografi tanımları - Lexend (headline/label) + Inter (body).
abstract final class AppTextStyles {
  static TextStyle get headlineXl => GoogleFonts.lexend(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 56 / 48,
    letterSpacing: -0.02 * 48,
    color: AppColors.onSurface,
  );

  static TextStyle get headlineLg => GoogleFonts.lexend(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 40 / 32,
    letterSpacing: -0.01 * 32,
    color: AppColors.onSurface,
  );

  static TextStyle get headlineMd => GoogleFonts.lexend(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    color: AppColors.onSurface,
  );

  static TextStyle get bodyLg => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 28 / 18,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle get bodyMd => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: AppColors.onSurface,
  );

  static TextStyle get bodySm =>
      GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.onSurface);

  static TextStyle get labelSm => GoogleFonts.lexend(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.onSurfaceVariant,
  );
  static TextStyle get labelMd => GoogleFonts.lexend(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    letterSpacing: 0.05 * 14,
    color: AppColors.primary,
  );

  static TextStyle get labelLarge => GoogleFonts.lexend(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
    color: AppColors.onSurface,
  );

  static TextStyle get brandTitle => GoogleFonts.lexend(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    letterSpacing: 3,
    color: AppColors.primaryContainer,
  );
  static TextStyle get brandSubTitle => GoogleFonts.lexend(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    letterSpacing: 2,
    color: AppColors.primaryContainer,
  );
}
