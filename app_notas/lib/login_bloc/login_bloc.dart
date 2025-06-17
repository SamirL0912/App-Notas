import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 2));

      if (event.username == 'admin' && event.password == '123456') {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Usuario o contraseña incorrectos'));
      }
    });
  }
}
