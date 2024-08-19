part of 'usuarios_bloc.dart';

enum statusSearch { complete, searching, none }

class UsuariosState extends Equatable {
  final List<UsuarioA> usuarios;
  final int selectos;
  final statusSearch status;

  const UsuariosState(
      {this.usuarios = const [],
      this.status = statusSearch.none,
      this.selectos = 0});

  UsuariosState copyWith(
      {List<UsuarioA>? usuarios, statusSearch? status, int? selectos}) {
    return UsuariosState(
        usuarios: usuarios ?? this.usuarios,
        status: status ?? this.status,
        selectos: selectos ?? this.selectos);
  }

  @override
  List<Object> get props => [usuarios, status, selectos];
}
