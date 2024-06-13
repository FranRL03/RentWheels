part of 'edit_user_bloc.dart';

@immutable
sealed class EditUserState {}

final class EditUserInitial extends EditUserState {}

final class DoEditUserLoading extends EditUserState {}

final class DoEditUserSuccess extends EditUserState {
  final UserDetails userDetails;
  DoEditUserSuccess(this.userDetails);
}

final class DoEditUserError extends EditUserState {
  final String errorMessage;
  DoEditUserError(this.errorMessage);
}

final class IngresarInitial extends EditUserState {}

final class DoIngresarLoading extends EditUserState {}

final class DoIngresarSuccess extends EditUserState {
  final UserDetails userDetails;
  DoIngresarSuccess(this.userDetails);
}

final class DoIngresarError extends EditUserState {
  final String errorMessage;
  DoIngresarError(this.errorMessage);
}
