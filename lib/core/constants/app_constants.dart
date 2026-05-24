/// Uygulama sabitleri
abstract final class AppConstants {
  static const String appName = 'Erzurumspor FK';
  static const String teamShortName = 'ERZ';
  static const String leagueName = 'Trendyol 1. Lig';
  static const String season = '2023/2024';
  static const String stadiumName = 'Kazım Karabekir Stadyumu';
}

/// Asset yolları
abstract final class AppAssets {
  static const String logoPath = 'assets/images/erzurumspor_logo.png';
  static const String splashBgPath = 'assets/images/splash_bg.jpg';
  static const String wallpaper1 = 'assets/images/wallpaper1.png';
  static const String wallpaper2 = 'assets/images/wallpaper2.png';
  static const String wallpaper3 = 'assets/images/wallpaper3.png';

  /// Tüm duvar kağıtları listesi
  static const List<String> wallpapers = [wallpaper1, wallpaper2, wallpaper3];
}

/// Tasarım sabitleri (spacing, radius, vb.)
abstract final class AppSpacing {
  static const double unit = 8.0;
  static const double gutter = 24.0;
  static const double margin = 32.0;

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

abstract final class AppRadius {
  static const double sm = 2.0;
  static const double md = 6.0;
  static const double lg = 8.0;
  static const double xl = 12.0;
  static const double xxl = 16.0;
}
