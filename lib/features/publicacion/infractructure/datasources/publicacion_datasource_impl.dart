import 'package:dio/dio.dart';
import 'package:notification/constants/environment.dart';
import 'package:notification/features/auth/infractructure/datasources/registre_datasource_impl.dart';
import 'package:notification/features/publicacion/domain/domain.dart';
import 'package:notification/features/publicacion/infractructure/mappers/publicaciones_mapper.dart';

class PublicacionDataSourceImpl extends PublicacionDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiURL,
  ));

  Future<String> uploadImage(String path) async {
    try {
      final fileName = path.split('/').last;
      final FormData data = FormData.fromMap({
        'archivo': await MultipartFile.fromFileSync(path, filename: fileName),
      });
      final response = await dio.post('/publicacion/updateImage', data: data);
      return response.data;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> updatePublicacion(
      int idPersona,
      String titulo,
      String descripcion,
      String imagen,
      double longitude,
      double latitude,
      List<int> paraQuienes) async {
    try {
      final fileName = imagen.split('/').last;
      final FormData data = FormData.fromMap({
        'archivo': MultipartFile.fromFileSync(imagen, filename: fileName),
      });
      final responseImagen =
          await dio.post('/publications/uploadImage', data: data);
      String urlR = urlResponse.fromJson(responseImagen.data).url;

      final response = await dio.post('/publications', data: {
        'de_persona': idPersona,
        'title': titulo,
        'description': descripcion,
        'image': urlR,
        'longitude': longitude,
        'latitude': latitude,
        'paraQuienes': paraQuienes,
      });
      print(response.data);
      return response.data;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Publicacion>> getPublicaciones(String idPersona) async {
    try {
      final response = await dio.get('/publicacion/$idPersona');
      final publicacionesReponse =
          PublicacionesMapper().jsonConvertList(response.data);
      return publicacionesReponse;
    } catch (e) {
      throw Exception();
    }
  }
}
