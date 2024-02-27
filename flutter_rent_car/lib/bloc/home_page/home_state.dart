part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class DoHomeLoading extends HomeState {}

final class DoHomeSuccess extends HomeState {
  final UserDetailsDto userDetails;
  DoHomeSuccess(this.userDetails);
}

final class DoHomeError extends HomeState {
  final String errorMessage;
  DoHomeError(this.errorMessage);
}
