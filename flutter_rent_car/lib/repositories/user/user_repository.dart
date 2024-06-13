import 'package:flutter_rent_car/model/dto/change_password_dto.dart';
import 'package:flutter_rent_car/model/dto/user_edit_dto.dart';
import 'package:flutter_rent_car/model/dto/user_ingresar_dto.dart';
import 'package:flutter_rent_car/model/response/auth/register_response.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';

abstract class UserRepository {
  Future<UserDetails> userDetails();
  Future<UserDetails> editUser(UserEditDto userEditDto);
  Future<RegisterResponse> changePassword(ChangePasswordDto changePasswordDto);
  Future<UserDetails> ingresar(UserIngresar userIngresar);
}
