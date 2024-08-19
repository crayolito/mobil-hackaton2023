import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';
import 'package:notification/bloc/publicacion/publicacion_form_bloc.dart';
import 'package:notification/bloc/socket/socket_bloc.dart';
import 'package:notification/features/auth/infractructure/errors/auth_errors.dart';
import 'package:notification/features/notificacion/domain/entities/comentario.dart';
import 'package:notification/features/notificacion/domain/entities/notificacion.dart';
import 'package:notification/features/notificacion/infractructure/repositories/notificacion_repository_impl.dart';

part 'noti_event.dart';
part 'noti_state.dart';

class NotiBloc extends Bloc<NotiEvent, NotiState> {
  SocketBloc socketBloc;
  AuthBloc authBloc;
  PublicacionBloc publicacion;
  final notificacionRepositoryImpl = NotificacionRepositoryImpl();
  NotiBloc(
      {required this.socketBloc,
      required this.authBloc,
      required this.publicacion})
      : super(const NotiState()) {
    on<OnChangedMensaje>((event, emit) {
      emit(state.copyWith(mensaje: event.mensaje));
    });

    on<OnChangedIdPublicacion>((event, emit) {
      emit(state.copyWith(idPublicacion: event.idPublicacion));
      print(event.idPublicacion);
      print('ENTRO A UNA SALA');
      socketBloc.emitSocket('entrar-sala', {
        'idPublicacion': state.idPublicacion,
      });
    });

    on<OnGetComentarios>((event, emit) async {
      final comentarios = await notificacionRepositoryImpl
          .onGetComentarios(event.idPublicacion);
      emit(state.copyWith(mensajes: comentarios));
    });

    on<OnSaveComentario>((event, emit) async {
      // final deIdAuth = authBloc.state.usuario!.idPersona;
      publicacion.add(OnChangedStatus(Status.processing));

      final titulo = publicacion.state.title;
      final descripcion = publicacion.state.descripcion;
      final imagen = publicacion.state.imagen;
      final direccion = publicacion.state.zonaUbicacion;

      await notificacionRepositoryImpl.onSaveComentario(
          event.idPublicacion, titulo, descripcion, imagen, direccion);

      publicacion.add(OnChangedStatus(Status.complete));
      publicacion.add(OnClearPublicacion());

      socketBloc.emitSocket('mensaje-sala', {
        'idPublicacion': state.idPublicacion,
        'idUsuario': authBloc.state.usuario!.idPersona
      });
    });

    on<OnGetNoticaciones>(_onGetNoticaciones);
  }

  Future<void> _onGetNoticaciones(
      OnGetNoticaciones event, Emitter<NotiState> emit) async {
    try {
      final idPersona = authBloc.state.usuarioA!.id;
      final notificaciones =
          await notificacionRepositoryImpl.getNotificaciones(idPersona);
      emit(state.copyWith(notificaciones: notificaciones));
    } catch (e) {
      CustomError(message: e.toString());
    }
  }
}
