part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int? selectedIndex;

  final List<IngredientCategory> ingredientCategory;

  const HomeState({this.ingredientCategory = const [], this.selectedIndex});
  HomeState copyWith(
      {int? selectedIndex, List<IngredientCategory>? ingredientCategory}) {
    return HomeState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        ingredientCategory: ingredientCategory ?? this.ingredientCategory);
  }

  @override
  List<Object?> get props => [selectedIndex, ingredientCategory];
}
