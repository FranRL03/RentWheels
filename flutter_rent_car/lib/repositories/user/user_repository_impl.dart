import 'dart:convert';
import 'dart:io';

import 'package:flutter_rent_car/model/dto/change_password_dto.dart';
import 'package:flutter_rent_car/model/dto/user_edit_dto.dart';
import 'package:flutter_rent_car/model/response/auth/register_response.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl extends UserRepository {
  // final Client _httpClient = Client();
  final http.Client _httpClient = http.Client();

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    print('Token borrado exitosamente.');
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

    final response = await _httpClient.put(Uri.parse('$urlMovil/profile/edit'),
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
  Future<RegisterResponse> changePassword(
      ChangePasswordDto changePasswordDto) async {
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
      return RegisterResponse.fromJson(response.body);
    } else {
      throw Exception('Error al cambiar la contraseña: ${response.statusCode}');
    }
  }
}
