part of 'registre_form_bloc.dart';

class RegistreFormEvent extends Equatable {
  const RegistreFormEvent();

  @override
  List<Object> get props => [];
}

class OnChangedNombre extends RegistreFormEvent {
  final String nombre;
  OnChangedNombre(this.nombre);
}

class OnChangedCI extends RegistreFormEvent {
  final int ci;
  OnChangedCI(this.ci);
}

class OnChagedTelefono extends RegistreFormEvent {
  final int telefono;
  OnChagedTelefono(this.telefono);
}

class OnChagendPassword extends RegistreFormEvent {
  final String password;
  OnChagendPassword(this.password);
}

class OnChangedCoordenadas extends RegistreFormEvent {
  final double latitude;
  final double longitud;
  OnChangedCoordenadas(this.latitude, this.longitud);
}

class OnChangedImage extends RegistreFormEvent {
  final String image;
  OnChangedImage(this.image);
}

class OnChangedEstado extends RegistreFormEvent {
  final Status estado;
  OnChangedEstado(this.estado);
}

class OnSubmitForm extends RegistreFormEvent {}

class OnClearForm extends RegistreFormEvent {}
