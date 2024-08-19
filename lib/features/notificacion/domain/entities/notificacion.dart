class Notificacion {
  int id;
  String? title;
  String? description;
  String notified;
  DateTime createdAt;
  int idUser;
  int idPublication;

  Notificacion({
    required this.id,
    required this.title,
    required this.description,
    required this.notified,
    required this.createdAt,
    required this.idUser,
    required this.idPublication,
  });
}
