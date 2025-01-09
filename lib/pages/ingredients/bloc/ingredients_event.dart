part of 'ingredients_bloc.dart';

sealed class IngredientsEvent extends Equatable {
  const IngredientsEvent();

  @override
  List<Object> get props => [];
}

class OnInit extends IngredientsEvent {
  final String category;

  const OnInit({required this.category});

  @override
  List<Object> get props => [category];
}

class OnAddToCart extends IngredientsEvent {
  final Ingredient ingredient;

  const OnAddToCart({required this.ingredient});

  @override
  List<Object> get props => [ingredient];
}

class UpdateSelectedIngredients extends IngredientsEvent {
  final List<Ingredient> ingredients;

  const UpdateSelectedIngredients({required this.ingredients});

  @override
  List<Object> get props => [ingredients];
}
