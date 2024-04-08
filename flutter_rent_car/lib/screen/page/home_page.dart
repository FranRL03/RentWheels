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
import 'package:flutter_rent_car/screen/page/alquiler_cliente.dart';
import 'package:flutter_rent_car/screen/page/my_perfil_page.dart';
import 'package:flutter_rent_car/screen/widget/home_page/card_coche_widget.dart';
import 'package:flutter_rent_car/screen/widget/home_page/card_modelo_widget.dart';
import 'package:flutter_rent_car/screen/widget/home_page/profile_home_widget.dart';

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
  late VehiculoBloc vehiculoBloc;

  final String nombreModelo = '';

  @override
  void initState() {
    userRepository = UserRepositoryImpl();
    _userBloc = UserBloc(userRepository)..add(GetUserDetailsEvent());
    modeloRepository = ModeloRepositorioImpl();
    _modelosBloc = ModelosBloc(modeloRepository)..add(GetModelosEvent());
    vehiculoRepository = VehiculoRepositoryImpl();
    vehiculoBloc = VehiculoBloc(vehiculoRepository)..add(GetVehiculoEvent());
    super.initState();
  }

  @override
  void dispose() {
    _userBloc.close();
    _modelosBloc.close();
    vehiculoBloc.close();
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
        BlocProvider.value(value: vehiculoBloc)
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
              label: 'Inicio',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.car_rental_rounded),
              icon: Icon(Icons.car_rental_outlined),
              label: 'Mis Alquileres',
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
                final user = state.userDetails;
                return ProfileHomeWidget(userDetails: user);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          Expanded(flex: 1, child: modelosDeCoches()),
          Expanded(flex: 4, child: listDeCoches()),
        ],
      ),
    );
  }

  Widget modelosDeCoches() {
    return BlocBuilder<ModelosBloc, ModelosState>(builder: (context, state) {
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
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.modeloResponse.content!.length,
                    itemBuilder: (context, index) {
                      final modelo = state.modeloResponse;
                      return CardModeloWidget(
                          modeloResponse: modelo,
                          index: index,
                          vehiculoBloc: vehiculoBloc);
                    })));
      }
      return const Center(child: CircularProgressIndicator());
    });
  }

  Widget listDeCoches() {
    return BlocBuilder<VehiculoBloc, VehiculoState>(
        bloc: vehiculoBloc,
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
                    itemCount: state.vehiculosResponse.length,
                    itemBuilder: (context, index) {
                      final vehiculo = state.vehiculosResponse;
                      return CardCocheWidget(
                          vehiculosResponse: vehiculo, index: index);
                    }));
          } else if (state is GetModelosVehiculosSuccess) {
            return SizedBox(
                child: ListView.builder(
                    itemCount: state.vehiculosModelsResponse.length,
                    itemBuilder: (context, index) {
                      final vehiculo = state.vehiculosModelsResponse;
                      return CardCocheWidget(
                          vehiculosResponse: vehiculo, index: index);
                    }));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return _page();
      case 1:
        return const ListAlquilerCliente();
      case 2:
        return const MyPerfilPage(); // Define la página de mensajes
      default:
        return Container(); // En caso de que el índice sea inválido
    }
  }
}
