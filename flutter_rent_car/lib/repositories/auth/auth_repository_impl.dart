import 'package:flutter_rent_car/model/dto/login_dto.dart';
import 'package:flutter_rent_car/model/dto/register_dto.dart';
import 'package:flutter_rent_car/model/response/login_response.dart';
import 'package:flutter_rent_car/model/response/register_response.dart';
import 'package:flutter_rent_car/repositories/auth/auth_repository.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AuthRepositoryImpl extends AuthRepository {
  final Client _httpClient = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    final jsonBody = jsonEncode(loginDto.toJson());
    final response = await _httpClient.post(
      Uri.parse('10.0.2.2:8080/auth/login'),
      // Uri.parse('http://localhost:8080/auth/login'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonBody,
    );
    if (response.statusCode == 201) {
      return LoginResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to do login');
    }
  }

  @override
  Future<RegisterResponse> register(RegisterDto registerDto) async {
    final response = await _httpClient.post(
        Uri.parse('10.0.2.2:8080/auth/register'),
        // Uri.parse('http://localhost:8080/auth/register'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(registerDto.toJson()));
    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to do register');
    }
  }
}
