part of 'alquiler_bloc.dart';

@immutable
sealed class AlquilerEvent {}

class GetAlquilerClienteEvent extends AlquilerEvent {
  bool statusAlquiler;
  GetAlquilerClienteEvent(this.statusAlquiler);
}

class DoAlquilerEvent extends AlquilerEvent {
  final int kilometrosPorAno;
  final String fechaInicio;
  final String fechaFin;
  final double precio;
  final String uuid;
  DoAlquilerEvent(this.kilometrosPorAno, this.fechaInicio, this.fechaFin,
      this.precio, this.uuid);
}
