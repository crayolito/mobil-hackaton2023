import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notification/bloc/location/location_bloc.dart';
import 'package:notification/bloc/notificacions/notificacions_bloc.dart';
import 'package:notification/features/auth/infractructure/repositories/registre_repository_impl.dart';

part 'registre_form_event.dart';
part 'registre_form_state.dart';

class RegistreFormBloc extends Bloc<RegistreFormEvent, RegistreFormState> {
  LocationBloc locationBloc;
  NotificacionsBloc notificacionsBloc;

  final registreRepositoryImpl = RegistreRepositoryImpl();

  RegistreFormBloc(
      {required this.locationBloc, required this.notificacionsBloc})
      : super(const RegistreFormState()) {
    on<OnChangedNombre>((event, emit) {
      emit(state.copyWith(nombre: event.nombre));
    });

    on<OnChangedCI>((event, emit) {
      emit(state.copyWith(ci: event.ci));
    });

    on<OnChagedTelefono>((event, emit) {
      emit(state.copyWith(telefono: event.telefono));
    });

    on<OnChagendPassword>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<OnSubmitForm>((event, emit) async {
      try {
        // final position = await locationBloc.getCurrentLocation();
        // emit(state.copyWith(
        //     latitud: position.latitude, longitud: position.longitude));
        // print(state);
        await registreRepositoryImpl.onRegistreUser(
            state.nombre,
            state.ci,
            state.telefono,
            state.image,
            state.password,
            state.longitud,
            state.latitud,
            notificacionsBloc.state.token);

        // print(state.nombre);
        // print(state.ci);
        // print(state.telefono);
        // print(state.password);
        // print(state.latitud);
        // print(state.longitud);
        // print(state.image);
        // print(notificacionsBloc.state.token);
      } catch (e) {
        print('PASO UN ERROR');
        throw Error();
      }
    });

    on<OnChangedCoordenadas>((event, emit) {
      emit(state.copyWith(latitud: event.latitude, longitud: event.longitud));
    });

    on<OnChangedImage>((event, emit) {
      emit(state.copyWith(image: event.image, estado: Status.proccesing));
    });

    on<OnClearForm>((event, emit) {
      emit(state.copyWith(
          nombre: '',
          ci: 0,
          telefono: 0,
          password: '',
          latitud: 0,
          longitud: 0,
          image: '',
          estado: Status.none));
    });
  }
}
