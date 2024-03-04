import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response/list_vehiculos_response.dart';

abstract class VehiculoRepository {
  Future<ListVehiculosResponse> listVehiculos();
}
