import 'package:flutter_rent_car/model/dto/login_dto.dart';
import 'package:flutter_rent_car/model/dto/register_dto.dart';
import 'package:flutter_rent_car/model/response/auth/login_response.dart';
import 'package:flutter_rent_car/model/response/auth/register_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
  Future<RegisterResponse> register(RegisterDto registerDto);
  // Future<bool> checkToken();
}
