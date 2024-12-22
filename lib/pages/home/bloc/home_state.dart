part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int? selectedIndex;

  final List<IngredientCategory> ingredientCategory;

  final bool? isLoading;

  const HomeState({
    this.ingredientCategory = const [],
    this.selectedIndex,
    this.isLoading = false,
  });

  HomeState copyWith({
    int? selectedIndex,
    List<IngredientCategory>? ingredientCategory,
    bool? isLoading,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      ingredientCategory: ingredientCategory ?? this.ingredientCategory,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        selectedIndex,
        ingredientCategory,
        isLoading,
      ];
}
