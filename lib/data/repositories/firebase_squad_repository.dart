import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../domain/models/player.dart';
import '../../domain/models/staff_member.dart';
import '../../domain/repositories/repositories.dart';

class FirebaseSquadRepository implements ISquadRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Player>> getPlayers() async {
    try {
      final snapshot = await _firestore
          .collection('teams')
          .doc('erzurumspor')
          .collection('players')
          .get();

      final players = snapshot.docs.map((doc) => Player.fromJson(doc.data(), doc.id)).toList();

      // Pozisyona göre sıralama kuralı
      final positionOrder = {'Kaleci': 0, 'Defans': 1, 'Orta Saha': 2, 'Forvet': 3};

      players.sort((a, b) {
        final aPos = positionOrder[a.position] ?? 99;
        final bPos = positionOrder[b.position] ?? 99;

        // Eğer aynı pozisyondalarsa, forma numarasına göre sırala
        if (aPos == bPos) {
          return a.jerseyNumber.compareTo(b.jerseyNumber);
        }

        return aPos.compareTo(bPos);
      });

      return players;
    } catch (e) {
      if (kDebugMode) {
        print('FirebaseSquadRepository Error: $e');
      }
      return [];
    }
  }

  @override
  Future<List<StaffMember>> getTechnicalStaff() async {
    try {
      final snapshot = await _firestore
          .collection('teams')
          .doc('erzurumspor')
          .collection('staffs')
          .where('isSupportStaff', isEqualTo: false)
          .get();

      final staffs = snapshot.docs.map((doc) => StaffMember.fromJson(doc.data(), doc.id)).toList();

      return staffs;
    } catch (e) {
      if (kDebugMode) {
        print('FirebaseSquadRepository Error: $e');
      }
      return [];
    }
  }

  @override
  Future<List<StaffMember>> getSupportStaff() async {
    try {
      final snapshot = await _firestore
          .collection('teams')
          .doc('erzurumspor')
          .collection('staffs')
          .where('isSupportStaff', isEqualTo: true)
          .get();

      final staffs = snapshot.docs.map((doc) => StaffMember.fromJson(doc.data(), doc.id)).toList();

      return staffs;
    } catch (e) {
      if (kDebugMode) {
        print('FirebaseSquadRepository Error: $e');
      }
      return [];
    }
  }
}
