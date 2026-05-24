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
      awayTeam: 'Çorum FK',
      awayTeamShort: 'ÇOR',
      awayTeamLogoUrl:
          "https://upload.wikimedia.org/wikipedia/tr/3/37/%C3%87orum_FK.png?_=20200112204145",
      matchDate: DateTime(2025, 9, 6, 19, 0),
      stadium: 'Kazım Karabekir Stadyumu',
      league: 'Trendyol 1. Lig',
      week: 3,
    );
  }

  @override
  Future<List<Match>> getUpcomingMatches() async {
    return [
      Match(
        id: 'match-1',
        homeTeam: 'Erzurumspor FK',
        homeTeamShort: 'ERZ',
        awayTeam: 'Çorum FK',
        awayTeamShort: 'ÇOR',
        awayTeamLogoUrl:
            "https://upload.wikimedia.org/wikipedia/tr/3/37/%C3%87orum_FK.png?_=20200112204145",
        matchDate: DateTime(2025, 9, 6, 19, 0),
        stadium: 'Kazım Karabekir Stadyumu',
        league: 'Trendyol 1. Lig',
        week: 3,
      ),
      Match(
        id: 'match-4',
        homeTeam: 'Boluspor',
        homeTeamShort: 'BOL',
        homeTeamLogoUrl:
            'https://upload.wikimedia.org/wikipedia/tr/2/22/Boluspork.png?_=20180829194643',
        awayTeam: 'Erzurumspor FK',
        awayTeamShort: 'ERZ',
        matchDate: DateTime(2025, 9, 27, 15, 0),
        stadium: 'Bolu Atatürk Stadyumu',
        league: 'Trendyol 1. Lig',
        week: 6,
      ),
    ];
  }

  @override
  Future<List<Match>> getLastMatches() async {
    return [
      Match(
        id: 'last-1',
        homeTeam: 'Erzurumspor FK',
        homeTeamShort: 'ERZ',
        awayTeam: 'Göztepe',
        awayTeamShort: 'GÖZ',
        matchDate: DateTime(2025, 8, 30, 19, 0),
        stadium: 'Kazım Karabekir Stadyumu',
        league: 'Trendyol 1. Lig',
        week: 2,
        homeScore: 2,
        awayScore: 1,
        status: MatchStatus.finished,
      ),
      Match(
        id: 'last-2',
        homeTeam: 'Sakaryaspor',
        homeTeamShort: 'SAK',
        awayTeam: 'Erzurumspor FK',
        awayTeamShort: 'ERZ',
        matchDate: DateTime(2025, 8, 23, 16, 0),
        stadium: 'Sakarya Atatürk Stadyumu',
        league: 'Trendyol 1. Lig',
        week: 1,
        homeScore: 0,
        awayScore: 0,
        status: MatchStatus.finished,
      ),
    ];
  }
}
