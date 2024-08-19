class Comentario {
  String id;
  String idPublicacion;
  String titulo;
  String descripcion;
  String imagen;
  String direccion;
  DateTime fechaHora;

  Comentario({
    required this.id,
    required this.idPublicacion,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
    required this.direccion,
    required this.fechaHora,
  });
}
