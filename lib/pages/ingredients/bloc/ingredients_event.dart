part of 'ingredients_bloc.dart';

abstract class IngredientsEvent extends Equatable {
  const IngredientsEvent();

  @override
  List<Object> get props => [];
}

class OnInit extends IngredientsEvent {}
