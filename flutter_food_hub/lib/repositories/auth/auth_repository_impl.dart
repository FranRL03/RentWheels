import 'package:flutter_food_hub/model/dto/login_dto.dart';
import 'package:flutter_food_hub/model/response/login_response.dart';
import 'package:flutter_food_hub/repositories/auth/auth_repository.dart';
import 'package:http/http.dart';
import 'dart:convert';


class AuthRepositoryImpl extends AuthRepository{
  final Client _httpClient = Client();

    @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    final response = await _httpClient.post(
      Uri.parse(
          '127.0.0.1:8080/auth/login'),
      body: loginDto.toJson(),
    );
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to do login');
    }
  }
}