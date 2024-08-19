part of 'usuarios_bloc.dart';

sealed class UsuariosEvent extends Equatable {
  const UsuariosEvent();

  @override
  List<Object> get props => [];
}

class OnGetUsuarios extends UsuariosEvent {
  final int id;
  const OnGetUsuarios(this.id);
}

class OnChangedStatus extends UsuariosEvent {
  final statusSearch status;
  const OnChangedStatus(this.status);
}

class OnChangedSelectos extends UsuariosEvent {
  final int selectos;
  const OnChangedSelectos(this.selectos);
}
