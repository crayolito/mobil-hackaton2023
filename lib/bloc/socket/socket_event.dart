part of 'socket_bloc.dart';

sealed class SocketEvent extends Equatable {
  const SocketEvent();

  @override
  List<Object> get props => [];
}

class OnConnect extends SocketEvent {}

class OnDisconnect extends SocketEvent {}
