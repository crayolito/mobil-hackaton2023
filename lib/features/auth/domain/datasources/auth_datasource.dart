import 'package:notification/features/auth/domain/entities/usuarioA.dart';

abstract class AuthDataSource {
  Future<UsuarioA> login(int nrCi, String password);
}
