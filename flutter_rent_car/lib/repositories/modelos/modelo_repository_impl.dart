import 'package:flutter_rent_car/model/response/modelo/modelo_response/modelo_response.dart';
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
  Future<ModeloResponse> models() async {
    final token = await getToken();

    final response = await _htppClient.get(
      Uri.parse('$urlMovil/modelo'),
        // Uri.parse('$urlChrome/modelo'),
        headers: <String, String>{
          'Content-Type': 'Content-type: application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      return ModeloResponse.fromJson(response.body);
      // return ModeloResponse.fromJson(json.decoder as String);
    } else {
      throw Exception('Failed to get models');
    }
  }
}
