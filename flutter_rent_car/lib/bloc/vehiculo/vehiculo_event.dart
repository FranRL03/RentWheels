part of 'vehiculo_bloc.dart';

@immutable
sealed class VehiculoEvent {}

class GetVehiculoEvent extends VehiculoEvent {
  final int number;
  final int pageSize;
  final bool empty;
  final bool last;
  GetVehiculoEvent(this.number, this.pageSize, this.empty, this.last);
}

class GetVehiculosModelosEvent extends VehiculoEvent {
  final String nombreModelo;
  GetVehiculosModelosEvent(this.nombreModelo);
}

class GetVehiculoDetailsEvent extends VehiculoEvent {
  final String uuid;
  GetVehiculoDetailsEvent(this.uuid);
}
