import 'package:dio/dio.dart';
import 'package:notification/constants/environment.dart';
import 'package:notification/features/auth/domain/entities/usuarioA.dart';
import 'package:notification/features/auth/infractructure/errors/auth_errors.dart';
import 'package:notification/features/usuarios/domain/datasources/usuarios_datasource.dart';
import 'package:notification/features/usuarios/domain/entities/usuariosA.dart';

class UsuariosDataSourceImpl extends UsuariosDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiURL,
  ));

  @override
  Future<List<UsuarioA>> getUsuarios() async {
    try {
      final response = await dio.get('/users');
      final usuariosReponse = UsuariosAMapper().jsonConvertList(response.data);
      return usuariosReponse;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
            message: e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      // ignore: deprecated_member_use
      if (e.type == DioErrorType.connectionTimeout) {
        throw CustomError(message: 'Revisar conexion a Internet');
      }
      throw Exception();
    } catch (e) {
      throw CustomError(message: 'Sometring wrong happend');
    }
  }
}
