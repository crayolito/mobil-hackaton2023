
import 'package:notification/features/auth/domain/entities/usuarioA.dart';

abstract class UsuariosDataSource {
  Future<List<UsuarioA>> getUsuarios();

}
