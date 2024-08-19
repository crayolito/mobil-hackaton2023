import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sala_comentario_event.dart';
part 'sala_comentario_state.dart';

class ComentarioBloc extends Bloc<ComentarioEvent, ComentarioState> {
  ComentarioBloc() : super(ComentarioInitial()) {
    on<ComentarioEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
