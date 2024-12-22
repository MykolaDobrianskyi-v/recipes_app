import 'package:equatable/equatable.dart';

class IngredientCategory extends Equatable {
  final String imagePath;
  final String label;

  const IngredientCategory({required this.imagePath, required this.label});

  @override
  List<Object?> get props => [imagePath, label];
}
