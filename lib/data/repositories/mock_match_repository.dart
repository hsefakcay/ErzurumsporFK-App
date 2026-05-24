import '../../domain/models/match.dart';
import '../../domain/repositories/repositories.dart';

/// Mock veri kaynağı - IMatchRepository implementasyonu.
class MockMatchRepository implements IMatchRepository {
  @override
  Future<Match?> getNextMatch() async {
    return Match(
      id: 'match-next',
      homeTeam: 'Erzurumspor FK',
      homeTeamShort: 'ERZ',
      homeTeamLogoUrl: null,
      awayTeam: 'Rakip Takım',
      awayTeamShort: 'RAK',
      awayTeamLogoUrl: null,
      matchDate: DateTime(2024, 11, 24, 19, 0),
      stadium: 'Kazım Karabekir Stadyumu',
      league: 'Trendyol 1. Lig',
      week: 14,
    );
  }

  @override
  Future<List<Match>> getUpcomingMatches() async {
    return [
      Match(
        id: 'match-1',
        homeTeam: 'Umraniyespor',
        homeTeamShort: 'UMR',
        awayTeam: 'Erzurumspor FK',
        awayTeamShort: 'ERZ',
        matchDate: DateTime(2025, 3, 19, 16, 0),
        stadium: 'Ümraniye Stadyumu',
        league: 'Trendyol 1. Lig',
        week: 24,
      ),
      Match(
        id: 'match-2',
        homeTeam: 'Erzurumspor FK',
        homeTeamShort: 'ERZ',
        awayTeam: 'Gaziantep FK',
        awayTeamShort: 'GZT',
        matchDate: DateTime(2025, 4, 2, 20, 0),
        stadium: 'Kazım Karabekir Stadyumu',
        league: 'Trendyol 1. Lig',
        week: 25,
      ),
    ];
  }

  @override
  Future<List<Match>> getLastMatches() async {
    return [];
  }
}
