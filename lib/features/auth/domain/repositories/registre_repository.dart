import 'package:notification/features/auth/domain/entities/usuarioA.dart';

abstract class RegistreRepository {
  Future<UsuarioA> onRegistreUser(
      String name,
      int ci,
      int phone_number,
      String photo_url,
      String password,
      double longitude,
      double latitude,
      String idToken);
}
