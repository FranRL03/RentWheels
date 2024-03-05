import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/modelos/modelos_bloc.dart';
import 'package:flutter_rent_car/bloc/user_details/user_bloc.dart';
import 'package:flutter_rent_car/bloc/vehiculo/vehiculo_bloc.dart';
import 'package:flutter_rent_car/repositories/modelos/modelo_repository.dart';
import 'package:flutter_rent_car/repositories/modelos/modelo_repository_impl.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/repositories/user/user_repository_impl.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';
import 'package:flutter_rent_car/screen/page/my_perfil_page.dart';
import 'package:flutter_rent_car/screen/patatus.dart';
import 'package:flutter_rent_car/variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  late UserRepository userRepository;
  late ModeloRepository modeloRepository;
  late VehiculoRepository vehiculoRepository;

  late UserBloc _userBloc;
  late ModelosBloc _modelosBloc;
  late VehiculoBloc _vehiculoBloc;

  @override
  void initState() {
    userRepository = UserRepositoryImpl();
    _userBloc = UserBloc(userRepository)..add(GetUserDetailsEvent());
    modeloRepository = ModeloRepositorioImpl();
    _modelosBloc = ModelosBloc(modeloRepository)..add(GetModelosEvent());
    vehiculoRepository = VehiculoRepositoryImpl();
    _vehiculoBloc = VehiculoBloc(vehiculoRepository)..add(GetVehiculoEvent());
    super.initState();
  }

  @override
  void dispose() {
    _userBloc.close();
    _modelosBloc.close();
    _vehiculoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _userBloc,
        ),
        BlocProvider.value(value: _modelosBloc),
        BlocProvider.value(value: _vehiculoBloc)
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
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.car_rental_rounded),
              icon: Icon(Icons.car_rental_outlined),
              label: 'Mantenimiento',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: 'Perfil',
            ),
          ],
        ),
        body: _buildPage(currentPageIndex));
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 10),
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
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          Expanded(flex: 1, child: modelosDeCoches()),
          Expanded(flex: 4, child: listDeCoches())
        ],
      ),
    );
  }

  Widget modelosDeCoches() {
    return BlocBuilder<ModelosBloc, ModelosState>(
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
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.modeloResponse.content!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 80,
                      // height: 20,
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          color: const Color.fromRGBO(29, 47, 111, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          elevation: 7.0,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    const Color.fromARGB(255, 119, 133, 187),
                                backgroundImage: NetworkImage(
                                    state.modeloResponse.content![index].logo!),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget listDeCoches() {
    return BlocBuilder<VehiculoBloc, VehiculoState>(
      bloc: _vehiculoBloc,
      builder: (context, state) {
        if (state is GetVehiculoError) {
          return Column(
            children: [
              Text(state.errorMessage),
            ],
          );
        } else if (state is GetVehiculoSuccess) {
          return SizedBox(
            child: ListView.builder(
                itemCount: state.vehiculosResponse.content!.length,
                itemBuilder: (context, index) {
                  Icon tipoIcono = const Icon(
                    Icons.local_gas_station,
                    color: Colors.grey,
                    size: 25,
                  );
                  Color disponible = Colors.black;
                  if (state.vehiculosResponse.content![index].combustion ==
                      'Gasolina') {
                    tipoIcono = const Icon(
                      Icons.local_gas_station,
                      color: Colors.grey,
                      size: 25,
                    );
                  } else if (state
                          .vehiculosResponse.content![index].combustion ==
                      'Electrico') {
                    tipoIcono = const Icon(
                      Icons.flash_on_outlined,
                      color: Colors.yellow,
                      size: 25,
                    );
                  } else if (state
                          .vehiculosResponse.content![index].combustion ==
                      'Diesel') {
                    tipoIcono = const Icon(
                      Icons.gas_meter_rounded,
                      color: Color.fromARGB(255, 105, 96, 65),
                      size: 25,
                    );
                  } else {}

                  if (state.vehiculosResponse.content![index].disponible ==
                      true) {
                    disponible = Colors.green.shade300;
                  } else {
                    disponible = Colors.red.shade300;
                  }

                  return SizedBox(
                      width: 160,
                      height: 250,
                      child: Card(
                        surfaceTintColor: Colors.white,
                        color: Colors.white,
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: AppColors.colorPrincipal),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.zero,
                          ),
                        ),
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 300, top: 5),
                                child: tipoIcono),
                            Row(
                              children: [
                                SizedBox(
                                  width: 160,
                                  child: Image.network(
                                    state.vehiculosResponse.content![index]
                                        .imagen!,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: Text(
                                    '${state.vehiculosResponse.content![index].modelo}',
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    width: 100,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: disponible,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Disponible',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          // fontSize: 28,
                                          color: Colors
                                              .white, // Cambia el color del texto según sea necesario
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 120),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Acción a realizar cuando se presione el botón
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 82, 148, 181),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 24,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.5),
                                      ),
                                    ),
                                    child: const Text(
                                      'Información',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ));
                }),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return _page();
      case 1:
        return const MyWidget();
      case 2:
        return const MyPerfilPage(); // Define la página de mensajes
      default:
        return Container(); // En caso de que el índice sea inválido
    }
  }
}
