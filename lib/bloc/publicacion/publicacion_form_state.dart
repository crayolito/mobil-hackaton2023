part of 'publicacion_form_bloc.dart';

enum Status { none, processing, complete }

enum Type { none, publicacion, comentario }

class PublicacionState extends Equatable {
  final String title;
  final String descripcion;
  final String imagen;
  final String zonaUbicacion;

  // ESTADO DE LA PUBLICACION
  final Status estado;

  // Para quienes va dirigido la publicacion
  List<int> paraQuienes;
  final Type type;

  final List<Notificacion> notificaciones;

  PublicacionState(
      {this.type = Type.publicacion,
      this.title = 'Incendio',
      this.descripcion = '',
      this.imagen = '',
      this.zonaUbicacion = '',
      this.estado = Status.none,
      this.paraQuienes = const [],
      this.notificaciones = const []});

  PublicacionState copyWith(
      {String? titulo,
      String? descripcion,
      String? imagen,
      String? zonaUbicacion,
      Status? estado,
      List<int>? paraQuienes,
      List<Notificacion>? notificaciones,
      Type? type}) {
    return PublicacionState(
        title: titulo ?? this.title,
        descripcion: descripcion ?? this.descripcion,
        imagen: imagen ?? this.imagen,
        zonaUbicacion: zonaUbicacion ?? this.zonaUbicacion,
        estado: estado ?? this.estado,
        paraQuienes: paraQuienes ?? this.paraQuienes,
        notificaciones: notificaciones ?? this.notificaciones,
        type: type ?? this.type);
  }

  @override
  List<Object?> get props => [
        title,
        descripcion,
        imagen,
        zonaUbicacion,
        estado,
        paraQuienes,
        notificaciones,
        type
      ];
}
