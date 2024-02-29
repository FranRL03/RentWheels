import 'package:bloc/bloc.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<DoUserEvent>(_doUser);
  }

  void _doUser(DoUserEvent event, Emitter<UserState> emit) async {
    emit(DoUserLoading());
    try {
      final response = await userRepository.userDetails();
      emit(DoUserSuccess(response));
    } on Exception catch (e) {
      emit(DoUserError(e.toString()));
    }
  }
}
