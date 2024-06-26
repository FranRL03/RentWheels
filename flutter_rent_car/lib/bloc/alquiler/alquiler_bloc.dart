import 'package:bloc/bloc.dart';
import 'package:flutter_rent_car/model/dto/alquiler_dto.dart';
import 'package:flutter_rent_car/model/response/alquiler/alquiler_response.dart';
import 'package:flutter_rent_car/model/response/user/alquiler_cliente/alquiler_clientes.dart';
import 'package:flutter_rent_car/model/response/user/list_price_rent_client/list_price_rent_client.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository.dart';
import 'package:meta/meta.dart';

part 'alquiler_event.dart';
part 'alquiler_state.dart';

class AlquilerBloc extends Bloc<AlquilerEvent, AlquilerState> {
  final AlquilerRepository alquilerRepository;

  AlquilerBloc(this.alquilerRepository) : super(AlquilerClienteInitial()) {
    on<GetAlquilerClienteEvent>(_getAlquilerCliente);
    on<DoAlquilerEvent>(_doAlquiler);
    on<GetPriceAlquilerClienteEvent>(_getListPriceAlquiler);
  }

  void _getAlquilerCliente(
      GetAlquilerClienteEvent event, Emitter<AlquilerState> emit) async {
    emit(GetAlquilerClienteLoading());
    try {
      final listAlquiler =
          await alquilerRepository.alquilerCliente(event.statusAlquiler);
      emit(GetAlquilerClienteSuccess(listAlquiler));
    } on Exception catch (e) {
      emit(GetAlquilerClienteError(e.toString()));
    }
  }

  void _doAlquiler(DoAlquilerEvent event, Emitter<AlquilerState> emit) async {
    emit(DoAlquilerLoading());
    try {
      final AlquilerDto alquilerDto = AlquilerDto(
          fechaInicio: event.fechaInicio,
          fechaFin: event.fechaFin,
          origen: event.origen,
          destino: event.destino);
      final response =
          await alquilerRepository.alquiler(alquilerDto, event.uuid);
      emit(DoAlquilerSuccess(response));
    } on Exception catch (e) {
      emit(GetAlquilerClienteError(e.toString()));
    }
  }

  void _getListPriceAlquiler(GetPriceAlquilerClienteEvent event, Emitter<AlquilerState> emit) async {
    try {
      final listPriceAlquiler = await alquilerRepository.listPriceAlquiler();
      emit(GetPriceAlquilerClienteSuccess(listPriceAlquiler));
    } on Exception catch (e) {
      emit(GetPriceAlquilerClienteError(e.toString()));
    }

  }
}
