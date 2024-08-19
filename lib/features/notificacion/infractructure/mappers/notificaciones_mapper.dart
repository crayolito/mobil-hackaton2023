import 'package:notification/features/notificacion/domain/entities/notificacion.dart';
import 'package:notification/features/notificacion/infractructure/mappers/notificacion_mapper.dart';

class NotificacionesMapper {
  // CONVIERTE EL JSON EN UN LISTA DE OBJETOS DE TIPO PUBLICACION
  List<Notificacion> jsonConvertList(data) => (data as List)
      .map((notificacion) => NotificacionMapper().fromJson(notificacion))
      .toList();
}
