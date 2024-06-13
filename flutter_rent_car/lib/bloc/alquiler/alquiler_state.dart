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

final class DoAlquilerError extends AlquilerState {
  final String errorMessage;
  DoAlquilerError(this.errorMessage);
}


final class PriceAlquilerClienteInitial extends AlquilerState {}

final class GetPriceAlquilerClienteLoading extends AlquilerState {}

final class GetPriceAlquilerClienteSuccess extends AlquilerState {
  final List<ListPriceRentClient> listPriceRentClient;
  GetPriceAlquilerClienteSuccess(this.listPriceRentClient);
}

final class GetPriceAlquilerClienteError extends AlquilerState {
  final String errorMessage;
  GetPriceAlquilerClienteError(this.errorMessage);
}
