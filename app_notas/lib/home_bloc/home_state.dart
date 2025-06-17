abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadInProgress extends HomeState {}

class HomeLoadSuccess extends HomeState {}

class HomeLoadFailure extends HomeState {
  final String message;

  HomeLoadFailure(this.message);
}
