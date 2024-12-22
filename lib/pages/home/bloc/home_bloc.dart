import 'package:bloc/bloc.dart';
import 'package:chat_app/constants/images_data/images.dart';
import 'package:chat_app/constants/text_data/text_constants.dart';
import 'package:chat_app/models/ingredient_category.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<OnInit>(_onInit);
    on<OnItemTapped>(_onItemTapped);

    add(OnInit());
  }
  void _onItemTapped(OnItemTapped event, Emitter<HomeState> emit) {
    emit(HomeState(selectedIndex: event.selectedIndex));
  }

  void _onInit(OnInit event, Emitter<HomeState> emit) {
    final List<IngredientCategory> ingredientCategory = [
      const IngredientCategory(
        imagePath: ImagePath.vegetableImagePath,
        label: TextConstants.vegetables,
      ),
      const IngredientCategory(
        imagePath: ImagePath.spicesImagePath,
        label: TextConstants.spices,
      ),
      const IngredientCategory(
        imagePath: ImagePath.cerealsImagePath,
        label: TextConstants.cereals,
      ),
      const IngredientCategory(
        imagePath: ImagePath.meatImagePath,
        label: TextConstants.meat,
      ),
      const IngredientCategory(
        imagePath: ImagePath.fruitImagePath,
        label: TextConstants.fruits,
      ),
      const IngredientCategory(
        imagePath: ImagePath.seafoodImagePath,
        label: TextConstants.seafood,
      ),
      const IngredientCategory(
        imagePath: ImagePath.sugarImagePath,
        label: TextConstants.sugar,
      ),
      const IngredientCategory(
        imagePath: ImagePath.milImagePath,
        label: TextConstants.dairy,
      ),
      const IngredientCategory(
        imagePath: ImagePath.eggsImagePath,
        label: TextConstants.other,
      ),
    ];
    emit(state.copyWith(ingredientCategory: ingredientCategory));
  }
}
