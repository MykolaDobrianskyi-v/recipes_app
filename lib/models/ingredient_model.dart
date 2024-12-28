import 'package:equatable/equatable.dart';

class IngredientModel extends Equatable {
  final String imageUrl;
  final String label;

  const IngredientModel({
    required this.imageUrl,
    required this.label,
  });
  IngredientModel.fromJson(Map<String, dynamic> json)
      : this(
          imageUrl: json['imageUrl'],
          label: json['label'],
        );

  @override
  List<Object?> get props => [imageUrl, label];
}
