import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String id;
  final String imageUrl;
  final String label;
  final String category;

  const Ingredient({
    required this.id,
    required this.imageUrl,
    required this.label,
    required this.category,
  });

  @override
  List<Object?> get props => [id, imageUrl, label, category];
}
