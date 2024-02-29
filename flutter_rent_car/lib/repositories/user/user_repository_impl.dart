import 'package:flutter_rent_car/model/response/user/user_details.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl extends UserRepository {
  final Client _httpClient = Client();

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Future<UserDetails> userDetails() async {
    final token = await getToken(); // Obtén el token almacenado

    final response = await _httpClient.get(
      Uri.parse('$urlChrome/profile'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return UserDetails.fromJson(response.body);
    } else {
      throw Exception('Failed to get details');
    }
  }
}
