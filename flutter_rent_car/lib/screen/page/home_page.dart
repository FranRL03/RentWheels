import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/home_page/home_bloc.dart';
import 'package:flutter_rent_car/model/dto/user_details_dto.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/repositories/user/user_repository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

late UserRepository userRepository;
late HomeBloc _homeBloc;
late UserDetailsDto userDetails;

  @override
  void initState() {
    userRepository = UserRepositoryImpl();
    _homeBloc = HomeBloc(userRepository);
     userDetails = UserDetailsDto();
    _homeBloc = HomeBloc(userRepository)..add(DoHomeEvent('popular'));
    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeBloc,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<HomeBloc, HomeState>(
          buildWhen: (context, state) {
            return state is HomeInitial ||
                state is DoHomeSuccess ||
                state is DoHomeError ||
                state is DoHomeLoading;
          },
          builder: (context, state) {
            if (state is DoHomeSuccess) {
              userDetails = (state).userDetails;
            } else if (state is DoHomeError) {
              return const Text('Home error');
            } else if (state is DoHomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(child: _buildHome());
          },
          listener: (BuildContext context, HomeState state) {},
        ),
      ),

      );
  }

  _buildHome(){
    return Text('Username: ${userDetails.username}');
  }

}
