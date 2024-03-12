import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response/list_vehiculos_response.dart';
import 'package:flutter_rent_car/model/response/vehiculos/vehiculo_details_response/vehiculo_details_response.dart';

abstract class VehiculoRepository {
  Future<ListVehiculosResponse> listVehiculos();
  Future<ListVehiculosResponse> vehiculoModels(String nombreModelo);
  Future<VehiculoDetailsResponse> vehiculoDetails(String uuid);
}
