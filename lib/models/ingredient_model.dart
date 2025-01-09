import 'package:equatable/equatable.dart';

class IngredientModel extends Equatable {
  final String id;
  final String imageUrl;
  final String label;
  final String category;

  const IngredientModel({
    required this.id,
    required this.imageUrl,
    required this.label,
    required this.category,
  });
  IngredientModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          imageUrl: json['imageUrl'],
          label: json['label'],
          category: json['category'],
        );

  @override
  List<Object?> get props => [id, imageUrl, label, category];
}
