import 'package:notification/features/auth/domain/entities/usuarioA.dart';

abstract class UsuariosRepository {
  Future<List<UsuarioA>> getUsuarios();
}
