import 'package:chat_app/data_providers/ingredients_provider.dart';
import 'package:chat_app/data_providers/storage_provider.dart';
import 'package:chat_app/data_providers/user_provider.dart';
import 'package:chat_app/models/ingredients.dart';

class IngredientsRepository {
  final StorageProvider _storageProvider;
  final IngredientsProvider _ingredientProvider;
  final UserProvider _userProvider;

  IngredientsRepository(
      {required StorageProvider storageProvider,
      required IngredientsProvider ingredientProvider,
      required UserProvider userProvider})
      : _storageProvider = storageProvider,
        _ingredientProvider = ingredientProvider,
        _userProvider = userProvider;

  Future<List<Ingredient>> getIngredientsList() async {
    final ingredients = await _ingredientProvider.getIngredientsList();

    final asyncParsedIngredients = ingredients.map((element) async {
      return Ingredient(
        id: element.id,
        imageUrl: await _storageProvider.getImageUrl(element.imageUrl),
        label: element.label,
        category: element.category,
      );
    });
    return Future.wait(asyncParsedIngredients);
  }

  Future<List<Ingredient>> fetchIngredientsByCategories(String category) async {
    final ingredients =
        await _ingredientProvider.fetchIngredientsByCategories(category);

    final asyncParsedIngredients = ingredients.map((element) async {
      return Ingredient(
        id: element.id,
        imageUrl: await _storageProvider.getImageUrl(element.imageUrl),
        label: element.label,
        category: element.category,
      );
    });
    return Future.wait(asyncParsedIngredients);
  }

  Stream<List<Ingredient>> get ingredients => _userProvider.userData.asyncMap(
        (userData) async {
          return await Future.wait(
            userData?.selectedIngredientsId.map(
                  (ingredientId) async {
                    return (await fetchIngredientById(ingredientId))!;
                  },
                ) ??
                [],
          );
        },
      );
  Future<Ingredient?> fetchIngredientById(String id) async {
    final ingredient = await _ingredientProvider.fetchIngredientById(id);
    if (ingredient == null) {
      return null;
    }
    return Ingredient(
      id: ingredient.id,
      imageUrl: await _storageProvider.getImageUrl(ingredient.imageUrl),
      label: ingredient.label,
      category: ingredient.category,
    );
  }

  Future<void> addIngredientToList(String? id) async {
    await _userProvider.addIngredientToList(id!);
  }
}
