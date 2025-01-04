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

    add(OnInit(category: category));
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
}
