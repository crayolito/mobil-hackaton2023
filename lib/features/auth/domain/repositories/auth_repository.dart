import 'package:notification/features/auth/domain/entities/usuarioA.dart';

abstract class AuthRepository {
  Future<UsuarioA> login(int nrCi, String password);
}
