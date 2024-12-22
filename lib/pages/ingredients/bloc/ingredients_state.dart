part of 'ingredients_bloc.dart';

sealed class IngredientsState extends Equatable {
  const IngredientsState();
  
  @override
  List<Object> get props => [];
}

final class IngredientsInitial extends IngredientsState {}
