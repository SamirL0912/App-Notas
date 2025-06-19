part of 'notas_bloc.dart';

abstract class NotasEvent extends Equatable {
  const NotasEvent();

  @override
  List<Object?> get props => [];
}

class AgregarNota extends NotasEvent {
  final Nota nota;

  const AgregarNota(this.nota);

  @override
  List<Object?> get props => [nota];
}
