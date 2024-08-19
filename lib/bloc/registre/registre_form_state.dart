part of 'registre_form_bloc.dart';

enum Status { none, proccesing, success }

class RegistreFormState extends Equatable {
  final String nombre;
  final int ci;
  final int telefono;
  final String password;
  final double latitud;
  final double longitud;
  final String image;
  final Status estado;

  const RegistreFormState({
    this.estado = Status.none,
    this.nombre = '',
    this.ci = 0,
    this.password = '',
    this.telefono = 0,
    this.latitud = 0,
    this.longitud = 0,
    this.image = '',
  });

  RegistreFormState copyWith({
    String? nombre,
    int? ci,
    int? telefono,
    String? password,
    double? latitud,
    double? longitud,
    String? image,
    Status? estado,
  }) {
    return RegistreFormState(
      nombre: nombre ?? this.nombre,
      ci: ci ?? this.ci,
      telefono: telefono ?? this.telefono,
      latitud: latitud ?? this.latitud,
      longitud: longitud ?? this.longitud,
      image: image ?? this.image,
      password: password ?? this.password,
      estado: estado ?? this.estado,
    );
  }

  @override
  List<Object> get props => [
        nombre,
        ci,
        telefono,
        password,
        latitud,
        longitud,
        image,
        estado,
      ];
}
