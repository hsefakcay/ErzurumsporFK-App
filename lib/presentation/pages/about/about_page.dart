import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hakkımızda', style: AppTextStyles.headlineMd), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.outline.withValues(alpha: 0.1)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/erzurumspor_logo.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Sporun başkenti olan Erzurum’da 24 Mart 1972 yılında kurulan Erzurum Büyükşehir Belediyespor, Erzurum Büyükşehir Belediye Başkanı Mehmet Sekmen tarafından ismi Büyükşehir Belediye Erzurumspor olarak değiştirilmiştir. Amatör ruhtan profesyonelliğe Başkan Mehmet Sekmen ile ulaşan takımımız, 3 yıl gibi kısa bir sürede 3. Lig'den Süper Lig'e yükselmiştir. Mavi Beyazlı kulübümüz Türkiye'de en büyük taraftar kitlesine sahip Anadolu takımlarından biridir.",
                    style: AppTextStyles.bodySm,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
