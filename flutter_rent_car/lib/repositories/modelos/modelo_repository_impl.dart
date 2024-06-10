import 'dart:convert';

import 'package:flutter_rent_car/model/response/modelo/modelo_response_v2/modelo_response_v2.dart';
import 'package:flutter_rent_car/repositories/modelos/modelo_repository.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModeloRepositorioImpl extends ModeloRepository {
  final Client _htppClient = Client();

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Future<List<ModeloResponseV2>> models() async {
    final token = await getToken();

    final response = await _htppClient.get(Uri.parse('$urlMovil/modelo'),
        // Uri.parse('$urlChrome/modelo'),
        headers: <String, String>{
          'Content-Type': 'Content-type: application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => ModeloResponseV2.fromModeloResponseV2(data))
          .toList();
    } else {
      throw Exception('Failed to get models');
    }
  }
}
