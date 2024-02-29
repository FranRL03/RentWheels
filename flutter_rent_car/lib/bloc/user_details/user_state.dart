part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class DoUserLoading extends UserState {}

final class DoUserSuccess extends UserState {
  final UserDetails userDetails;
  DoUserSuccess(this.userDetails);
}

final class DoUserError extends UserState {
  final String errorMessage;
  DoUserError(this.errorMessage);
}
