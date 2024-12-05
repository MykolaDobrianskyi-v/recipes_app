part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class OnEmailChanged extends LoginEvent {
  final String email;

  const OnEmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class OnPasswordChanged extends LoginEvent {
  final String password;

  const OnPasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}
