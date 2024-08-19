import 'package:notification/features/publicacion/domain/domain.dart';

abstract class PublicacionDataSource {
  Future<String> uploadImage(String path);
  Future<void> updatePublicacion(
      int idPersona,
      String titulo,
      String descripcion,
      String imagen,
      double longitude,
      double latitude,
      List<int> paraQuienes);
  Future<List<Publicacion>> getPublicaciones(String idPersona);
}
