// To parse this JSON data, do
//
//     final usuariosResponse = usuariosResponseFromJson(jsonString);

class Usuario {
  String idPersona;
  String nrTelefono;
  String contrasena;
  String ci;
  String nombre;
  String apellido;

  Usuario({
    required this.idPersona,
    required this.nrTelefono,
    required this.contrasena,
    required this.ci,
    required this.nombre,
    required this.apellido,
  });
}
