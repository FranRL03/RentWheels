import 'dart:ffi';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_rent_car/model/dto/user_edit_dto.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'edit_user_event.dart';
part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  final UserRepository userRepository;

  EditUserBloc(this.userRepository) : super(EditUserInitial()) {
    on<DoEditUserEvent>(_doEditUser);
  }

  void _doEditUser(DoEditUserEvent event, Emitter<EditUserState> emit) async {
    emit(DoEditUserLoading());
    try {
      final UserEditDto userEditDto = UserEditDto(
          avatar: event.avatar,
          email: event.email,
          telefono: event.telefono,
          pin: event.pin);

      final response = await userRepository.editUser(userEditDto);
      emit(DoEditUserSuccess(response));
      return;
    } on Exception catch (e) {
      emit(DoEditUserError(e.toString()));
    }
  }
}
