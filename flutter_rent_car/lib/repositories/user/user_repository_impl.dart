import 'dart:convert';

import 'package:flutter_rent_car/model/dto/user_details_dto.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:http/http.dart';

class UserRepositoryImpl extends UserRepository {
  final Client _httpClient = Client();

  @override
  Future<UserDetails> userDetails(UserDetailsDto userDetailsDto) async {
    final response = await _httpClient.get(
      Uri.parse('10.0.2.2:8080/profile'),
      // Uri.parse('http://localhost:8080/auth/login'),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return UserDetails.fromJson(response.body);
    } else {
      throw Exception('Failed to get details');
    }
  }
}
