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
