import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final StreamController<LoginFormState> _loginController = StreamController();
  final AuthBloc authBloc;

  LoginFormBloc({required this.authBloc}) : super(const LoginFormState()) {
    on<LoginFormEvent>((event, emit) {});
    on<OnNrCiChanged>(_onNrCi);
    on<OnPasswordChanged>(_onPasswordChanged);
    on<OnFormSubmit>(_onFormSubmit);
  }

  void _onNrCi(OnNrCiChanged event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(nrCi: event.nrCi));
  }

  void _onPasswordChanged(
      OnPasswordChanged event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onFormSubmit(OnFormSubmit event, Emitter<LoginFormState> emit) async {
    // _touchEveryFiled(event, emit);
    authBloc.add(OnLoginUser(state.nrCi, state.password));
  }

  // _touchEveryFiled(OnFormSubmit event, Emitter<LoginFormState> emit) {
  //   final email = Email.dirty(state.email.value);
  //   final password = Password.dirty(state.password.value);
  //   emit(state.copyWith(
  //       isFormPosted: true,
  //       email: email,
  //       password: password,
  //       isValid: Formz.validate([email, password])));
  // }

  @override
  Future<void> close() {
    _loginController.close();
    return super.close();
  }
}
