part of 'edit_user_bloc.dart';

@immutable
sealed class EditUserEvent {}

class DoEditUserEvent extends EditUserEvent {
  final String avatar;
  final String email;
  final String telefono;
  final String pin;
  DoEditUserEvent(this.avatar, this.email, this.telefono, this.pin);
}
