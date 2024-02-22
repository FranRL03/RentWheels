part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class DoRegisterEvent extends RegisterEvent {
  final String username;
  final String nombre;
  final String email;
  final String password;
  final String verifyPassword;
  DoRegisterEvent(this.username, this.nombre, this.email, this.password,
      this.verifyPassword);
}
