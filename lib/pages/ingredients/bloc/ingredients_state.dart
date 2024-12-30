part of 'ingredients_bloc.dart';

class IngredientsState extends Equatable {
  final List<Ingredient> ingredients;
  final bool isLoading;
  const IngredientsState({
    this.ingredients = const [],
    this.isLoading = false,
  });

  IngredientsState copyWith({
    List<Ingredient>? ingredients,
    bool? isLoading,
  }) {
    return IngredientsState(
      ingredients: ingredients ?? this.ingredients,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [ingredients, isLoading];
}
