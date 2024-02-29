import 'package:flutter_rent_car/model/dto/login_dto.dart';
import 'package:flutter_rent_car/model/dto/register_dto.dart';
import 'package:flutter_rent_car/model/response/auth/login_response.dart';
import 'package:flutter_rent_car/model/response/auth/register_response.dart';
import 'package:flutter_rent_car/repositories/auth/auth_repository.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Client _httpClient = Client();

  void saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    final jsonBody = jsonEncode(loginDto.toJson());
    final response = await _httpClient.post(
      // Uri.parse('$urlMovil/auth/login'),
      Uri.parse('$urlChrome/auth/login'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonBody,
    );
    if (response.statusCode == 201) {
      final loginResponse = LoginResponse.fromJson(response.body);
      saveToken(loginResponse.token!);
      return loginResponse;
      // return LoginResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to do login');
    }
  }

  @override
  Future<RegisterResponse> register(RegisterDto registerDto) async {
    final response = await _httpClient.post(
        // Uri.parse('$urlMovil/auth/register'),
        Uri.parse('$urlChrome/auth/register'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(registerDto.toJson()));
    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to do register');
    }
  }

  @override
  Future<bool> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await _httpClient.post(
        // Uri.parse('$urlMovil/auth/register'),
        Uri.parse('$urlChrome/auth/register'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: prefs.getString('token'));

    if (response.statusCode == 202) {
      return true;
    } else {
      return false;
    }
  }
}
