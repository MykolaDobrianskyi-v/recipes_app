import 'package:chat_app/models/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  UserProvider({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _firestore = firestore,
        _auth = auth;

  String get _uid => _auth.currentUser!.uid;

  Future<void> addIngredientToList(String id) async {
    final uid = _auth.currentUser!.uid;

    final snapshot = await _firestore.collection('users').doc(uid).get();
    if (!snapshot.exists) {
      const emptyModel = UserDataModel.empty();
      await _firestore.collection('users').doc(uid).set(emptyModel.toJson());
    }
    final oldSelectedIngredients = snapshot.exists
        ? UserDataModel.fromJson(snapshot.data()!)
        : const UserDataModel.empty();
    await _firestore.collection('users').doc(uid).update({
      'selectedIngredientsId': [
        ...oldSelectedIngredients.selectedIngredientsId,
        id,
      ],
    });
  }

  Stream<UserDataModel?> get userData =>
      _firestore.collection('users').doc(_uid).snapshots().map(
        (doc) {
          if (doc.data() == null) {
            return null;
          }
          return UserDataModel.fromJson(doc.data()!);
        },
      );
}
