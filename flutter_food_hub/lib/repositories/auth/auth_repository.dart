import 'package:flutter_food_hub/model/dto/login_dto.dart';
import 'package:flutter_food_hub/model/dto/register_dto.dart';
import 'package:flutter_food_hub/model/response/login_response.dart';
import 'package:flutter_food_hub/model/response/register_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
  Future<RegisterResponse> register(RegisterDto registerDto);
}
