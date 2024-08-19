import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';
import 'package:notification/bloc/socket/socket_bloc.dart';
import 'package:notification/features/notificacion/domain/entities/notificacion.dart';
import 'package:notification/features/publicacion/infractructure/infrastructure.dart';
import 'package:notification/features/notificacion/infractructure/repositories/notificacion_repository_impl.dart';
import 'package:notification/helpers/add-remove-destinoPublicacion.dart';

part 'publicacion_form_event.dart';
part 'publicacion_form_state.dart';

class PublicacionBloc extends Bloc<PublicacionEvent, PublicacionState> {
  final AuthBloc authBloc;
  final SocketBloc socketBloc;
  final publicacionRepositoryImpl = PublicacionRepositoryImpl();
  final notificacionRepositoryImpl = NotificacionRepositoryImpl();

  PublicacionBloc({
    required this.authBloc,
    required this.socketBloc,
  }) : super(PublicacionState()) {
    // VALIDADORES DE ESPACIOS DEL FORM DE PUBLICACION
    on<OnTituloChanged>(_onTituloChanged);
    on<OnDescripcionChanged>(_onDescripcionChanged);
    on<OnZonaUbicacionChanged>(_onZonaUbicacionChanged);
    on<OnImageChanged>(_onImageChanged);

    // ENVIAR PUBLICACION
    on<OnNewPublicacion>(_onNewPublicacion);

    // LIMPIAR FORMULARIO DE PUBLICACION
    on<OnClearPublicacion>(_onClearPublicacion);

    // QUE TIPO DE ES (PUBLICACION O COMENTARIO)
    on<OnChagendeType>((event, emit) {
      emit(state.copyWith(type: event.type));
    });

    // PARA QUIENES VA DIRIGIDO LA PUBLICACION
    on<OnAddParaQuines>(_onAddParaQuines);
    on<OnRemoveParaQuines>(_onRemoveParaQuienes);

    // on<OnGetNoticacionesP>(_onGetNotificaciones);

    on<OnChangedStatus>((event, emit) {
      emit(state.copyWith(estado: event.status));
    });
  }

  Future<void> _onNewPublicacion(
      OnNewPublicacion event, Emitter<PublicacionState> emit) async {
    try {
      final idPersonaAuth = authBloc.state.usuarioA!.id;
      add(OnAddParaQuines(idPersonaAuth));
      await publicacionRepositoryImpl.updatePublicacion(
          idPersonaAuth,
          state.title,
          '${state.descripcion} - ${state.zonaUbicacion}',
          state.imagen,
          authBloc.state.usuarioA!.longitude,
          authBloc.state.usuarioA!.latitude,
          state.paraQuienes);
      add(OnChangedStatus(Status.complete));
      socketBloc.emitSocket('updateNotificacion',
          'Este es un comunicado que se actualizara la lista de notificaciones');
      print('Llego aqui deberia actualizar');
    } catch (e) {
      CustomError(message: e.toString());
    }
  }

  Future<void> _onGetNotificaciones(
      OnGetNoticacionesP event, Emitter<PublicacionState> emit) async {
    try {
      final idPersona = authBloc.state.usuarioA!.id;
      final notificaciones =
          await notificacionRepositoryImpl.getNotificaciones(idPersona);
      emit(state.copyWith(notificaciones: notificaciones));
    } catch (e) {
      CustomError(message: e.toString());
    }
  }

  void _onImageChanged(OnImageChanged event, Emitter<PublicacionState> emit) {
    emit(state.copyWith(imagen: event.image, estado: Status.processing));
  }

  void _onTituloChanged(OnTituloChanged event, Emitter<PublicacionState> emit) {
    emit(state.copyWith(titulo: event.titulo));
  }

  void _onDescripcionChanged(
      OnDescripcionChanged event, Emitter<PublicacionState> emit) {
    emit(state.copyWith(descripcion: event.descripcion));
  }

  void _onZonaUbicacionChanged(
      OnZonaUbicacionChanged event, Emitter<PublicacionState> emit) {
    emit(state.copyWith(zonaUbicacion: event.zonaUbicacion));
  }

  void _onAddParaQuines(OnAddParaQuines event, Emitter<PublicacionState> emit) {
    // List<int> paraQuienes =  ChagendDestinoPublicacion()
    // .addDestinoPublicacion(event.idPersonaDestino, state.paraQuienes);
    print('object');
    emit(state
        .copyWith(paraQuienes: [...state.paraQuienes, event.idPersonaDestino]));
  }

  void _onRemoveParaQuienes(
      OnRemoveParaQuines event, Emitter<PublicacionState> emit) async {
    List<int> paraQuienes = await ChagendDestinoPublicacion()
        .removeDestinoPublicacion(event.idPersonaDestino, state.paraQuienes);
    emit(state.copyWith(paraQuienes: paraQuienes));
  }

  void _onClearPublicacion(
      OnClearPublicacion event, Emitter<PublicacionState> emit) {
    emit(state.copyWith(
        titulo: 'Incendio',
        descripcion: '',
        imagen: '',
        zonaUbicacion: '',
        paraQuienes: [],
        estado: Status.none,
        type: Type.none));
  }
}
