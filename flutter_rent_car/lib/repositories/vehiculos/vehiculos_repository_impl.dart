import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response/list_vehiculos_response.dart';
import 'package:flutter_rent_car/model/response/vehiculos/vehiculo_details_response/vehiculo_details_response.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehiculoRepositoryImpl extends VehiculoRepository {
  final Client _htppClient = Client();

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Future<ListVehiculosResponse> listVehiculos() async {
    final token = await getToken();

    final response =
        await _htppClient.get(
          // Uri.parse('$urlMovil/vehiculos/menu'),
            Uri.parse('$urlChrome/vehiculos/menu'),
            headers: <String, String>{
          'Content-Type': 'Content-type: application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      return ListVehiculosResponse.fromJson(response.body);
      // return ListVehiculosResponse.fromJson(json.decoder as String);
    } else {
      throw Exception('Failed to get vehicles');
    }
  }

  @override
  Future<ListVehiculosResponse> vehiculoModels(String nombreModelo) async {
    final token = await getToken();

    final response = await _htppClient
        .get(
          // Uri.parse('$urlMovil/modelo/vehiculo/$nombreModelo'),
            Uri.parse('$urlChrome/modelo/vehiculo/$nombreModelo'),
            headers: <String, String>{
          'Content-Type': 'Content-type: application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      return ListVehiculosResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to get models');
    }
  }

  @override
  Future<VehiculoDetailsResponse> vehiculoDetails(String uuid) async {
    final token = await getToken();

    final response = await _htppClient.get(Uri.parse('$urlMovil/vehiculos/$uuid'),
            // Uri.parse('$urlChrome/modelo/vehiculo/$nombreModelo'),
            headers: <String, String>{
          'Content-Type': 'Content-type: application/json',
          'Authorization': 'Bearer $token',
        });

    if(response.statusCode == 200) {
      return VehiculoDetailsResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to get details');
    }
  }
}
