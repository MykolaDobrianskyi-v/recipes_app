import 'package:chat_app/data_providers/ingredients_provider.dart';
import 'package:chat_app/data_providers/storage_provider.dart';
import 'package:chat_app/models/ingredients.dart';

class IngredientsRepository {
  final StorageProvider _storageProvider;
  final IngredientsProvider _ingredientProvider;

  IngredientsRepository(
      {required StorageProvider storageProvider,
      required IngredientsProvider ingredientProvider})
      : _storageProvider = storageProvider,
        _ingredientProvider = ingredientProvider;

  Future<List<Ingredient>> getIngredientsList() async {
    final ingredients = await _ingredientProvider.getIngredientsList();

    final asyncParsedIngredients = ingredients.map((element) async {
      return Ingredient(
        imageUrl: await _storageProvider.getImageUrl(element.imageUrl),
        label: element.label,
      );
    });
    return Future.wait(asyncParsedIngredients);
  }
}
