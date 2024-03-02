part of 'modelos_bloc.dart';

@immutable
sealed class ModelosEvent {}

class GetModelosEvent extends ModelosEvent {
  GetModelosEvent();
}
