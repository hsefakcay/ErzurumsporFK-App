import '../models/news_article.dart';
import '../models/match.dart';
import '../models/player.dart';
import '../models/staff_member.dart';
import '../models/product.dart';
import '../models/standing.dart';

/// OCP & DIP: Repository arayüzü - soyutlama.
/// Tüm veri kaynakları bu arayüzü implemente eder.
abstract interface class INewsRepository {
  Future<List<NewsArticle>> getLatestNews();
  Future<NewsArticle?> getFeaturedNews();
}

abstract interface class IMatchRepository {
  Future<Match?> getNextMatch();
  Future<List<Match>> getUpcomingMatches();
  Future<List<Match>> getLastMatches();
}

abstract interface class ISquadRepository {
  Future<List<Player>> getPlayers();
  Future<List<StaffMember>> getTechnicalStaff();
  Future<List<StaffMember>> getSupportStaff();
}

abstract interface class IShopRepository {
  List<Product> getProducts();
  Product? getFeaturedProduct();
  String getStoreUrl();
}

abstract interface class IStandingsRepository {
  Future<List<Standing>> getStandings();
}

