import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/modelos/modelos_bloc.dart';
import 'package:flutter_rent_car/bloc/user_details/user_bloc.dart';
import 'package:flutter_rent_car/repositories/modelos/modelo_repository.dart';
import 'package:flutter_rent_car/repositories/modelos/modelo_repository_impl.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/repositories/user/user_repository_impl.dart';
import 'package:flutter_rent_car/screen/patatus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  late UserRepository userRepository;
  late ModeloRepository modeloRepository;
  late UserBloc _userBloc;
  late ModelosBloc _modelosBloc;

  @override
  void initState() {
    userRepository = UserRepositoryImpl();
    _userBloc = UserBloc(userRepository)..add(GetUserDetailsEvent());
    modeloRepository = ModeloRepositorioImpl();
    _modelosBloc = ModelosBloc(modeloRepository)..add(GetModelosEvent());
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
        BlocProvider.value(value: _modelosBloc)
      ],
      child: _buildHome(),
    );
  }

  Widget _buildHome() {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          backgroundColor: const Color.fromARGB(255, 141, 186, 227),
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: const Color.fromARGB(255, 255, 255, 255),
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.car_rental_rounded),
              icon: Icon(Icons.car_rental_outlined),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: '',
            ),
          ],
        ),
        body: _buildPage(currentPageIndex));
  }

  Widget _page() {
    return Padding(
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
                return Column(
                  children: [
                    Row(
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
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 70),
                    //   child: SizedBox(
                    //     height: 170,
                    //     width: double.infinity,
                    //     child: ListView(
                    //       scrollDirection: Axis.horizontal,
                    //       children: [
                    //         SizedBox(
                    //           width: 120,
                    //           // height: 200,
                    //           child: Card(
                    //             color: const Color.fromRGBO(29, 47, 111, 1),
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(100.0),
                    //             ),
                    //             elevation: 0,
                    //             child: Column(
                    //               children: [
                    //                 Padding(
                    //                   padding: const EdgeInsets.only(top: 10),
                    //                   child: CircleAvatar(
                    //                     radius: 40,
                    //                     backgroundColor:
                    //                         const Color.fromRGBO(28, 38, 73, 1),
                    //                     backgroundImage: NetworkImage(
                    //                         state.userDetails.avatar!),
                    //                   ),
                    //                 ),
                    //                 const Padding(
                    //                   padding: EdgeInsets.only(top: 13),
                    //                   child: Text(
                    //                     'Ferrari',
                    //                     style: TextStyle(
                    //                       color: Colors.white,
                    //                       fontSize: 20,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          BlocBuilder<ModelosBloc, ModelosState>(
            bloc: _modelosBloc,
            builder: (context, state) {
              if (state is GetModelosError) {
                return Column(
                  children: [
                    Text(state.errorMessage),
                  ],
                );
              } else if (state is GetModelosSuccess) {
                return Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 120,
                          // height: 200,
                          child: Card(
                            color: const Color.fromRGBO(29, 47, 111, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            elevation: 0,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor:
                                        const Color.fromRGBO(28, 38, 73, 1),
                                    backgroundImage: NetworkImage(
                                        state.modeloResponse.logo!),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 13),
                                  child: Text(
                                    state.modeloResponse.modelo!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return _page();
      case 1:
        return const MyWidget();
      case 2:
        return const MyWidget(); // Define la página de mensajes
      default:
        return Container(); // En caso de que el índice sea inválido
    }
  }
}
