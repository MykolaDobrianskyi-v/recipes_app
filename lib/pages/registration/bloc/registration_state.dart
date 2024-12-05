part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final String email;
  final String password;

  const RegistrationState({this.email = '', this.password = ''});

  @override
  List<Object> get props => [email, password];
}
