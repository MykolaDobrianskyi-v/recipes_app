import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:chat_app/models/ingredients.dart';
import 'package:chat_app/repositories/ingredients_repository.dart';
import 'package:equatable/equatable.dart';

part 'ingredients_event.dart';
part 'ingredients_state.dart';

class IngredientsBloc extends Bloc<IngredientsEvent, IngredientsState> {
  final IngredientsRepository _ingredientsRepository;

  IngredientsBloc({
    required String category,
    required IngredientsRepository ingredientsRepository,
  })  : _ingredientsRepository = ingredientsRepository,
        super(const IngredientsState()) {
    on<IngredientsEvent>((event, emit) {});
    on<OnInit>(_onInit);
    on<OnAddToCart>(_onAddToCart);

    on<UpdateSelectedIngredients>(_onUpdateSelectedIngredients);

    add(OnInit(category: category));
    _init();
    close();
  }
  late final StreamSubscription streamSubscription;

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

  void _init() {
    streamSubscription =
        _ingredientsRepository.ingredients.listen((ingredients) {
      add(UpdateSelectedIngredients(ingredients: ingredients));
    });
  }

  void _onUpdateSelectedIngredients(
      UpdateSelectedIngredients event, Emitter<IngredientsState> emit) {
    emit(state.copyWith(
      selectedIngredients: event.ingredients,
    ));
  }

  void _onInit(OnInit event, Emitter<IngredientsState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final ingredients = await _ingredientsRepository
        .fetchIngredientsByCategories(event.category);

    emit(
      state.copyWith(
        ingredients: ingredients,
        isLoading: false,
      ),
    );
  }

  void _onAddToCart(OnAddToCart event, Emitter<IngredientsState> emit) {
    _ingredientsRepository.addIngredientToList(event.ingredient.id);
  }
}
