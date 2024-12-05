part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class RegistrationSubmitted extends RegistrationEvent {
  @override
  List<Object?> get props => [];
}

class OnEmailChanged extends RegistrationEvent {
  final String email;

  const OnEmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class OnPasswordChanged extends RegistrationEvent {
  final String password;

  const OnPasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}
