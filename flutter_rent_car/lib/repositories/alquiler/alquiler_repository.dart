import 'package:flutter_rent_car/model/dto/alquiler_dto.dart';
import 'package:flutter_rent_car/model/response/alquiler/alquiler_response.dart';
import 'package:flutter_rent_car/model/response/user/alquiler_cliente/alquiler_clientes.dart';
import 'package:flutter_rent_car/model/response/user/list_price_rent_client/list_price_rent_client.dart';

abstract class AlquilerRepository {
  Future<AlquilerClientesResponse> alquilerCliente(bool statusAlquiler);
  Future<AlquilerResponse> alquiler(AlquilerDto alquilerDto, String uuid);
  Future<List<ListPriceRentClient>> listPriceAlquiler();
}
