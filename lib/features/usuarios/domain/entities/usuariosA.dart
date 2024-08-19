import 'package:notification/features/auth/domain/entities/usuarioA.dart';

class UsuariosAMapper {
  // CONVIERTE EL JSON EN UN LISTA DE OBJETOS DE TIPO USUARIO
  List<UsuarioA> jsonConvertList(data) =>
      (data as List).map((usuario) => UsuarioA.fromJson(usuario)).toList();
}
