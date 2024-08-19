import 'package:notification/features/notificacion/domain/entities/comentario.dart';
import 'package:notification/features/notificacion/domain/entities/notificacion.dart';

abstract class NotificacionDataSource {
  Future<List<Notificacion>> getNotificaciones(int idPersona);
  Future<List<Comentario>> onGetComentarios(String idPublicacion);
  Future<void> onSaveComentario(String idPublicacion, String titulo,
      String descripcion, String imagen, String direccion);
}
