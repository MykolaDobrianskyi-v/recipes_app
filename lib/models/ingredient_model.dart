import 'package:equatable/equatable.dart';

class IngredientModel extends Equatable {
  final String imageUrl;
  final String label;
  final String category;

  const IngredientModel({
    required this.imageUrl,
    required this.label,
    required this.category,
  });
  IngredientModel.fromJson(Map<String, dynamic> json)
      : this(
          imageUrl: json['imageUrl'],
          label: json['label'],
          category: json['category'],
        );

  @override
  List<Object?> get props => [imageUrl, label, category];
}
