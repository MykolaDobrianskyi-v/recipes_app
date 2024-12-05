part of 'login_bloc.dart';

enum LoginStatus {
  init,
  loading,
}

class LoginState extends Equatable {
  final String email;
  final String password;

  const LoginState({this.email = '', this.password = ''});

  @override
  List<Object?> get props => [email, password];
}
