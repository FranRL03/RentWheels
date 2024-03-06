import 'package:flutter_rent_car/model/response/user/alquiler_cliente/alquiler_clientes.dart';
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
  Future<AlquilerClientesResponse> alquilerCliente() async {
    final token = await getToken();

    final response =
        await _httpClient.get(Uri.parse('$urlMovil/cliente/alquiler'),
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
}
