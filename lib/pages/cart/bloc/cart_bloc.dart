import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/models/ingredients.dart';
import 'package:chat_app/repositories/ingredients_repository.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final IngredientsRepository _ingredientsRepository;
  CartBloc({required IngredientsRepository ingredientsRepository})
      : _ingredientsRepository = ingredientsRepository,
        super(const CartState()) {
    on<CartEvent>((event, emit) {});
    on<AddToCart>(_onAddToCart);
    _init();
  }
  void _init() {
    streamSubscription =
        _ingredientsRepository.ingredients.listen((ingredient) {
      add(AddToCart(ingredients: ingredient));
    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }

  late final StreamSubscription streamSubscription;
  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    emit(state.copyWith(
      cartItems: event.ingredients,
    ));
  }
}
