part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final List<Ingredient> ingredients;

  const AddToCart({required this.ingredients});

  @override
  List<Object> get props => [ingredients];
}
