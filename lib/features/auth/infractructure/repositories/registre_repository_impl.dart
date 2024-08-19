import 'package:notification/features/auth/domain/datasources/registre_datasource.dart';
import 'package:notification/features/auth/domain/entities/usuarioA.dart';
import 'package:notification/features/auth/domain/repositories/registre_repository.dart';
import 'package:notification/features/auth/infractructure/datasources/registre_datasource_impl.dart';

class RegistreRepositoryImpl extends RegistreRepository {
  final RegistreDataSource dataSource;

  RegistreRepositoryImpl({RegistreDataSource? dataSource})
      : dataSource = dataSource ?? RegistreDataSourceImpl();

  @override
  Future<UsuarioA> onRegistreUser(
      String name,
      int ci,
      int phone_number,
      String photo_url,
      String password,
      double longitude,
      double latitude,
      String idToken) async {
    return await dataSource.onRegistreUser(name, ci, phone_number, photo_url,
        password, longitude, latitude, idToken);
  }
}
