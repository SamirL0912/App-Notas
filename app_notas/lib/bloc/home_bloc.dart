import 'package:app_notas/models/model_user.dart';
import 'package:app_notas/services/autenticacion.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthService _authService = AuthService();

  HomeBloc() : super(HomeInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      final user = await _authService.login(event.username, event.password);
      emit(HomeSuccess(user!));
    } catch (e) {
      emit(HomeFailure('Error: ${e.toString()}'));
    }
  }
}
