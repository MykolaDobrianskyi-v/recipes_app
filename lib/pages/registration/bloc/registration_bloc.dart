import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final FirebaseAuth auth;
  RegistrationBloc({required this.auth}) : super(const RegistrationState()) {
    on<RegistrationEvent>(
      (event, emit) {},
    );
    on<RegistrationSubmitted>(_signUpWithEmailAndPassword);
    on<OnEmailChanged>(_onEmailChanged);
    on<OnPasswordChanged>(_onPasswordChanged);
  }
  Future<void> _signUpWithEmailAndPassword(
      RegistrationSubmitted event, Emitter<RegistrationState> emit) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: state.email, password: state.password);
    } catch (e) {
      print(e);
    }
  }

  void _onEmailChanged(OnEmailChanged event, Emitter<RegistrationState> emit) {
    emit(RegistrationState(email: event.email, password: state.password));
  }

  void _onPasswordChanged(
      OnPasswordChanged event, Emitter<RegistrationState> emit) {
    emit(RegistrationState(email: state.email, password: event.password));
  }
}
