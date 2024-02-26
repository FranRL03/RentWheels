import 'package:flutter_rent_car/model/dto/user_details_dto.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';

abstract class UserRepository {
Future<UserDetails> userDetails(UserDetailsDto userDetailsDto);
}
