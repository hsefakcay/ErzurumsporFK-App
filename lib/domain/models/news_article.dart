/// Haber modeli
class NewsArticle {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final String? content;
  final String timeAgo;
  final DateTime? publishedAt;

  const NewsArticle({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    this.content = '',
    required this.timeAgo,
    required this.publishedAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json, String id) {
    DateTime? publishedAt;
    if (json['publishedAt'] != null) {
      if (json['publishedAt'] is int) {
        publishedAt = DateTime.fromMillisecondsSinceEpoch(json['publishedAt'] as int);
      } else {
        // Asume it's a Timestamp if you have cloud_firestore imported or handle String just in case
        try {
          publishedAt = (json['publishedAt']).toDate();
        } catch (_) {
          publishedAt = DateTime.tryParse(json['publishedAt'].toString());
        }
      }
    }

    return NewsArticle(
      id: id,
      title: json['title'] as String? ?? 'Başlıksız Haber',
      category: json['category'] as String? ?? 'Genel',
      imageUrl: json['imageUrl'] as String? ?? '',
      content: json['content'] as String? ?? '',
      timeAgo: json['timeAgo'] as String? ?? '',
      publishedAt: publishedAt ?? DateTime.now(),
    );
  }
}
