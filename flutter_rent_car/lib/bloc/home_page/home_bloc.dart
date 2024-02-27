import 'package:bloc/bloc.dart';
import 'package:flutter_rent_car/model/dto/user_details_dto.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc(this.userRepository) : super(HomeInitial()) {
    on<DoHomeEvent>(_doHome);
  }

  void _doHome(DoHomeEvent event, Emitter<HomeState> emit) async {
    emit(DoHomeLoading());
    try{
      
      final UserDetailsDto userDetails = UserDetailsDto(username: event.username);
      final response = await userRepository.userDetails(userDetails);
      emit(DoHomeSuccess(response as UserDetailsDto));
    } on Exception catch (e){
      emit(DoHomeError(e.toString()));
    }
  }
}
