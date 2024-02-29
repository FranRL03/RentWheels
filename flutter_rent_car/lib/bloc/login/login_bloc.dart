import 'package:bloc/bloc.dart';
import 'package:flutter_rent_car/model/dto/login_dto.dart';
import 'package:flutter_rent_car/model/response/auth/login_response.dart';
import 'package:flutter_rent_car/repositories/auth/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<DoLoginEvent>(_doLogin);
    // on<DoTokenEvent>(_doToken);
  }

  void _doLogin(DoLoginEvent event, Emitter<LoginState> emit) async {
    emit(DoLoginLoading());
    try {
      final LoginDto loginDto =
          LoginDto(username: event.username, password: event.password);
      final response = await authRepository.login(loginDto);
      emit(DoLoginSuccess(response));
      return;
    } on Exception catch (e) {
      emit(DoLoginError(e.toString()));
    }
  }

  // Future<FutureOr<void>> _doToken(
  //     DoTokenEvent event, Emitter<LoginState> emitter) async {
  //   try {
  //     final response = await authRepository.checkToken();
  //     emitter(DoTokenSuccess(response));
  //   } on Exception catch (e) {
  //     emitter(DoTokenError(e.toString()));
  //   }
  // }
}
