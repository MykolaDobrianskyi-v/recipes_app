import 'package:equatable/equatable.dart';

class IngredientCategory extends Equatable {
  final String imageUrl;
  final String label;

  const IngredientCategory({required this.imageUrl, required this.label});

  @override
  List<Object?> get props => [imageUrl, label];
}
