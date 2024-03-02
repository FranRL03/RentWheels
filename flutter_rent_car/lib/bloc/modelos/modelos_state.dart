part of 'modelos_bloc.dart';

@immutable
sealed class ModelosState {}

final class ModelosInitial extends ModelosState {}

final class GetModelosLoading extends ModelosState {}

final class GetModelosSuccess extends ModelosState {
  final ModeloResponse modeloResponse;
  GetModelosSuccess(this.modeloResponse);
}

final class GetModelosError extends ModelosState {
  final String errorMessage;
  GetModelosError(this.errorMessage);
}
