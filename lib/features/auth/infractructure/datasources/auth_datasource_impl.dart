import 'package:dio/dio.dart';
import 'package:notification/constants/environment.dart';
import 'package:notification/features/auth/domain/datasources/auth_datasource.dart';
import 'package:notification/features/auth/domain/entities/usuarioA.dart';
import 'package:notification/features/auth/infractructure/errors/auth_errors.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiURL,
  ));

  @override
  Future<UsuarioA> login(int nrCi, String password) async {
    try {
      final response = await dio
          .post('/auth/login', data: {'ci': nrCi, 'password': password});
      print(response);
      final usuario = UsuarioA.fromJson(response.data);
      return usuario;
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      print(e.message);
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
