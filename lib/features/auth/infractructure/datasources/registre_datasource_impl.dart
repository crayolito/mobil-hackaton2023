import 'package:dio/dio.dart';
import 'package:notification/constants/environment.dart';
import 'package:notification/features/auth/domain/datasources/registre_datasource.dart';
import 'package:notification/features/auth/domain/entities/usuarioA.dart';

class RegistreDataSourceImpl extends RegistreDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiURL,
  ));

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
    try {
      final fileName = photo_url.split('/').last;
      final FormData data = FormData.fromMap({
        'archivo': MultipartFile.fromFileSync(photo_url, filename: fileName),
      });
      final responseImagen =
          await dio.post('/publications/uploadImage', data: data);
      String urlR = urlResponse.fromJson(responseImagen.data).url;
      final response = await dio.post('/auth/register', data: {
        "name": name,
        "ci": ci,
        "phone_number": phone_number,
        "photo_url": urlR,
        "password": password,
        "latitude": latitude,
        "longitude": longitude,
        "idrol": 2,
        "idToken": idToken
      });
      // print(response.data);
      final usuarioAuth = UsuarioA.fromJson(response.data);
      return usuarioAuth;
    } catch (e) {
      throw Exception();
    }
  }
}

class urlResponse {
  String url;

  urlResponse({
    required this.url,
  });

  factory urlResponse.fromJson(Map<String, dynamic> json) => urlResponse(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
