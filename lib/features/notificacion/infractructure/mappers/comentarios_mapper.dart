import 'package:notification/features/notificacion/domain/entities/comentario.dart';
import 'package:notification/features/notificacion/infractructure/mappers/comentario_mapper.dart';

class ComentariosMapper {
  // CONVIERTE EL JSON EN UN LISTA DE OBJETOS DE TIPO PUBLICACION
  List<Comentario> jsonConvertList(data) => (data as List)
      .map((comentario) => ComentarioMapper().fromJson(comentario))
      .toList();
}
