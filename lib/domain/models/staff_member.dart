/// Teknik heyet üyesi modeli
class StaffMember {
  final String id;
  final String name;
  final String role;
  final String imageUrl;
  final bool isSupportStaff;

  const StaffMember({
    required this.id,
    required this.name,
    required this.role,
    required this.imageUrl,
    this.isSupportStaff = false,
  });

  factory StaffMember.fromJson(Map<String, dynamic> json, String id) {
    return StaffMember(
      id: id,
      name: json['name'] as String? ?? 'Bilinmiyor',
      role: json['role'] as String? ?? 'Bilinmiyor',
      imageUrl: json['imageUrl'] as String? ?? '',
      isSupportStaff: json['isSupportStaff'] as bool? ?? false,
    );
  }
}
