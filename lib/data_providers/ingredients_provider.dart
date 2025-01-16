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

  Future<List<IngredientModel>> fetchIngredientsByCategories(
      String category) async {
    final snapshot = await _firestore
        .collection('ingredients')
        .where('category', isEqualTo: category)
        .get();

    return snapshot.docs.map((doc) {
      final data = {
        ...doc.data(),
        'id': doc.id,
      };
      return IngredientModel.fromJson(data);
    }).toList();
  }

  Future<IngredientModel?> fetchIngredientById(String id) async {
    final snapshot = await _firestore.collection('ingredients').doc(id).get();
    if (!snapshot.exists || snapshot.data() == null) {
      return null;
    }

    return IngredientModel.fromJson(snapshot.data()!);
  }
}
