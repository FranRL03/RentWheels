part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class DoHomeEvent extends HomeEvent{
  String username;
  DoHomeEvent(this.username);
}
