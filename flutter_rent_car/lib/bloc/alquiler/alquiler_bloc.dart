import 'package:bloc/bloc.dart';
import 'package:flutter_rent_car/model/response/user/alquiler_cliente/alquiler_clientes.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository.dart';
import 'package:meta/meta.dart';

part 'alquiler_event.dart';
part 'alquiler_state.dart';

class AlquilerBloc extends Bloc<AlquilerEvent, AlquilerState> {
  final AlquilerRepository alquilerRepository;

  AlquilerBloc(this.alquilerRepository) : super(AlquilerClienteInitial()) {
    on<GetAlquilerClienteEvent>(_getAlquilerCliente);
  }

  void _getAlquilerCliente(
      GetAlquilerClienteEvent event, Emitter<AlquilerState> emit) async {
    emit(GetAlquilerClienteLoading());
    try {
      final listAlquiler = await alquilerRepository.alquilerCliente();
      emit(GetAlquilerClienteSuccess(listAlquiler));
    } on Exception catch (e) {
      emit(GetAlquilerClienteError(e.toString()));
    }
  }
}
