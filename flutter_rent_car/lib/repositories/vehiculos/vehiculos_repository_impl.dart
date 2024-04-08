import 'dart:convert';

import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response/list_vehiculos_response.dart';
import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response_v2/list_vehiculos_response_v2.dart';
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
Future<List<ListVehiculosResponseV2>> listVehiculos() async {
  final token = await getToken();

  final response = await _htppClient.get(
    Uri.parse('$urlMovil/vehiculos/menu'),
    headers: <String, String>{
      'Content-Type': 'application/json',  // Corregido aquí: quitado 'Content-type:'
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => ListVehiculosResponseV2.fromListVehiculos(data)).toList();
  } else {
    throw Exception('Failed to get vehicles');
  }
}


  @override
  Future<List<ListVehiculosResponseV2>> vehiculoModels(String nombreModelo) async {
    final token = await getToken();

    final response = await _htppClient
        .get(Uri.parse('$urlMovil/modelo/vehiculo/$nombreModelo'),
            // Uri.parse('$urlChrome/modelo/vehiculo/$nombreModelo'),
            headers: <String, String>{
          'Content-Type': 'Content-type: application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
       List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => ListVehiculosResponseV2.fromListVehiculos(data)).toList();
    } else {
      throw Exception('Failed to get models');
    }
  }

  @override
  Future<VehiculoDetailsResponse> vehiculoDetails(String uuid) async {
    final token = await getToken();

    final response =
        await _htppClient.get(Uri.parse('$urlMovil/vehiculos/$uuid'),
            // Uri.parse('$urlChrome/modelo/vehiculo/$nombreModelo'),
            headers: <String, String>{
          'Content-Type': 'Content-type: application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      return VehiculoDetailsResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to get details');
    }
  }
}
