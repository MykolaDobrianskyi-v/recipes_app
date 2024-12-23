import 'package:chat_app/models/ingredients_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IngredientProvider {
  final FirebaseFirestore _firestore;

  IngredientProvider({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<List<IngredientsModel>> getIngredientsList() async {
    final snapshot = await _firestore.collection('ingredients').get();
    return snapshot.docs.map((doc) {
      return IngredientsModel.fromJson(doc.data());
    }).toList();
  }
}
