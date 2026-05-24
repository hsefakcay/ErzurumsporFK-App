import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> importPlayers() async {
  final players = [
  // KALECİLER
  {
    'name': 'Matija Orbanic',
    'jerseyNumber': 31,
    'position': 'Kaleci',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/MATIJA_ORBANIC.png',
  },
  {
    'name': 'Erkan Anapa',
    'jerseyNumber': 1,
    'position': 'Kaleci',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/ERKAN_ANAPA.png',
  },
  {
    'name': 'Kağan Moradaoğlu',
    'jerseyNumber': 98,
    'position': 'Kaleci',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/KAGAN_MORADAOGLU.png',
  },

  // DEFANS
  {
    'name': 'Mustafa Yumlu',
    'jerseyNumber': 22,
    'position': 'Defans',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/MUSTAFA_YUMLU.png',
  },
  {
    'name': 'Orhan Ovacıklı',
    'jerseyNumber': 53,
    'position': 'Defans',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/ORHAN_OVACIKLI.png',
  },
  {
    'name': 'Cengizhan Bayrak',
    'jerseyNumber': 23,
    'position': 'Defans',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/CENGIZHAN_BAYRAK.png',
  },
  {
    'name': 'Amar Gerxhaliu',
    'jerseyNumber': 4,
    'position': 'Defans',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/AMAR_GERXHALIU.png',
  },
  {
    'name': 'Yakup Kırtay',
    'jerseyNumber': 3,
    'position': 'Defans',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/YAKUP_KIRTAY.png',
  },
  {
    'name': 'Ali Ülgen',
    'jerseyNumber': 2,
    'position': 'Defans',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/ALI_ULGEN.png',
  },
  {
    'name': 'Ömer Arda Kara',
    'jerseyNumber': 25,
    'position': 'Defans',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/OMER_ARDA_KARA.png',
  },

  // ORTA SAHA
  {
    'name': 'Giovanni Crociata',
    'jerseyNumber': 24,
    'position': 'Orta Saha',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/GIOVANNI_CROCIATA.png',
  },
  {
    'name': 'Brandon Baiye',
    'jerseyNumber': 6,
    'position': 'Orta Saha',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/BRANDON_BAIYE.png',
  },
  {
    'name': 'Sefa Akgün',
    'jerseyNumber': 88,
    'position': 'Orta Saha',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/SEFA_AKGUN.png',
  },
  {
    'name': 'Benhur Keser',
    'jerseyNumber': 77,
    'position': 'Orta Saha',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/BENHUR_KESER.png',
  },
  {
    'name': 'Furkan Özhan',
    'jerseyNumber': 20,
    'position': 'Orta Saha',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/FURKAN_OZHAN.png',
  },
  {
    'name': 'Adem Eren Kabak',
    'jerseyNumber': 16,
    'position': 'Orta Saha',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/ADEM_EREN_KABAK.png',
  },
  {
    'name': 'Salih Sarıkaya',
    'jerseyNumber': 17,
    'position': 'Orta Saha',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/SALIH_SARIKAYA.png',
  },
  {
    'name': 'Mustafa Fettahoğlu',
    'jerseyNumber': 99,
    'position': 'Orta Saha',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/MUSTAFA_FETTAHOGLU.png',
  },
  {
    'name': 'Guram Giorbelidze',
    'jerseyNumber': 15,
    'position': 'Defans',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/GURAM_GIORBELIDZE.png',
  },
  {
    'name': 'Murat Cem Akpınar',
    'jerseyNumber': 11,
    'position': 'Orta Saha',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/MURAT_CEM_AKPINAR.png',
  },
  {
    'name': 'İlkan Sever',
    'jerseyNumber': 7,
    'position': 'Orta Saha',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/ILKAN_SEVER.png',
  },

  // FORVET
  {
    'name': 'Eren Tozlu',
    'jerseyNumber': 10,
    'position': 'Forvet',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/EREN_TOZLU.png',
  },
  {
    'name': 'Hüsamettin Yener',
    'jerseyNumber': 9,
    'position': 'Forvet',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/HUSAMETTIN_YENER.png',
  },
  {
    'name': 'Fernando Andrade',
    'jerseyNumber': 9,
    'position': 'Forvet',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/FERNANDO_ANDRADE.png',
  },
  {
    'name': 'Martin Rodriguez',
    'jerseyNumber': 65,
    'position': 'Forvet',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/MARTIN_RODRIGUEZ.png',
  },
  {
    'name': 'CHEICKNE SYLLA',
    'jerseyNumber': 29,
    'position': 'Forvet',
    'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/CHEICKNE_SYLLA.png',
  }
];

  print('⏳ Oyuncular Firebase\'e aktarılıyor...');
  final batch = FirebaseFirestore.instance.batch();
  
  for (var player in players) {
    final ref = FirebaseFirestore.instance
      .collection('teams')
      .doc('erzurumspor')
      .collection('players')
      .doc();
    
    final playerData = Map<String, dynamic>.from(player);
    playerData['goals'] = 0;
    playerData['assists'] = 0;
    
    batch.set(ref, playerData);
  }

  await batch.commit();
  print('✅ ${players.length} oyuncu başarıyla import edildi!');
}
