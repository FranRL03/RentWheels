part of 'vehiculo_bloc.dart';

@immutable
sealed class VehiculoState {}

final class VehiculoInitial extends VehiculoState {}

final class GetVehiculoLoading extends VehiculoState {}

final class GetVehiculoSuccess extends VehiculoState {
  final ListVehiculosResponse vehiculosResponse;
  GetVehiculoSuccess(this.vehiculosResponse);
}

final class GetVehiculoError extends VehiculoState {
  final String errorMessage;
  GetVehiculoError(this.errorMessage);
}
