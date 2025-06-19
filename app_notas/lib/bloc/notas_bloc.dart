import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/model_nota.dart';

part 'notas_event.dart';
part 'notas_state.dart';

class NotasBloc extends Bloc<NotasEvent, NotasState> {
  NotasBloc() : super(NotasInitial()) {
    on<AgregarNota>(_onAgregarNota);
  }

  void _onAgregarNota(AgregarNota event, Emitter<NotasState> emit) {
    final currentState = state;
    if (currentState is NotasCargadas) {
      final notasActualizadas = List<Nota>.from(currentState.notas)
        ..add(event.nota);
      emit(NotasCargadas(notas: notasActualizadas));
    } else {
      emit(NotasCargadas(notas: [event.nota]));
    }
  }
}
