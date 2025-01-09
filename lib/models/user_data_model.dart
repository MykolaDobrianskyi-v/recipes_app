import 'package:equatable/equatable.dart';

class UserDataModel extends Equatable {
  final List<String> selectedIngredientsId;

  const UserDataModel({
    required this.selectedIngredientsId,
  });
  const UserDataModel.empty() : this(selectedIngredientsId: const []);

  UserDataModel.fromJson(Map<String, dynamic> json)
      : this(
          selectedIngredientsId: json['selectedIngredientsId'],
        );
  Map<String, dynamic> toJson() => {
        'selectedIngredientsId': selectedIngredientsId,
      };

  @override
  List<Object?> get props => [selectedIngredientsId];
}
