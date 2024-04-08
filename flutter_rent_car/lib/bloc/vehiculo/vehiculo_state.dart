part of 'vehiculo_bloc.dart';

@immutable
sealed class VehiculoState {}

final class VehiculoInitial extends VehiculoState {}

final class GetVehiculoLoading extends VehiculoState {}

final class GetVehiculoSuccess extends VehiculoState {
  final List<ListVehiculosResponseV2> vehiculosResponse;
  GetVehiculoSuccess(this.vehiculosResponse);
}

final class GetVehiculoError extends VehiculoState {
  final String errorMessage;
  GetVehiculoError(this.errorMessage);
}

final class GetModelosVehiculosLoading extends VehiculoState {}

final class GetModelosVehiculosSuccess extends VehiculoState {
  final List<ListVehiculosResponseV2> vehiculosModelsResponse;
  GetModelosVehiculosSuccess(this.vehiculosModelsResponse);
}

final class GetModelosVehiculosError extends VehiculoState {
  final String errorMessage;
  GetModelosVehiculosError(this.errorMessage);
}

final class GetVehiculoDetailsLoading extends VehiculoState {}

final class GetVehiculoDetailsSuccess extends VehiculoState {
  final VehiculoDetailsResponse vehiculoDetailsResponse;
  GetVehiculoDetailsSuccess(this.vehiculoDetailsResponse);
}
