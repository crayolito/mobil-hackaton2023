part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnLoginUser extends AuthEvent {
  final int nrCi;
  final String password;
  const OnLoginUser(this.nrCi, this.password);
}

class OnCheckAuthStatus extends AuthEvent {}

class OnLogout extends AuthEvent {
  final String? messageError;

  const OnLogout(this.messageError);
}
