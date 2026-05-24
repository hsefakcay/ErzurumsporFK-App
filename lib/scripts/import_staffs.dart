import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> importStaffs() async {
  final staffs = [
    {
      'name': 'Serkan Özbalta',
      'role': 'Teknik Direktör',
      'isSupportStaff': false,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/SERKAN_OZBALTA.png',
    },
    {
      'name': 'Ziya Akçeken',
      'role': 'Yardımcı Antrenör',
      'isSupportStaff': false,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/ZIYA_AKCEKEN.png',
    },
    {
      'name': 'Temel Domacoğlu',
      'role': 'Kaleci Antrenörü',
      'isSupportStaff': false,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/TEMEL_DOMACOGLU.png',
    },
    {
      'name': 'Fatih Aktürk',
      'role': 'Atletik Performans Antrenörü',
      'isSupportStaff': false,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/FATIH_AKTURK.png',
    },
    {
      'name': 'Suat Maden',
      'role': 'Maç ve Performans Analisti',
      'isSupportStaff': false,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/SUAT_MADEN.png',
    },
    {
      'name': 'Serkan Zaimoğlu',
      'role': 'Kulüp Antrenörü',
      'isSupportStaff': false,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/SERKAN_ZAIMOGLU.png',
    },
    {
      'name': 'Uğur Bayarslan',
      'role': 'Kulüp Antrenörü',
      'isSupportStaff': false,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/UGUR_BAYARSLAN.png',
    },
    {
      'name': 'Gökhan Atasever',
      'role': 'Kulüp Antrenörü',
      'isSupportStaff': false,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/GOKHAN_ATASEVER.png',
    },

    {
      'name': 'M.Sadık Seferoğlu',
      'role': 'Kulüp Doktoru',
      'isSupportStaff': true,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/SADIK_SEFEROGLU.png',
    },
    {
      'name': 'Salih Kirişka',
      'role': 'Fizyoterapist',
      'isSupportStaff': true,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/SALIH_KIRISKA.png',
    },
    {
      'name': 'Mehmet Karagöz',
      'role': 'Fizyoterapist',
      'isSupportStaff': true,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/MEHMET_KARAGOZ.png',
    },
    {
      'name': 'Ahmet Saygın',
      'role': 'Masör',
      'isSupportStaff': true,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/AHMET_SAYGIN.png',
    },
    {
      'name': 'Ramazan Keleş',
      'role': 'Masör',
      'isSupportStaff': true,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/RAMAZAN_KELES.png',
    },
    {
      'name': 'Görkem Tezel',
      'role': 'Diyetisyen',
      'isSupportStaff': true,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/GORKEM_TEZEL.png',
    },
    {
      'name': 'Dursun Ali Tayşi',
      'role': 'Basın ve İletişim Sorumlusu',
      'isSupportStaff': true,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/DURSUN_ALI_TAYSI.png',
    },
    {
      'name': 'Mehmet Can Savcı',
      'role': 'Kulüp Tercümanı',
      'isSupportStaff': true,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/MEHMET_CAN_SAVCI.png',
    },
    {
      'name': 'Adem Akyürek',
      'role': 'Malzeme Sorumlusu',
      'isSupportStaff': true,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/ADEM_AKYUREK.png',
    },
    {
      'name': 'Kadir Uzun',
      'role': 'Malzeme Sorumlusu',
      'isSupportStaff': true,
      'imageUrl': 'https://erzurumsporfk.org/wp-content/uploads/2025/10/KADIR_UZUN.png',
    },
  ];

  print('⏳ Stafflar Firebase\'e aktarılıyor...');
  final batch = FirebaseFirestore.instance.batch();

  for (var staff in staffs) {
    final ref = FirebaseFirestore.instance
        .collection('teams')
        .doc('erzurumspor')
        .collection('staffs')
        .doc();

    batch.set(ref, staff);
  }

  await batch.commit();
  print('✅ ${staffs.length} staff başarıyla import edildi!');
}
