part of 'socket_bloc.dart';

enum ServerStatus { Online, Offline, Connecting }

class SocketState extends Equatable {
  final ServerStatus serverStatus;

  const SocketState({
    this.serverStatus = ServerStatus.Connecting,
  });

  SocketState copyWith({
    ServerStatus? serverStatus,
  }) =>
      SocketState(
        serverStatus: serverStatus ?? this.serverStatus,
      );



  @override
  List<Object> get props => [serverStatus];
}
