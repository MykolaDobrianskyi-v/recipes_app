import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth auth;
  LoginBloc({required this.auth}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) {});
    on<LoginSubmitted>(_loginWithEmailAndPassword);
    on<OnEmailChanged>(_onEmailChanged);
    on<OnPasswordChanged>(_onPasswordChanged);
  }
  Future<void> _loginWithEmailAndPassword(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    try {
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      await auth.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
    } catch (e) {
      print(e);
    }
  }

  void _onEmailChanged(OnEmailChanged event, Emitter<LoginState> emit) async {
    emit(LoginState(email: event.email, password: state.password));
  }

  void _onPasswordChanged(
      OnPasswordChanged event, Emitter<LoginState> emit) async {
    emit(LoginState(email: state.email, password: event.password));
  }
}
