import 'package:bloc/bloc.dart';
import 'package:flutter_food_hub/model/dto/login_dto.dart';
import 'package:flutter_food_hub/model/response/login_response.dart';
import 'package:flutter_food_hub/repositories/auth/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
          on<DoLoginEvent>(_doLogin);
    });
  }

    void _doLogin(DoLoginEvent event, Emitter<LoginState> emit) async {
    emit(DoLoginLoading());
    final SharedPreferences prefs = await _prefs;
    final String requestToken = prefs.getString('request_token') ?? '';

    try {
      final LoginDto loginDto = LoginDto(
          email: event.email,
          password: event.password,
          token: requestToken);
      final response = await authRepository.login(loginDto);
      emit(DoLoginSuccess(response));
      return;
    } on Exception catch (e) {
      emit(DoLoginError(e.toString()));
    }
  }
}
