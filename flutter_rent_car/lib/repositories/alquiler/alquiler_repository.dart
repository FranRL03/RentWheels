import 'package:flutter_rent_car/model/response/user/alquiler_cliente/alquiler_clientes.dart';

abstract class AlquilerRepository {
  Future<AlquilerClientesResponse> alquilerCliente();
}
