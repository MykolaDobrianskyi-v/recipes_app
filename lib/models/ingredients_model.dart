import 'package:equatable/equatable.dart';

class IngredientsModel extends Equatable {
  final String imageUrl;
  final String label;

  const IngredientsModel({
    required this.imageUrl,
    required this.label,
  });
  IngredientsModel.fromJson(Map<String, dynamic> json)
      : this(
          imageUrl: json['imageUrl'],
          label: json['label'],
        );

  @override
  List<Object?> get props => [imageUrl, label];
}
