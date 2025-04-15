import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Future<void> saveUserProfile(String uid, Map<String, dynamic> data) async {
    await _db.collection('users').doc(uid).set(data, SetOptions(merge: true));
  }

  Future<void> logWorkout(String uid, Map<String, dynamic> workout) async {
    await _db.collection('users').doc(uid).collection('workouts').add(workout);
  }

  Future<void> bookSession(String uid, Map<String, dynamic> booking) async {
    await _db.collection('users').doc(uid).collection('bookings').add(booking);
  }

  Stream<List<Map<String, dynamic>>> getUserWorkouts(String uid) {
    return _db.collection('users').doc(uid).collection('workouts').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => doc.data()).toList());
  }
}
