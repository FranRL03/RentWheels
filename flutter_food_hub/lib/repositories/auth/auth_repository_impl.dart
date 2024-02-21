import 'package:flutter_food_hub/model/dto/login_dto.dart';
import 'package:flutter_food_hub/model/response/login_response.dart';
import 'package:flutter_food_hub/repositories/auth/auth_repository.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AuthRepositoryImpl extends AuthRepository {
  final Client _httpClient = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    final jsonBody = jsonEncode(loginDto.toJson());
    final response = await _httpClient.post(
      // Uri.parse('10.0.2.2:8080/auth/login'),
      Uri.parse('http://localhost:8080/auth/login'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonBody,
    );
    if (response.statusCode == 201) {
      return LoginResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to do login');
    }
  }
}
