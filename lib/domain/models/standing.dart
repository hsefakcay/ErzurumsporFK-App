/// Puan durumu modeli - TheSportsDB API yanıtına uygun.
class Standing {
  final String idStanding;
  final int rank;
  final String idTeam;
  final String teamName;
  final String? badgeUrl;
  final String league;
  final String season;
  final String form;
  final String? description;
  final int played;
  final int won;
  final int lost;
  final int drawn;
  final int goalsFor;
  final int goalsAgainst;
  final int goalDifference;
  final int points;

  const Standing({
    required this.idStanding,
    required this.rank,
    required this.idTeam,
    required this.teamName,
    this.badgeUrl,
    required this.league,
    required this.season,
    required this.form,
    this.description,
    required this.played,
    required this.won,
    required this.lost,
    required this.drawn,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
    required this.points,
  });

  /// JSON'dan model oluşturur.
  factory Standing.fromJson(Map<String, dynamic> json) {
    return Standing(
      idStanding: json['idStanding'] as String? ?? '',
      rank: int.tryParse(json['intRank']?.toString() ?? '') ?? 0,
      idTeam: json['idTeam'] as String? ?? '',
      teamName: json['strTeam'] as String? ?? '',
      badgeUrl: json['strBadge'] as String?,
      league: json['strLeague'] as String? ?? '',
      season: json['strSeason'] as String? ?? '',
      form: json['strForm'] as String? ?? '',
      description: json['strDescription'] as String?,
      played: int.tryParse(json['intPlayed']?.toString() ?? '') ?? 0,
      won: int.tryParse(json['intWin']?.toString() ?? '') ?? 0,
      lost: int.tryParse(json['intLoss']?.toString() ?? '') ?? 0,
      drawn: int.tryParse(json['intDraw']?.toString() ?? '') ?? 0,
      goalsFor: int.tryParse(json['intGoalsFor']?.toString() ?? '') ?? 0,
      goalsAgainst: int.tryParse(json['intGoalsAgainst']?.toString() ?? '') ?? 0,
      goalDifference: int.tryParse(json['intGoalDifference']?.toString() ?? '') ?? 0,
      points: int.tryParse(json['intPoints']?.toString() ?? '') ?? 0,
    );
  }

  /// Erzurumspor mu kontrol eder.
  bool get isErzurumspor => teamName.toLowerCase().contains('erzurum');
}
