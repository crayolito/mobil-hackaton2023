import 'package:notification/features/auth/domain/entities/usuario.dart';
import 'package:notification/features/auth/infractructure/mappers/user_mapper.dart';

class UsuariosMapper {
  // CONVIERTE EL JSON EN UN LISTA DE OBJETOS DE TIPO USUARIO
  List<Usuario> jsonConvertList(data) =>
      (data as List).map((usuario) => UserMapper().fromJson(usuario)).toList();
}
