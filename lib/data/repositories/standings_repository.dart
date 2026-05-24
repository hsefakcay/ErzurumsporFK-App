import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/models/standing.dart';
import '../../domain/repositories/repositories.dart';

/// TheSportsDB API üzerinden gerçek puan durumu verisini çeken repository.
/// DIP: IStandingsRepository arayüzünü implemente eder.
class StandingsRepository implements IStandingsRepository {
  static const String _baseUrl =
      'https://www.thesportsdb.com/api/v1/json/123/lookuptable.php';
  static const String _leagueId = '4676';

  final http.Client _client;

  StandingsRepository({http.Client? client})
      : _client = client ?? http.Client();

  @override
  Future<List<Standing>> getStandings() async {
    try {
      final uri = Uri.parse('$_baseUrl?l=$_leagueId');
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final tableList = data['table'] as List<dynamic>?;

        if (tableList == null || tableList.isEmpty) {
          return [];
        }

        return tableList
            .map((item) => Standing.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('API yanıt kodu: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
