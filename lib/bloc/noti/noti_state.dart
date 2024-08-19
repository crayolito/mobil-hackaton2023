part of 'noti_bloc.dart';

class NotiState extends Equatable {
  final String idPublicacion;
  final String mensaje;

  // Lista de comentarios de la sala
  final List<Comentario> mensajes;

  final List<Notificacion> notificaciones;

  const NotiState({
    this.idPublicacion = '',
    this.mensaje = '',
    this.mensajes = const [],
    this.notificaciones = const [],
  });

  NotiState copyWith({
    String? idPublicacion,
    String? mensaje,
    List<Comentario>? mensajes,
    List<Notificacion>? notificaciones,
  }) {
    return NotiState(
      idPublicacion: idPublicacion ?? this.idPublicacion,
      mensajes: mensajes ?? this.mensajes,
      mensaje: mensaje ?? this.mensaje,
      notificaciones: notificaciones ?? this.notificaciones,
    );
  }

  @override
  List<Object> get props => [idPublicacion, mensajes, mensaje, notificaciones];
}
