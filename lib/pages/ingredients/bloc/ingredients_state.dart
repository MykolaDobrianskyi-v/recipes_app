part of 'ingredients_bloc.dart';

class IngredientsState extends Equatable {
  final List<Ingredient> ingredients;
  final List<Ingredient> selectedIngredients;
  final bool? isLoading;
  final String? category;

  const IngredientsState({
    this.selectedIngredients = const [],
    this.ingredients = const [],
    this.isLoading = false,
    this.category,
  });

  IngredientsState copyWith({
    List<Ingredient>? ingredients,
    bool? isLoading,
    String? category,
    List<Ingredient>? selectedIngredients,
  }) {
    return IngredientsState(
      ingredients: ingredients ?? this.ingredients,
      isLoading: isLoading ?? this.isLoading,
      category: category ?? this.category,
      selectedIngredients: selectedIngredients ?? this.selectedIngredients,
    );
  }

  @override
  List<Object?> get props =>
      [ingredients, isLoading, category, selectedIngredients];
}
