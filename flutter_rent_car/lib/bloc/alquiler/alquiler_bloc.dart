import 'package:bloc/bloc.dart';
import 'package:flutter_rent_car/model/dto/alquiler_dto.dart';
import 'package:flutter_rent_car/model/response/alquiler/alquiler_response.dart';
import 'package:flutter_rent_car/model/response/user/alquiler_cliente/alquiler_clientes.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository.dart';
import 'package:meta/meta.dart';

part 'alquiler_event.dart';
part 'alquiler_state.dart';

class AlquilerBloc extends Bloc<AlquilerEvent, AlquilerState> {
  final AlquilerRepository alquilerRepository;

  AlquilerBloc(this.alquilerRepository) : super(AlquilerClienteInitial()) {
    on<GetAlquilerClienteEvent>(_getAlquilerCliente);
    on<DoAlquilerEvent>(_doAlquiler);
  }

  void _getAlquilerCliente(
      GetAlquilerClienteEvent event, Emitter<AlquilerState> emit) async {
    emit(GetAlquilerClienteLoading());
    try {
      final listAlquiler = await alquilerRepository.alquilerCliente(event.statusAlquiler);
      emit(GetAlquilerClienteSuccess(listAlquiler));
    } on Exception catch (e) {
      emit(GetAlquilerClienteError(e.toString()));
    }
  }

  void _doAlquiler(DoAlquilerEvent event, Emitter<AlquilerState> emit) async {
    emit(DoAlquilerLoading());
    try {
      final AlquilerDto alquilerDto = AlquilerDto(
          kilometrosAnos: event.kilometrosAnos,
          fechaInicio: event.fechaInicio,
          fechaFin: event.fechaFin,
          // precio: event.precio
          );
      final response =
          await alquilerRepository.alquiler(alquilerDto, event.uuid);
      emit(DoAlquilerSuccess(response));
    } on Exception catch (e) {
      emit(GetAlquilerClienteError(e.toString()));
    }
  }
}
