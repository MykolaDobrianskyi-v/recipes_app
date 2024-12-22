import 'package:chat_app/data_providers/categories_provider.dart';
import 'package:chat_app/data_providers/storage_provider.dart';
import 'package:chat_app/models/ingredient_category.dart';

class IngredientsCategoriesRepository {
  final CategoriesProvider _categoriesProvider;
  final StorageProvider _storageProvider;

  IngredientsCategoriesRepository({
    required StorageProvider storageProvider,
    required CategoriesProvider categoriesProvider,
  })  : _categoriesProvider = categoriesProvider,
        _storageProvider = storageProvider;

  Future<List<IngredientCategory>> getIngredientCategories() async {
    final categories = await _categoriesProvider.getIngredientCategories();

    final asyncParsedCategories = categories.map((element) async {
      return IngredientCategory(
        imageUrl: await _storageProvider.getImageUrl(element.imageUrl),
        label: element.label,
      );
    });

    return Future.wait(asyncParsedCategories);
  }
}
