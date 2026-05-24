/// Oyuncu modeli
class Player {
  final String id;
  final String name;
  final String position;
  final String nationality;
  final int jerseyNumber;
  final String imageUrl;
  final bool isCaptain;

  const Player({
    required this.id,
    required this.name,
    required this.position,
    required this.nationality,
    required this.jerseyNumber,
    required this.imageUrl,
    this.isCaptain = false,
  });

  factory Player.fromJson(Map<String, dynamic> json, String id) {
    return Player(
      id: id,
      name: json['name'] as String? ?? 'Bilinmiyor',
      position: json['position'] as String? ?? 'Bilinmiyor',
      nationality: json['nationality'] as String? ?? 'Bilinmiyor',
      jerseyNumber: json['jerseyNumber'] as int? ?? 0,
      imageUrl: json['imageUrl'] as String? ?? '',
      isCaptain: json['isCaptain'] as bool? ?? false,
    );
  }
}
