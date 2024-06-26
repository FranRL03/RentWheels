import 'dart:convert';

import 'package:flutter_rent_car/model/dto/alquiler_dto.dart';
import 'package:flutter_rent_car/model/response/alquiler/alquiler_response.dart';
import 'package:flutter_rent_car/model/response/user/alquiler_cliente/alquiler_clientes.dart';
import 'package:flutter_rent_car/model/response/user/list_price_rent_client/list_price_rent_client.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlquilerRepositoryImpl extends AlquilerRepository {
  final Client _httpClient = Client();

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Future<AlquilerClientesResponse> alquilerCliente(bool statusAlquiler) async {
    final token = await getToken();

    final response = await _httpClient
        .get(Uri.parse('$urlMovil/cliente/alquiler/$statusAlquiler'),
            // Uri.parse('$urlChrome/cliente/alquiler'),
            headers: <String, String>{
          'Content-Type': 'Content-type: application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      return AlquilerClientesResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load renting information');
    }
  }

  @override
  Future<AlquilerResponse> alquiler(
      AlquilerDto alquilerDto, String uuid) async {
    final token = await getToken();

    final response =
        await _httpClient.post(Uri.parse('$urlMovil/alquilar/$uuid'),
            // Uri.parse('$urlChrome/alquilar/$uuid'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode(alquilerDto.toJson()));

    if (response.statusCode == 201) {
      return AlquilerResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to do alquiler');
    }
  }

  @override
  Future<List<ListPriceRentClient>> listPriceAlquiler () async {
    final token = await getToken();

    final response = await _httpClient.get(
      Uri.parse('$urlMovil/cliente/precio/alquiler'),
      headers: <String, String>{
        'Content-Type':
            'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => ListPriceRentClient.fromNs(data))
          .toList();
    } else {
      throw Exception('Failed to get prices');
    }
  }
}
