part of 'vehiculo_bloc.dart';

@immutable
sealed class VehiculoEvent {}

class GetVehiculoEvent extends VehiculoEvent {
  GetVehiculoEvent();
}

class GetVehiculosModelosEvent extends VehiculoEvent {
  final String nombreModelo;
  GetVehiculosModelosEvent(this.nombreModelo);
}

class GetVehiculoDetailsEvent extends VehiculoEvent {
  final String uuid;
  GetVehiculoDetailsEvent(this.uuid);
}
