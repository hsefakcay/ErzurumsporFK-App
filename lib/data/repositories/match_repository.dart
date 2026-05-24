import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/models/match.dart';
import '../../domain/repositories/repositories.dart';

/// TheSportsDB API üzerinden gerçek maç verisi çeken repository.
/// DIP: IMatchRepository arayüzünü implemente eder.
class MatchRepository implements IMatchRepository {
  static const String _baseUrl = 'https://www.thesportsdb.com/api/v1/json/123';
  static const String _teamId = '134272'; // Erzurumspor

  final http.Client _client;

  MatchRepository({http.Client? client})
      : _client = client ?? http.Client();

  @override
  Future<List<Match>> getUpcomingMatches() async {
    try {
      final uri = Uri.parse('$_baseUrl/eventsnext.php?id=$_teamId');
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final events = data['events'] as List<dynamic>?;
        if (events == null || events.isEmpty) return [];

        return events
            .map((e) => Match.fromSportsDbJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (_) {
      return [];
    }
  }

  @override
  Future<Match?> getNextMatch() async {
    final matches = await getUpcomingMatches();
    return matches.isNotEmpty ? matches.first : null;
  }

  @override
  Future<List<Match>> getLastMatches() async {
    try {
      final uri = Uri.parse('$_baseUrl/eventslast.php?id=$_teamId');
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final results = data['results'] as List<dynamic>?;
        if (results == null || results.isEmpty) return [];

        return results
            .map((e) => Match.fromSportsDbJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (_) {
      return [];
    }
  }
}
