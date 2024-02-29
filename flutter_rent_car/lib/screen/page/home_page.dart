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
    _userBloc = UserBloc(userRepository)..add(DoUserEvent());
    super.initState();
  }

  @override
  void dispose() {
    _userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider.value(
    //   value: _userBloc,
    //   child: Scaffold(
    //     body: _buildHome(),
    //   ),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(userRepository),
        ),
        // BlocProvider<ThemeBloc>(
        //   create: (BuildContext context) => ThemeBloc(),
        // ),
      ],
      child: _buildHome(),
    );
  }

  Widget _buildHome() {
    // return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
    //   if (state is DoUserError) {
    //     return Column(
    //       children: [
    //         Text(state.errorMessage),
    //       ],
    //     );
    //   } else if (state is DoUserSuccess) {
    //     return SizedBox(
    //       child: Padding(
    //         padding: const EdgeInsets.only(top: 5),
    //         child: Column(
    //           children: [Text(state.userDetails.email!)],
    //         ),
    //       ),
    //     );
    //   }
    //   return const Center(child: CircularProgressIndicator());
    // });
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is DoUserError) {
          return Column(
            children: [
              Text(state.errorMessage),
            ],
          );
        } else if (state is DoUserSuccess) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [Text(state.userDetails.email!)],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
