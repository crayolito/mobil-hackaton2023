import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';
import 'package:notification/bloc/location/location_bloc.dart';
import 'package:notification/bloc/publicacion/publicacion_form_bloc.dart';
import 'package:notification/features/auth/domain/entities/usuarioA.dart';
import 'package:notification/features/usuarios/infractructure/infrastructure.dart';
import 'package:notification/helpers/difencia-distancia.dart';

part 'usuarios_event.dart';
part 'usuarios_state.dart';

class UsuariosBloc extends Bloc<UsuariosEvent, UsuariosState> {
  final AuthBloc authBloc;
  final LocationBloc locationBloc;
  final PublicacionBloc publicacionBloc;
  final usuariosRepository = UsuariosRepositoryImpl();
  UsuariosBloc(
      {required this.authBloc,
      required this.locationBloc,
      required this.publicacionBloc})
      : super(const UsuariosState()) {
    on<OnChangedStatus>((event, emit) {
      emit(state.copyWith(status: event.status));
    });
    on<OnGetUsuarios>((event, emit) async {
      add(OnChangedStatus(statusSearch.searching));
      publicacionBloc.add(OnAddParaQuines(authBloc.state.usuarioA!.id));
      final usuarios = await usuariosRepository.getUsuarios();
      final listaExclusion = usuarios
          .where((usuario) => usuario.id != authBloc.state.usuarioA!.id)
          .toList();

      int i = 0;
      List<int> aux = [];
      final Position position = await locationBloc.getActualLocation();
      final startLatitude = position.latitude;
      final startLongitude = position.longitude;

      for (final usuario in listaExclusion) {
        final endLatitude = usuario.latitude;
        final endLongitude = usuario.longitude;
        final distancia = DifenciaDistancia().calcularDistancia(
            startLongitude, startLatitude, endLongitude, endLatitude);
        if (distancia <= 2) {
          aux.add(usuario.id);
          i++;
        }
      }
      for (var i = 0; i < aux.length - 1; i++) {
        //   print('hola');
        publicacionBloc.state.paraQuienes = [
          ...publicacionBloc.state.paraQuienes,
          aux[i]
        ];
      }
      print(publicacionBloc.state.paraQuienes);
      emit(state.copyWith(selectos: i));

      emit(state.copyWith(usuarios: usuarios));
      add(OnChangedStatus(statusSearch.complete));
    });
  }
}
