import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      final response = await http.get(
        Uri.parse(
          'https://run.mocky.io/v3/586957c5-3fb3-4718-a565-90d6cab95ad9',
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> users = json.decode(response.body);

        final user = users.firstWhere(
          (u) =>
              u['username'] == event.username &&
              u['password'] == event.password,
          orElse: () => null,
        );

        if (user != null) {
          emit(HomeSuccess(event.username));
        } else {
          emit(const HomeFailure('Credenciales incorrectas.'));
        }
      } else {
        emit(const HomeFailure('Error al obtener los datos.'));
      }
    } catch (e) {
      emit(HomeFailure('Error: ${e.toString()}'));
    }
  }
}
