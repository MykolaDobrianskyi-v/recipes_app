import 'package:chat_app/models/ingredient_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IngredientsProvider {
  final FirebaseFirestore _firestore;

  IngredientsProvider({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<List<IngredientModel>> getIngredientsList() async {
    final snapshot = await _firestore.collection('ingredients').get();
    return snapshot.docs.map((doc) {
      return IngredientModel.fromJson(doc.data());
    }).toList();
  }
}
