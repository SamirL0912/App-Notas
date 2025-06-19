part of 'notas_bloc.dart';

abstract class NotasState extends Equatable {
  const NotasState();

  @override
  List<Object?> get props => [];
}

class NotasInitial extends NotasState {}

class NotasCargadas extends NotasState {
  final List<Nota> notas;

  const NotasCargadas({required this.notas});

  @override
  List<Object?> get props => [notas];
}
