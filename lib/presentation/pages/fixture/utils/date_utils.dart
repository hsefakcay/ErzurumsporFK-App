/// Fixture sayfası için tarih formatlama yardımcı fonksiyonları.
library;

/// Kısa ay adı döndürür (3 harf).
String monthShort(int m) {
  const months = [
    'Oca', 'Şub', 'Mar', 'Nis', 'May', 'Haz',
    'Tem', 'Ağu', 'Eyl', 'Eki', 'Kas', 'Ara',
  ];
  return months[m - 1];
}

/// Tarih ve saat formatlı string döndürür.
String formatDate(DateTime d) {
  return '${d.day} ${monthShort(d.month)}, ${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
}
