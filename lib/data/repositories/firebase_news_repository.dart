import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../domain/models/news_article.dart';
import '../../domain/repositories/repositories.dart';

class FirebaseNewsRepository implements INewsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<NewsArticle>> getLatestNews() async {
    try {
      final snapshot = await _firestore
          .collection('news')
          .orderBy('publishedAt', descending: true)
          .get();

      final allNews = snapshot.docs
          .map((doc) => NewsArticle.fromJson(doc.data(), doc.id))
          .toList();

      // Son haberler (featured olmayanlar veya hepsi)
      // Şimdilik sadece ilk featured'ı atlayıp kalanları da gösterebiliriz 
      // ya da hepsini gösterebiliriz. Burada featured olmayanları getirelim.
      return allNews.where((article) => !(snapshot.docs.firstWhere((d) => d.id == article.id).data()['isFeatured'] == true)).toList();
    } catch (e) {
      if (kDebugMode) {
        print('FirebaseNewsRepository (getLatestNews) Error: $e');
      }
      return [];
    }
  }

  @override
  Future<NewsArticle?> getFeaturedNews() async {
    try {
      final snapshot = await _firestore
          .collection('news')
          .where('isFeatured', isEqualTo: true)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return NewsArticle.fromJson(snapshot.docs.first.data(), snapshot.docs.first.id);
      }

      // Eğer isFeatured işaretli yoksa, en yeni haberi featured yapalım
      final latestSnapshot = await _firestore
          .collection('news')
          .orderBy('publishedAt', descending: true)
          .limit(1)
          .get();

      if (latestSnapshot.docs.isNotEmpty) {
        return NewsArticle.fromJson(latestSnapshot.docs.first.data(), latestSnapshot.docs.first.id);
      }

      return null;
    } catch (e) {
      if (kDebugMode) {
        print('FirebaseNewsRepository (getFeaturedNews) Error: $e');
      }
      return null;
    }
  }
}
