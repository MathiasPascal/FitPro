import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadProfilePhoto(File file, String uid) async {
    final ref = _storage.ref().child("profiles/$uid.jpg");
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  Future<String> uploadWorkoutMedia(File file, String uid) async {
    final ref = _storage.ref().child("workouts/$uid/${file.path.split('/').last}");
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }
}
