import 'package:bloc/bloc.dart';
import 'package:flutter_rent_car/model/response/modelo/modelo_response/modelo_response.dart';
import 'package:flutter_rent_car/model/response/modelo/modelo_response_v2/modelo_response_v2.dart';
import 'package:flutter_rent_car/repositories/modelos/modelo_repository.dart';
import 'package:meta/meta.dart';

part 'modelos_event.dart';
part 'modelos_state.dart';

class ModelosBloc extends Bloc<ModelosEvent, ModelosState> {
  final ModeloRepository modeloRepository;

  ModelosBloc(this.modeloRepository) : super(ModelosInitial()) {
    on<GetModelosEvent>(_getModels);
  }

  void _getModels(GetModelosEvent event, Emitter<ModelosState> emit) async {
    emit(GetModelosLoading());
    try {
      final listModelos = await modeloRepository.models();
      emit(GetModelosSuccess(listModelos));
    } on Exception catch (e) {
      emit(GetModelosError(e.toString()));
    }
  }
}
