import 'package:flutter_rent_car/model/dto/alquiler_dto.dart';
import 'package:flutter_rent_car/model/response/alquiler/alquiler_response.dart';
import 'package:flutter_rent_car/model/response/user/alquiler_cliente/alquiler_clientes.dart';

abstract class AlquilerRepository {
  Future<AlquilerClientesResponse> alquilerCliente();
  Future<AlquilerResponse> alquiler(AlquilerDto alquilerDto, String uuid);
}
