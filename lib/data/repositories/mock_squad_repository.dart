import '../../domain/models/player.dart';
import '../../domain/models/staff_member.dart';
import '../../domain/repositories/repositories.dart';

/// Mock veri kaynağı - ISquadRepository implementasyonu.
class MockSquadRepository implements ISquadRepository {
  @override
  Future<List<Player>> getPlayers() async {
    return const [
      Player(
        id: 'p-1',
        name: 'Ahmet Yılmaz',
        position: 'Kaptan / Orta Saha',
        nationality: 'Türkiye',
        jerseyNumber: 10,
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCbGIki7fEwDbCTBPU4lyuYk9g2qcJecVDzkhUhxb0Y4YWnlyX0MiWgSdXdWT50ypT7Nm1oxjCw2FiGCdh7uFabVctA-pqk17u1wvjb2M3Etu8hxfH49guS3XI_Sbxys7fMy5AAGyR2KEELbNQKSDx3T0uc5xEFb16kXA77rqwrQF6x1_Ek6tSo84d_WbwgjwzX1TC1eDXTDq765uGnhWbvFO8cmmLgYLMIyWJVgmmTwFHz88zJVGnavkYTSpkCT6AvWSkv6EdhuL4',
        isCaptain: true,
      ),
      Player(
        id: 'p-2',
        name: 'Mehmet Demir',
        position: 'Kaleci',
        nationality: 'Türkiye',
        jerseyNumber: 1,
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDa6YQC3QWfY8NLMZocfcHSlULIPQSAtrH9pL_5XUsnlqxyAaz6c1xbZjkh1Jv-jzrmMoTXHPdrfVpWD8DW3m58isSMrMjvtLWzxrLuVCpZiRInT3A39u82B1-hZDDZBrUJ7nsbjb55BExrnDoudocHMm_BfiIXNZ3yXR8oTu3wS3bX2gfvzCOWvE7a0bgomF-SDsubU95HpcMpsBjxr-p8k7_XhvuzBhY5_RErhG-qQG65JnZG9bQg4kxI0fMQcGIUCukulHcALC8',
      ),
      Player(
        id: 'p-3',
        name: 'Caner Şahin',
        position: 'Forvet',
        nationality: 'Türkiye',
        jerseyNumber: 9,
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDhBiuHkJoMtUIKsc0ZMkpgw_KaAeI-p8m42nGw7huQlq027k-2TJvo437esDOwk2LS64W9gsjSyaacXewZARm2t9oF-jbsogZ2Q2ISQzI_5FBrVdWBZzTdPreNNaCZTE8GGLdVhXt7uPKufKoFgwgorWjyTGO2Q_5IEJRCM3n1Xy7uQoBPDI2XSto9aMkf4Xj4FtJXG5qIXP1P_dlj_i6LClojYa3WKQiAZeRNkbdDpQ6OmG_beDnC65q8QYfjjDbucxYBn6ZegX4',
      ),
      Player(
        id: 'p-4',
        name: 'Burak Kaya',
        position: 'Stoper',
        nationality: 'Türkiye',
        jerseyNumber: 4,
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDMjsQzoSMwjS-6wC8-SzXQYARsGo2En6MipI6HYQe9xxJtWvXzPB2LE5uA-e-P_urkFcGfaInkvV2SKIdFaNKJAbhu24qFCrEHDrxpIdL2-qVrFXZOw6VYbal4Lsbu94lgTS7ZC0rZ15EyClhiTqG4Vy6vsB0q_HQVJmRBOJ5C5RCZgwcO_Ev1oFgdURt4HiRnibzyxQSsuctnGwRGgyd0vD-QYgH6FMNaUvqiM6zSCy7L0hfrCPQVNcm-PwbmysuxQiQxitUpH8A',
      ),
    ];
  }

  @override
  Future<List<StaffMember>> getTechnicalStaff() async {
    return const [
      StaffMember(
        id: 's-1',
        name: 'Hakan Kutlu',
        role: 'Teknik Direktör',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuB-84prLdMxpGCF1_QYIkSu7fVnDRjzTPaMGgUWUSmYGCSudO3FHIIKVqMiG4O4U3gCydviFHCccv1vd50xsT1yAQKg2FlgiBxJGgZIYCguknVlCmvXZeAf5b1ZlRoS2j67iHUxyJR0q7Ciw-WPUiWouVexhVPPkj8Dse5HJFsWoyBmlsJ-BC-co4nxFc3XOZ0u-jGotFk_-u8KA7vHisC5QiQ84nknaPCKElispR7jcpOTXSCTHlqmY6nZb8byiU250F_BKh76x-c',
      ),
      StaffMember(
        id: 's-2',
        name: 'Ali Çelik',
        role: 'Yardımcı Antrenör',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCl7J4pN6MYkDkJxM4Y9hgvwVHLFxyKjPda9DQm-zsAHYH-M1g_JbT6NmQe4Cg2RQVB4bYEOqy6-zt25O9WclE5Z6qs6tS5pEuMatcmajwzLSVsCqPQuswag5FJGuRVLMl58Vp8UT9tjY1w-caoLca4_dagjb9eVifTAD8OTX-1gIdEF3_6SGhrSXvhaIjXVnMsxWbAyUd9TI4Ov-s6tWK5husxoG9NqddTYK-pVE9aNDQ2qqgH_iH6rD0H1bSDYM1CO_V06ndvX68',
      ),
      StaffMember(
        id: 's-3',
        name: 'Sinan Demirci',
        role: 'Kaleci Antrenörü',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCkRrUTnTWpq1-t_NFnZsnERi_MvOI8rkzambnIkhp5WwGzQAlqkH0FdhqRHQt0w7jNleoPZ4G6Ar2T65nrHTt9UASsIggWD_QB_dV3AcdC9DgZYZOq1A9Uu3RQqY39JZIuGcTedxCkbDbC8x8aZhTbRNXgPZ2jnJJfhppoHOsTRdBge6SXRESjaePzQBuqkQtVeEdtZAu99vfHLwdVA4zgPzeAtLh4ie-Bqo3L6CNZe8i8b9nQArCaUwq5yuwvsvqmZ5euuTgc_TU',
      ),
    ];
  }

  @override
  Future<List<StaffMember>> getSupportStaff() async {
    return const [
      StaffMember(id: 'ss-1', name: 'Dr. Mustafa Koç', role: 'Kulüp Doktoru', imageUrl: ''),
      StaffMember(id: 'ss-2', name: 'Ahmet Yıldırım', role: 'Fizyoterapist', imageUrl: ''),
      StaffMember(id: 'ss-3', name: 'Ayşe Yılmaz', role: 'Beslenme Uzmanı', imageUrl: ''),
    ];
  }
}
