part of 'alquiler_bloc.dart';

@immutable
sealed class AlquilerEvent {}

class GetAlquilerClienteEvent extends AlquilerEvent {
  GetAlquilerClienteEvent();
}
