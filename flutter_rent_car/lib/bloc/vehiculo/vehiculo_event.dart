part of 'vehiculo_bloc.dart';

@immutable
sealed class VehiculoEvent {}

class GetVehiculoEvent extends VehiculoEvent {
  GetVehiculoEvent();
}
