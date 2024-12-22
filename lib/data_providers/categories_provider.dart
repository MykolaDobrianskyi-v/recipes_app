import 'package:chat_app/models/ingredient_category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesProvider {
  final FirebaseFirestore _firestore;

  CategoriesProvider({required FirebaseFirestore firestore})
      : _firestore = firestore;

  Future<List<IngredientCategoryModel>> getIngredientCategories() async {
    final snapshot = await _firestore.collection('categories').get();
    return snapshot.docs.map((doc) {
      return IngredientCategoryModel.fromJson(doc.data());
    }).toList();
  }
}
