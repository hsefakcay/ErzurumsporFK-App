/// Maç modeli
class Match {
  final String id;
  final String homeTeam;
  final String homeTeamShort;
  final String? homeTeamLogoUrl;
  final String awayTeam;
  final String awayTeamShort;
  final String? awayTeamLogoUrl;
  final DateTime matchDate;
  final String stadium;
  final String league;
  final int week;
  final int? homeScore;
  final int? awayScore;
  final MatchStatus status;

  const Match({
    required this.id,
    required this.homeTeam,
    required this.homeTeamShort,
    this.homeTeamLogoUrl,
    required this.awayTeam,
    required this.awayTeamShort,
    this.awayTeamLogoUrl,
    required this.matchDate,
    required this.stadium,
    required this.league,
    required this.week,
    this.homeScore,
    this.awayScore,
    this.status = MatchStatus.upcoming,
  });

  bool get isHome => homeTeam.toLowerCase().contains('erzurum');

  /// TheSportsDB API JSON'ından model oluşturur.
  factory Match.fromSportsDbJson(Map<String, dynamic> json) {
    final statusStr = (json['strStatus'] as String?) ?? '';
    MatchStatus status;
    if (statusStr.contains('Finished')) {
      status = MatchStatus.finished;
    } else if (statusStr.contains('Progress') || statusStr.contains('Live')) {
      status = MatchStatus.live;
    } else {
      status = MatchStatus.upcoming;
    }

    final homeTeam = json['strHomeTeam'] as String? ?? '';
    final awayTeam = json['strAwayTeam'] as String? ?? '';

    // strTimestamp UTC formatındadır (örn: 2026-05-02T13:00:00)
    // Bunu parse edip yerel saate çevirmek en güvenli yoldur.
    final timestamp = json['strTimestamp'] as String?;
    DateTime matchDate;
    
    if (timestamp != null && timestamp.isNotEmpty) {
      try {
        // API'den gelen timestamp genellikle 'YYYY-MM-DD HH:MM:SS' formatında olabiliyor
        // Veya 'YYYY-MM-DDTHH:MM:SS'. Boşluk varsa T ile değiştirip sonuna Z ekleyerek UTC olduğunu belirtiyoruz.
        final isoTimestamp = timestamp.contains('T') ? timestamp : timestamp.replaceFirst(' ', 'T');
        matchDate = DateTime.parse('${isoTimestamp}Z').toLocal();
      } catch (_) {
        // Yedek olarak local alanları kullan
        final dateStr = json['dateEventLocal'] as String? ?? json['dateEvent'] as String? ?? '';
        final timeStr = json['strTimeLocal'] as String? ?? json['strTime'] as String? ?? '00:00:00';
        try {
          matchDate = DateTime.parse('${dateStr}T$timeStr');
        } catch (__) {
          matchDate = DateTime.now();
        }
      }
    } else {
      final dateStr = json['dateEventLocal'] as String? ?? json['dateEvent'] as String? ?? '';
      final timeStr = json['strTimeLocal'] as String? ?? json['strTime'] as String? ?? '00:00:00';
      try {
        matchDate = DateTime.parse('${dateStr}T$timeStr');
      } catch (_) {
        matchDate = DateTime.now();
      }
    }


    return Match(
      id: json['idEvent'] as String? ?? '',
      homeTeam: homeTeam,
      homeTeamShort: _makeShort(homeTeam),
      homeTeamLogoUrl: json['strHomeTeamBadge'] as String?,
      awayTeam: awayTeam,
      awayTeamShort: _makeShort(awayTeam),
      awayTeamLogoUrl: json['strAwayTeamBadge'] as String?,
      matchDate: matchDate,
      stadium: (json['strVenue'] as String?)?.isNotEmpty == true
          ? json['strVenue'] as String
          : 'Belirtilmedi',
      league: json['strLeague'] as String? ?? '',
      week: int.tryParse(json['intRound']?.toString() ?? '') ?? 0,
      homeScore: int.tryParse(json['intHomeScore']?.toString() ?? ''),
      awayScore: int.tryParse(json['intAwayScore']?.toString() ?? ''),
      status: status,
    );
  }

  /// Takım adından kısa kod oluşturur (ilk 3 harf).
  static String _makeShort(String name) {
    if (name.toLowerCase().contains('erzurum')) return 'ERZ';
    final clean = name.replaceAll(RegExp(r'spor|FK|SK|1967|1922', caseSensitive: false), '').trim();
    if (clean.length >= 3) return clean.substring(0, 3).toUpperCase();
    return name.substring(0, name.length.clamp(0, 3)).toUpperCase();
  }
}

enum MatchStatus { upcoming, live, finished }
