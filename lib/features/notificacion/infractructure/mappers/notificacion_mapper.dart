import 'package:notification/features/notificacion/domain/entities/notificacion.dart';

class NotificacionMapper {
  Notificacion fromJson(Map<String, dynamic> json) => Notificacion(
        id: json["id"],
        title: json["title"] ?? 'Robo',
        description: json["description"] ?? '',
        notified: json["notified"] ?? 'true',
        createdAt: DateTime.parse(json["createdAt"]),
        idUser: json["idUser"],
        idPublication: json["idPublication"],
      );
}
