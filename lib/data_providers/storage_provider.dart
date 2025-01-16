import 'package:firebase_storage/firebase_storage.dart';

class StorageProvider {
  final FirebaseStorage _storage;

  StorageProvider({required FirebaseStorage storage}) : _storage = storage;

  Future<String> getImageUrl(String? imageUrl) async {
    return await _storage.ref(imageUrl).getDownloadURL();
  }
}
