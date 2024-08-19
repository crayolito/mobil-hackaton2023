part of 'sala_comentario_bloc.dart';

sealed class ComentarioState extends Equatable {
  const ComentarioState();
  
  @override
  List<Object> get props => [];
}

final class ComentarioInitial extends ComentarioState {}
