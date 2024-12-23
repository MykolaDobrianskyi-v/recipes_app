import 'package:equatable/equatable.dart';

class IngredientsList extends Equatable {
  final String imageUrl;
  final String label;

  const IngredientsList({
    required this.imageUrl,
    required this.label,
  });

  @override
  List<Object?> get props => [imageUrl, label];
}
