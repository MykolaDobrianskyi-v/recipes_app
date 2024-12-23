import 'package:equatable/equatable.dart';

class IngredientCategoryModel extends Equatable {
  final String imageUrl;
  final String label;

  const IngredientCategoryModel({required this.imageUrl, required this.label});
  IngredientCategoryModel.fromJson(Map<String, dynamic> json)
      : this(
          imageUrl: json['imageUrl'],
          label: json['label'],
        );

  @override
  List<Object?> get props => [imageUrl, label];
}
