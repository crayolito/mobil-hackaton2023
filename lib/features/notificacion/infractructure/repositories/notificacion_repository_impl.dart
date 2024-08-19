import 'package:notification/features/notificacion/domain/datasources/notificacion_datasource.dart';
import 'package:notification/features/notificacion/domain/entities/comentario.dart';
import 'package:notification/features/notificacion/domain/entities/notificacion.dart';
import 'package:notification/features/notificacion/domain/repositories/notificacion_repository.dart';
import 'package:notification/features/notificacion/infractructure/datasources/notificacion_datasource_impl.dart';

class NotificacionRepositoryImpl extends NotificacionRepository {
  final NotificacionDataSource dataSource;

  NotificacionRepositoryImpl({NotificacionDataSource? dataSource})
      : dataSource = dataSource ?? NotificacionDataSourceImpl();

  @override
  Future<List<Notificacion>> getNotificaciones(int idPersona) {
    return dataSource.getNotificaciones(idPersona);
  }

  @override
  Future<List<Comentario>> onGetComentarios(String idPublicacion) async {
    return await dataSource.onGetComentarios(idPublicacion);
  }

  @override
  Future<void> onSaveComentario(String idPublicacion, String titulo,
      String descripcion, String imagen, String direccion) {
    return dataSource.onSaveComentario(
        idPublicacion, titulo, descripcion, imagen, direccion);
  }
}
