
import 'package:notification/features/publicacion/domain/domain.dart';

class PublicacionMapper {
  // CONVIERTE EL JSON EN UN OBJETO DE TIPO USUARIO

  Publicacion fromJson(Map<String, dynamic> json) => Publicacion(
        idPublicacion: json["id_publicacion"],
        idPersona: json["id_persona"],
        dePersona: json["de_persona"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
      );

  // CONVIERTE UN OBJETO DE TIPO USUARIO EN UN JSON
  Map<String, dynamic> toJson(Publicacion publicacion) => {
        "id_publicacion": publicacion.idPublicacion,
        "id_persona": publicacion.idPersona,
        "de_persona": publicacion.dePersona,
        "titulo": publicacion.titulo,
        "descripcion": publicacion.descripcion,
        "direccion": publicacion.direccion,
      };
}
