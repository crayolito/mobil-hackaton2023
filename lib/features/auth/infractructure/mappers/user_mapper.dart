import 'package:notification/features/auth/domain/entities/usuario.dart';

class UserMapper {
  Usuario fromJson(Map<String, dynamic> json) => Usuario(
        idPersona: json["id"],
        nrTelefono: json["nr_telefono"],
        contrasena: json["contrasena"],
        ci: json["ci"],
        nombre: json["nombre"],
        apellido: json["apellido"],
      );

  Map<String, dynamic> toJson(Usuario usuario) => {
        "id": usuario.idPersona,
        "nr_telefono": usuario.nrTelefono,
        "contrasena": usuario.contrasena,
        "ci": usuario.ci,
        "nombre": usuario.nombre,
        "apellido": usuario.apellido,
      };
}
