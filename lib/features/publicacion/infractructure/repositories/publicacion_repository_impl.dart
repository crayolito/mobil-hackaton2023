import 'package:notification/features/publicacion/domain/domain.dart';
import 'package:notification/features/publicacion/infractructure/datasources/publicacion_datasource_impl.dart';

class PublicacionRepositoryImpl extends PublicacionRepository {
  final PublicacionDataSource dataSource;

  PublicacionRepositoryImpl({PublicacionDataSource? dataSource})
      : dataSource = dataSource ?? PublicacionDataSourceImpl();

  @override
  Future<String> uploadImage(String path) {
    return dataSource.uploadImage(path);
  }

  @override
  Future<void> updatePublicacion(
      int idPersona,
      String titulo,
      String descripcion,
      String imagen,
      double longitude,
      double latitude,
      List<int> paraQuienes) {
    return dataSource.updatePublicacion(idPersona, titulo, descripcion, imagen,
        longitude, latitude, paraQuienes);
  }

  @override
  Future<List<Publicacion>> getPublicaciones(String idPersona) {
    return dataSource.getPublicaciones(idPersona);
  }
}
