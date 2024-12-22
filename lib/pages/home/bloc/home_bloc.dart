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

  void _onInit(OnInit event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final categories =
        await _ingredientsCategoriesRepository.getIngredientCategories();

    emit(
      state.copyWith(
        ingredientCategory: categories,
        isLoading: false,
      ),
    );
  }
}
