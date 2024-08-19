part of 'auth_bloc.dart';

enum AuthStatus { checking, authenticated, notAuthentucated }

enum Rol { police, neighbor, none }

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final Usuario? usuario;
  final String errorMessage;
  final Rol rol;
  final UsuarioA? usuarioA;

  //

  const AuthState(
      {this.authStatus = AuthStatus.checking,
      this.usuario,
      this.rol = Rol.none,
      this.errorMessage = '',
      this.usuarioA});

  AuthState copyWith(
          {AuthStatus? authStatus,
          Usuario? usuario,
          String? errorMessage,
          Rol? rol,
          UsuarioA? usuarioA}) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          usuario: usuario ?? this.usuario,
          errorMessage: errorMessage ?? this.errorMessage,
          rol: rol ?? this.rol,
          usuarioA: usuarioA ?? this.usuarioA);

  @override
  List<Object?> get props => [authStatus, usuario, errorMessage, rol, usuarioA];
}
