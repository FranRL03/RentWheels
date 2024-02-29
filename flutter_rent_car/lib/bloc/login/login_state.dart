part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class DoLoginLoading extends LoginState {}

final class DoLoginSuccess extends LoginState {
  final LoginResponse userLogin;
  DoLoginSuccess(this.userLogin);
}

final class DoLoginError extends LoginState {
  final String errorMessage;
  DoLoginError(this.errorMessage);
}

final class DoTokenSuccess extends LoginState {
  final bool valid;
  DoTokenSuccess(this.valid);
}

final class DoTokenError extends LoginState {
  final String errorMessage;
  DoTokenError(this.errorMessage);
}
