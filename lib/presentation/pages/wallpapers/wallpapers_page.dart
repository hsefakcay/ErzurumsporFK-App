import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class WallpapersPage extends StatefulWidget {
  const WallpapersPage({super.key});

  @override
  State<WallpapersPage> createState() => _WallpapersPageState();
}

class _WallpapersPageState extends State<WallpapersPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isDownloading = false;

  static const _wallpapers = AppAssets.wallpapers;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _downloadWallpaper(BuildContext context) async {
    setState(() => _isDownloading = true);
    try {
      // 1. Aktif wallpaper'ın asset'ini byte olarak oku
      final currentPath = _wallpapers[_currentPage];
      final byteData = await rootBundle.load(currentPath);
      final bytes = byteData.buffer.asUint8List();

      // 2. Geçici bir dosya oluştur
      final tempDir = await getTemporaryDirectory();
      final ext = currentPath.split('.').last;
      final tempFile = File('${tempDir.path}/erzurumspor_wallpaper_$_currentPage.$ext');
      await tempFile.writeAsBytes(bytes);

      // 3. Galeriye kaydet
      await Gal.putImage(tempFile.path);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Duvar kağıdı galeriye kaydedildi!', style: AppTextStyles.labelSm),
            backgroundColor: AppColors.inversePrimary,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata oluştu: $e'), backgroundColor: AppColors.error),
        );
      }
    } finally {
      setState(() => _isDownloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ── Kaydırılabilir Tam Ekran Görseller ──────────────────────────
          PageView.builder(
            controller: _pageController,
            itemCount: _wallpapers.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              return Image.asset(_wallpapers[index], fit: BoxFit.cover);
            },
          ),

          // ── Üst Bar ve Kontroller ────────────────────────────────────────
          SafeArea(
            child: Column(
              children: [
                // İlerleme Çubuğu (Segmented)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: List.generate(_wallpapers.length, (index) {
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: index < _wallpapers.length - 1 ? 4 : 0),
                          height: 2,
                          decoration: BoxDecoration(
                            color: index == _currentPage
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                // Başlık ve Kapat Butonu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text('Wallpaper 📱', style: AppTextStyles.labelLarge),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white, size: 28),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Sağ Alt İndirme Butonu ──────────────────────────────────────
          Positioned(
            right: 24,
            bottom: 48,
            child: GestureDetector(
              onTap: _isDownloading ? null : () => _downloadWallpaper(context),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                ),
                child: Center(
                  child: _isDownloading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Icon(Icons.ios_share_rounded, color: Colors.white, size: 28),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
