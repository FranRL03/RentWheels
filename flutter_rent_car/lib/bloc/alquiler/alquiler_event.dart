part of 'alquiler_bloc.dart';

@immutable
sealed class AlquilerEvent {}

class GetAlquilerClienteEvent extends AlquilerEvent {
  GetAlquilerClienteEvent();
}

class DoAlquilerEvent extends AlquilerEvent {
  final String kilometrosPorAno;
  final String fechaInicio;
  final String fechaFin;
  final String precio;
  final String uuid;
  DoAlquilerEvent(this.kilometrosPorAno, this.fechaInicio, this.fechaFin,
      this.precio, this.uuid);
}
