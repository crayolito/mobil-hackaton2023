part of 'login_form_bloc.dart';

abstract class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnNrCiChanged extends LoginFormEvent {
  final int nrCi;
  const OnNrCiChanged(this.nrCi);
}

class OnPasswordChanged extends LoginFormEvent {
  final String password;
  const OnPasswordChanged(this.password);
}

class OnFormSubmit extends LoginFormEvent {}
