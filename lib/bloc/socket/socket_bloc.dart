import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notification/bloc/auth/auth_bloc.dart';
import 'package:notification/constants/environment.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'socket_event.dart';
part 'socket_state.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  final AuthBloc authBloc;
  IO.Socket? _socket;

  SocketBloc({required this.authBloc}) : super(const SocketState()) {
    on<SocketEvent>((event, emit) {});
    on<OnConnect>((event, emit) {
      emit(state.copyWith(serverStatus: ServerStatus.Online));
    });
    on<OnDisconnect>((event, emit) {
      emit(state.copyWith(serverStatus: ServerStatus.Offline));
    });
  }

  void iniConfig() async {
    _socket?.disconnect();

    _socket = IO.io(
      Environment.urlSocket,
      IO.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .enableAutoConnect()
          .build(),
    );

    _socket!.on('connect',
        (data) => {print('Hola DESDE LABORATORIO'), add(OnConnect())});

    _socket!.on(
        'disconnect', (data) => {print('DESCONECTADO'), add(OnDisconnect())});
  }

  Function get emitSocket => _socket!.emit;
  IO.Socket? get socket => _socket;

  void disconnect() {
    _socket!.disconnect();
  }
}
