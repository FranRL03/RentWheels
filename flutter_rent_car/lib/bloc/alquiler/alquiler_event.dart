part of 'alquiler_bloc.dart';

@immutable
sealed class AlquilerEvent {}

// ignore: must_be_immutable
class GetAlquilerClienteEvent extends AlquilerEvent {
  bool statusAlquiler;
  GetAlquilerClienteEvent(this.statusAlquiler);
}

class DoAlquilerEvent extends AlquilerEvent {
  final int kilometrosAnos;
  final String fechaInicio;
  final String fechaFin;
  // final double precio;
  final String uuid;
  DoAlquilerEvent(this.kilometrosAnos, this.fechaInicio, this.fechaFin
  // ,this.precio
  , this.uuid);
}
