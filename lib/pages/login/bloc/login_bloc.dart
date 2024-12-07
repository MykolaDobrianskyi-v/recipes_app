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
    if (!_isEmailValid(state.email) || !_isPasswordValid(state.password)) {
      emit(state.copyWith(
        errorMessage: "Invalid email or password",
      ));
      return;
    }

    try {
      await auth.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
    } catch (e) {
      emit(state.copyWith(
        errorMessage: "Failed to login: ${e.toString()}",
      ));
    }
  }

  void _onEmailChanged(OnEmailChanged event, Emitter<LoginState> emit) {
    final email = event.email;
    final isValid = _isEmailValid(email);
    emit(state.copyWith(
      email: email,
      isEmailValid: isValid,
      errorMessage: isValid ? null : "Invalid email format",
    ));
  }

  void _onPasswordChanged(OnPasswordChanged event, Emitter<LoginState> emit) {
    final password = event.password;
    final isValid = _isPasswordValid(password);
    emit(state.copyWith(
      password: password,
      isPasswordValid: isValid,
      errorMessage: isValid ? null : "Password must be at least 6 characters",
    ));
  }

  bool _isEmailValid(String email) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }
}
