part of 'ingredients_bloc.dart';

class IngredientsState extends Equatable {
  final List<Ingredient> ingredients;
  final bool? isLoading;
  final String? category;
  const IngredientsState(
      {this.ingredients = const [], this.isLoading = false, this.category});

  IngredientsState copyWith({
    List<Ingredient>? ingredients,
    bool? isLoading,
    String? category,
  }) {
    return IngredientsState(
      ingredients: ingredients ?? this.ingredients,
      isLoading: isLoading ?? this.isLoading,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [ingredients, isLoading, category];
}
