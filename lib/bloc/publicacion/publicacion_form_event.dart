part of 'publicacion_form_bloc.dart';

class PublicacionEvent extends Equatable {
  const PublicacionEvent();

  @override
  List<Object> get props => [];
}

class OnImageChanged extends PublicacionEvent {
  final String image;
  OnImageChanged(this.image);
}

class OnTituloChanged extends PublicacionEvent {
  final String titulo;
  OnTituloChanged(this.titulo);
}

class OnDescripcionChanged extends PublicacionEvent {
  final String descripcion;
  OnDescripcionChanged(this.descripcion);
}

class OnZonaUbicacionChanged extends PublicacionEvent {
  final String zonaUbicacion;
  OnZonaUbicacionChanged(this.zonaUbicacion);
}

class OnNewPublicacion extends PublicacionEvent {
  OnNewPublicacion();
}

class OnAddParaQuines extends PublicacionEvent {
  final int idPersonaDestino;
  OnAddParaQuines(this.idPersonaDestino);
}

class OnRemoveParaQuines extends PublicacionEvent {
  final int idPersonaDestino;
  OnRemoveParaQuines(this.idPersonaDestino);
}

class OnClearPublicacion extends PublicacionEvent {
  OnClearPublicacion();
}

class OnGetNoticacionesP extends PublicacionEvent {
  OnGetNoticacionesP();
}

class OnChagendeType extends PublicacionEvent {
  final Type type;
  OnChagendeType(this.type);
}

class OnChangedStatus extends PublicacionEvent {
  final Status status;
  OnChangedStatus(this.status);
}