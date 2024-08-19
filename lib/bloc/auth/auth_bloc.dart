import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notification/features/auth/domain/entities/usuario.dart';
import 'package:notification/features/auth/domain/entities/usuarioA.dart';
import 'package:notification/features/auth/infractructure/errors/auth_errors.dart';
import 'package:notification/features/auth/infractructure/repositories/auth_repository_impl.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authRepositoryImpl = AuthRepositoryImpl();

  AuthBloc() : super(const AuthState()) {
    on<OnLoginUser>(_onLoginUser);
    on<OnLogout>(_onlogout);
  }

  Future<void> _onLoginUser(OnLoginUser event, Emitter<AuthState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final usuarioResponse =
          await authRepositoryImpl.login(event.nrCi, event.password);

      // print(usuarioResponse);
      _setLoggedUser(usuarioResponse, emit);
    } on CustomError catch (e) {
      add(OnLogout(e.message));
    } catch (e) {
      add(const OnLogout('Error no controlado'));
    }
  }

  void _setLoggedUser(UsuarioA usuarioA, Emitter<AuthState> emit) {
    emit(state.copyWith(
        usuarioA: usuarioA,
        authStatus: AuthStatus.authenticated,
        errorMessage: ''));
  }

  Future<void> _onlogout(OnLogout event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
        authStatus: AuthStatus.notAuthentucated,
        usuario: null,
        errorMessage: event.messageError));
  }
}
