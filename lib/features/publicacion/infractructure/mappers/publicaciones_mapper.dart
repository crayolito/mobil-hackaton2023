import 'package:notification/features/publicacion/domain/domain.dart';
import 'package:notification/features/publicacion/infractructure/infrastructure.dart';

class PublicacionesMapper {
  // CONVIERTE EL JSON EN UN LISTA DE OBJETOS DE TIPO PUBLICACION
  List<Publicacion> jsonConvertList(data) => (data as List)
      .map((usuario) => PublicacionMapper().fromJson(usuario))
      .toList();
}
