import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response_v2/list_vehiculos_response_v2.dart';
import 'package:flutter_rent_car/model/response/vehiculos/vehiculo_details_response/vehiculo_details_response.dart';

abstract class VehiculoRepository {
  // Future<ListVehiculosResponse> listVehiculos();
  Future<List<ListVehiculosResponseV2>> listVehiculos();
  Future<List<ListVehiculosResponseV2>> vehiculoModels(String nombreModelo);
  Future<VehiculoDetailsResponse> vehiculoDetails(String uuid);
}
