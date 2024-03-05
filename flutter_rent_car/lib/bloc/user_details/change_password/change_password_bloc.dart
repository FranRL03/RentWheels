import 'package:bloc/bloc.dart';
import 'package:flutter_rent_car/model/dto/change_password_dto.dart';
import 'package:flutter_rent_car/model/response/user/change_password_response.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:meta/meta.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final UserRepository userRepository;

  ChangePasswordBloc(this.userRepository)
      : super(ChangePasswordInitial()) {
    on<DoChangePasswordEvent>(_doChangePassword);
  }

  void _doChangePassword(
      DoChangePasswordEvent event, Emitter<ChangePasswordState> emit) async {
    emit(DoChangePasswordLoading());

    try {
      final ChangePasswordDto changePasswordDto = ChangePasswordDto(
          oldPassword: event.oldPassword,
          newPassword: event.newPassword,
          verifyPassword: event.verifyPassword);
      final response =
          await userRepository.changePassword(changePasswordDto);
      emit(DoChangePasswordSuccess(response));
    } on Exception catch (e) {
      emit(DoChangePasswordError(e.toString()));
    }
  }
}
