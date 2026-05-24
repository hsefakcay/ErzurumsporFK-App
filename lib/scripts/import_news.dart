import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

Future<void> importNews() async {
  if (kDebugMode) {
    print('⏳ Haberler Firebase\'e aktarılıyor...');
  }

  final firestore = FirebaseFirestore.instance;

  final news = [
    {
      'title': 'Şampiyon Erzurumspor FK! 🏆',
      'category': 'Kulüp',
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2026/04/cropped-20260419_192249.jpg',
      'content': 'Erzurumspor FK 2025-2026 sezonu TFF 1. Lig şampiyonu! Bu büyük zafer, şehrimizin, taraftarımızın ve camiamızın azminin, mücadelesinin ve birliğinin en anlamlı nişanıdır. Futbolcularımızın, teknik heyetimizin, yönetimimizin ve gece gündüz demeden alın teri döken tüm paydaşlarımızın üstün başarısı sayesinde ipi göğüsledik! 🇹🇷💙🤍 #ErzurumsporFK #Şampiyon #TFF1Lig #Erzurum',
      'timeAgo': '19 Nisan 2026',
      'publishedAt': DateTime(2026, 4,19 ).millisecondsSinceEpoch,
      'isFeatured': true,
    },
  ];

  final batch = firestore.batch();
  final newsCollection = firestore.collection('news');

  for (var article in news) {
    final docRef = newsCollection.doc();
    batch.set(docRef, article);
  }

  try {
    await batch.commit();
    if (kDebugMode) {
      print('✅ Haberler başarıyla import edildi!');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Haber import hatası: $e');
    }
  }
}
