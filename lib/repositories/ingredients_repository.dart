import 'package:chat_app/data_providers/ingredient_provider.dart';
import 'package:chat_app/data_providers/storage_provider.dart';
import 'package:chat_app/models/ingredients.dart';

class IngredientsRepository {
  final StorageProvider _storageProvider;
  final IngredientProvider _ingredientProvider;

  IngredientsRepository(
      {required StorageProvider storageProvider,
      required IngredientProvider ingredientProvider})
      : _storageProvider = storageProvider,
        _ingredientProvider = ingredientProvider;

  Future<List<IngredientsList>> getIngredientsList() async {
    final ingredients = await _ingredientProvider.getIngredientsList();

    final asyncParsedIngredients = ingredients.map((element) async {
      return IngredientsList(
        imageUrl: await _storageProvider.getImageUrl(element.imageUrl),
        label: element.label,
      );
    });
    return Future.wait(asyncParsedIngredients);
  }
}
