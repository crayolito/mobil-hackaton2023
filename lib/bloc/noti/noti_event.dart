part of 'noti_bloc.dart';

class NotiEvent extends Equatable {
  const NotiEvent();

  @override
  List<Object> get props => [];
}

class OnChangedIdPublicacion extends NotiEvent {
  final String idPublicacion;
  const OnChangedIdPublicacion(this.idPublicacion);
}

class OnChangedMensaje extends NotiEvent {
  final String mensaje;
  const OnChangedMensaje(this.mensaje);
}

class OnGetComentarios extends NotiEvent {
  final String idPublicacion;
  const OnGetComentarios(this.idPublicacion);
}

class OnSaveComentario extends NotiEvent {
  final String idPublicacion;
  const OnSaveComentario(this.idPublicacion);
}

class OnGetNoticaciones extends NotiEvent {
  OnGetNoticaciones();
}
