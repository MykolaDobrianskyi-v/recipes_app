import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String imageUrl;
  final String label;

  const Ingredient({
    required this.imageUrl,
    required this.label,
  });

  @override
  List<Object?> get props => [imageUrl, label];
}
