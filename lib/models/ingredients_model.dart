import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String imageUrl;
  final String label;

  const Ingredient({
    required this.imageUrl,
    required this.label,
  });
  Ingredient.fromJson(Map<String, dynamic> json)
      : this(
          imageUrl: json['imageUrl'],
          label: json['label'],
        );

  @override
  List<Object?> get props => [imageUrl, label];
}
