part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final String? errorMessage;

  const LoginState({
    this.email = '',
    this.password = '',
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.errorMessage,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isPasswordValid,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, isEmailValid, isPasswordValid, errorMessage];
}
