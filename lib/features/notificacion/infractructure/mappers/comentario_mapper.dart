import 'package:notification/features/notificacion/domain/entities/comentario.dart';

class ComentarioMapper {
  Comentario fromJson(Map<String, dynamic> json) => Comentario(
        id: json["id"],
        idPublicacion: json["id_publicacion"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        direccion: json["direccion"],
        fechaHora: DateTime.parse(json["fecha_hora"]),
      );

  Map<String, dynamic> toJson(Comentario comentario) => {
        "id": comentario.id,
        "id_publicacion": comentario.idPublicacion,
        "titulo": comentario.titulo,
        "descripcion": comentario.descripcion,
        "imagen": comentario.imagen,
        "direccion": comentario.direccion,
        "fecha_hora": comentario.fechaHora.toIso8601String(),
      };
}
