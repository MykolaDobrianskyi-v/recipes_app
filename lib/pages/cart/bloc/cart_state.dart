part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<Ingredient> cartItems;
  const CartState({
    this.cartItems = const [],
  });
  CartState copyWith({List<Ingredient>? cartItems}) {
    return CartState(cartItems: cartItems ?? this.cartItems);
  }

  @override
  List<Object> get props => [cartItems];
}
