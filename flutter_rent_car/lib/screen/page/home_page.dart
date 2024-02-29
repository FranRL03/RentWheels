import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/user_details/user_bloc.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/repositories/user/user_repository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserRepository userRepository;
  late UserBloc _userBloc;

  @override
  void initState() {
    userRepository = UserRepositoryImpl();
    _userBloc = UserBloc(userRepository)..add(GetUserDetailsEvent());
    super.initState();
  }

  @override
  void dispose() {
    _userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _userBloc,
        ),
        // BlocProvider<ThemeBloc>(
        //   create: (BuildContext context) => ThemeBloc(),
        // ),
      ],
      child: _buildHome(),
    );
  }

  Widget _buildHome() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30),
        child: Column(
          children: [
            BlocBuilder<UserBloc, UserState>(
              bloc: _userBloc,
              builder: (context, state) {
                if (state is DoUserError) {
                  return Column(
                    children: [
                      Text(state.errorMessage),
                    ],
                  );
                } else if (state is DoUserSuccess) {
                  Widget avatarWidget;
                  if (state.userDetails.avatar != null) {
                    avatarWidget = CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color.fromRGBO(28, 38, 73, 1),
                      backgroundImage: NetworkImage(state.userDetails.avatar!),
                    );
                  } else {
                    avatarWidget = const CircleAvatar(
                      radius: 25,
                      backgroundColor: Color.fromRGBO(28, 38, 73, 1),
                      backgroundImage:
                          AssetImage('assets/images/foto_perfil.png'),
                    );
                  }
                  return Row(
                    children: [
                      avatarWidget,
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Column(
                          children: [
                            Text(
                              state.userDetails.username!.toUpperCase(),
                              style: const TextStyle(
                                  color: Color.fromRGBO(29, 47, 111, 1),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              state.userDetails.email!,
                              style: const TextStyle(
                                  color: Color.fromRGBO(105, 105, 106, 1),
                                  fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
