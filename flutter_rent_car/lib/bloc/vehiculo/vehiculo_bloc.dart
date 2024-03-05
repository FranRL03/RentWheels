import 'package:bloc/bloc.dart';
import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response/list_vehiculos_response.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:meta/meta.dart';

part 'vehiculo_event.dart';
part 'vehiculo_state.dart';

class VehiculoBloc extends Bloc<VehiculoEvent, VehiculoState> {
  final VehiculoRepository vehiculoRepository;

  VehiculoBloc(this.vehiculoRepository) : super(VehiculoInitial()) {
    on<GetVehiculoEvent>(_getVehiculos);
    on<GetVehiculosModelosEvent>(_getVehiculosModels);
  }

  void _getVehiculos(
      GetVehiculoEvent event, Emitter<VehiculoState> emit) async {
    emit(GetVehiculoLoading());
    try {
      final listVehiculos = await vehiculoRepository.listVehiculos();
      emit(GetVehiculoSuccess(listVehiculos));
    } on Exception catch (e) {
      emit(GetVehiculoError(e.toString()));
    }
  }

  void _getVehiculosModels(
      GetVehiculosModelosEvent event, Emitter<VehiculoState> emit) async {
    emit(GetModelosVehiculosLoading());
    try {
      final listVehiculosByModel =
          await vehiculoRepository.vehiculoModels(event.nombreModelo);
      emit(GetModelosVehiculosSuccess(listVehiculosByModel));
    } on Exception catch (e) {
      emit(GetModelosVehiculosError(e.toString()));
    }
  }
}
