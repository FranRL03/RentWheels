import 'package:flutter_rent_car/model/dto/user_details_dto.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl extends UserRepository {
  final Client _httpClient = Client();

// Recuperación del token para incluirlo en las solicitudes HTTP
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  // Future<UserDetails> userDetails(UserDetailsDto userDetailsDto) async {
  //   final response = await _httpClient.get(
  //     // Uri.parse('$urlMovil/profile'),
  //     Uri.parse('$urlChrome/profile'),
  //     headers: <String, String>{'Content-Type': 'application/json'},
  //   );
  //   if (response.statusCode == 200) {
  //     return UserDetails.fromJson(response.body);
  //   } else {
  //     throw Exception('Failed to get details');
  //   }
  // }
  Future<UserDetails> userDetails(UserDetailsDto userDetailsDto) async {
    final token = await getToken(); // Obtén el token almacenado

    if (token == null) {
      throw Exception(
          'Token is null'); // Manejar caso en el que el token no esté disponible
    }

    final response = await _httpClient.get(
      Uri.parse('$urlChrome/profile'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UserDetails.fromJson(response.body);
    } else {
      throw Exception('Failed to get details');
    }
  }
}
