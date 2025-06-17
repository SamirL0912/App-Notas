import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeSearchPressed>((event, emit) async {
      emit(HomeLoadInProgress());

      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        emit(HomeLoadSuccess());
      } else {
        emit(HomeLoadFailure('Error al cargar los datos'));
      }
    });
  }
}
