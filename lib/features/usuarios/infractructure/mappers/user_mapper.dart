import 'package:notification/features/auth/domain/entities/usuario.dart';

class UserMapper {
  // CONVIERTE EL JSON EN UN OBJETO DE TIPO USUARIO
  Usuario fromJson(Map<String, dynamic> json) => Usuario(
        idPersona: json["id_persona"],
        nrTelefono: json["nr_telefono"],
        contrasena: json["contrasena"],
        ci: json["ci"],
        nombre: json["nombre"],
        apellido: json["apellido"],
      );

  // CONVIERTE UN OBJETO DE TIPO USUARIO EN UN JSON
  Map<String, dynamic> toJson(Usuario usuario) => {
        "id_persona": usuario.idPersona,
        "nr_telefono": usuario.nrTelefono,
        "contrasena": usuario.contrasena,
        "ci": usuario.ci,
        "nombre": usuario.nombre,
        "apellido": usuario.apellido,
      };
}
