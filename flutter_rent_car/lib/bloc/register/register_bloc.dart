import 'package:bloc/bloc.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_rent_car/model/dto/register_dto.dart';
import 'package:flutter_rent_car/model/response/register_response.dart';
import 'package:flutter_rent_car/repositories/auth/auth_repository.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc(this.authRepository) : super(RegisterInitial()) {
    on<DoRegisterEvent>(_doRegister);
  }

  void _doRegister(DoRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(DoRegisterLoading());
    try {
      final RegisterDto registerDto = RegisterDto(
          username: event.username,
          // nombre: event.nombre,
          email: event.email,
          password: event.password,
          verifyPassword: event.verifyPassword,
          telefono: event.telefono,
          pin: event.pin);
      final response = await authRepository.register(registerDto);
      emit(DoRegisterSuccess(response));
      return;
    } on Exception catch (e) {
      emit(DoRegisterError(e.toString()));
    }
  }
}
