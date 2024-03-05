import 'dart:convert';

import 'package:flutter_rent_car/model/dto/change_password_dto.dart';
import 'package:flutter_rent_car/model/dto/user_edit_dto.dart';
import 'package:flutter_rent_car/model/response/user/change_password_response.dart';
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
      Uri.parse('$urlMovil/profile'),
      // Uri.parse('$urlChrome/profile'),
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

  @override
  Future<UserDetails> editUser(UserEditDto userEditDto) async {
    final token = await getToken();

    final response = await _httpClient.put(
      Uri.parse('$urlMovil/profile/edit'),
        // Uri.parse('$urlChrome/profile/edit'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(userEditDto.toJson()));

    if (response.statusCode == 200) {
      return UserDetails.fromJson(response.body);
    } else {
      throw Exception('Failed to do edit');
    }
  }

  @override
  Future<ChangePasswordResponse> changePassword (ChangePasswordDto changePasswordDto) async {
    final token = await getToken();

    final response = await _httpClient.put(
      Uri.parse('$urlMovil/user/changePassword'),
        // Uri.parse('$urlChrome/user/changePassword'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(changePasswordDto.toJson()),
    );
    if (response.statusCode == 200) {
      return ChangePasswordResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cambiar la contraseña: ${response.statusCode}');
    }
  }
}
