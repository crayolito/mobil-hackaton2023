import 'package:notification/features/auth/domain/datasources/auth_datasource.dart';
import 'package:notification/features/auth/domain/entities/usuarioA.dart';
import 'package:notification/features/auth/domain/repositories/auth_repository.dart';
import 'package:notification/features/auth/infractructure/datasources/auth_datasource_impl.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({AuthDataSource? dataSource})
      : dataSource = dataSource ?? AuthDataSourceImpl();

  @override
  Future<UsuarioA> login(int nrCi, String password) {
    return dataSource.login(nrCi, password);
  }
}
