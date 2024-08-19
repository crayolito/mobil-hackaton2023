
import 'package:notification/features/auth/domain/entities/usuarioA.dart';
import 'package:notification/features/usuarios/domain/domain.dart';
import 'package:notification/features/usuarios/infractructure/datasources/usuarios_datasource_impl.dart';

class UsuariosRepositoryImpl extends UsuariosRepository {
  final UsuariosDataSource dataSource;

  UsuariosRepositoryImpl({UsuariosDataSource? dataSource})
      : dataSource = dataSource ?? UsuariosDataSourceImpl();

  @override
  Future<List<UsuarioA>> getUsuarios() {
    return dataSource.getUsuarios();
  }
}
