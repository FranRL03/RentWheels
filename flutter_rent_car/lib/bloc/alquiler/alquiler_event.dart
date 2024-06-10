part of 'alquiler_bloc.dart';

@immutable
sealed class AlquilerEvent {}

// ignore: must_be_immutable
class GetAlquilerClienteEvent extends AlquilerEvent {
  bool statusAlquiler;
  GetAlquilerClienteEvent(this.statusAlquiler);
}

class DoAlquilerEvent extends AlquilerEvent {
  final String fechaInicio;
  final String fechaFin;
  final String origen;
  final String destino;
  final String uuid;
  DoAlquilerEvent(
      this.fechaInicio, this.fechaFin, this.origen, this.destino, this.uuid);
}
