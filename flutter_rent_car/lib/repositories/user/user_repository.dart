import 'package:flutter_rent_car/model/response/user/user_details.dart';

abstract class UserRepository {
  Future<UserDetails> userDetails();
}
