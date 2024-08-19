import 'package:dio/dio.dart';
import 'package:notification/constants/environment.dart';
import 'package:notification/features/notificacion/domain/datasources/notificacion_datasource.dart';
import 'package:notification/features/notificacion/domain/entities/comentario.dart';
import 'package:notification/features/notificacion/domain/entities/notificacion.dart';
import 'package:notification/features/notificacion/infractructure/mappers/comentarios_mapper.dart';
import 'package:notification/features/notificacion/infractructure/mappers/notificaciones_mapper.dart';

class NotificacionDataSourceImpl extends NotificacionDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiURL,
  ));

  @override
  Future<List<Notificacion>> getNotificaciones(int idPersona) async {
    try {
      final response =
          await dio.post('/notifications/IdUser', data: {"idUser": idPersona});
      print(response.data);
      final publicacionesReponse =
          NotificacionesMapper().jsonConvertList(response.data);
      return publicacionesReponse;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Comentario>> onGetComentarios(String idPublicacion) async {
    try {
      final response = await dio.get('/comentario/$idPublicacion');
      // print(response.data);
      final publicacionesReponse =
          ComentariosMapper().jsonConvertList(response.data);
      return publicacionesReponse;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> onSaveComentario(String idPublicacion, String titulo,
      String descripcion, String imagen, String direccion) async {
    try {
      final fileName = imagen.split('/').last;
      final FormData data = FormData.fromMap({
        'archivo': MultipartFile.fromFileSync(imagen, filename: fileName),
      });
      final responseImagen =
          await dio.post('/publicacion/updateImage', data: data);

      final response = await dio.post('/comentario/new', data: {
        'idPublicacion': idPublicacion,
        'titulo': titulo,
        'descripcion': descripcion,
        'imagen': responseImagen.data,
        'direccion': direccion,
      });

      print(response.data);
    } catch (e) {
      throw Exception();
    }
  }
}
