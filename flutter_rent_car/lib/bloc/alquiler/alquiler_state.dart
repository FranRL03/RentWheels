part of 'alquiler_bloc.dart';

@immutable
sealed class AlquilerState {}

final class AlquilerClienteInitial extends AlquilerState {}

final class GetAlquilerClienteLoading extends AlquilerState {}

final class GetAlquilerClienteSuccess extends AlquilerState {
  final AlquilerClientesResponse alquilerClientesResponse;
  GetAlquilerClienteSuccess(this.alquilerClientesResponse);
}

final class GetAlquilerClienteError extends AlquilerState {
  final String errorMessage;
  GetAlquilerClienteError(this.errorMessage);
}

final class AlquilerInitial extends AlquilerState {}

final class DoAlquilerLoading extends AlquilerState {}

final class DoAlquilerSuccess extends AlquilerState {
  final AlquilerResponse alquilerResponse;
  DoAlquilerSuccess(this.alquilerResponse);
}
