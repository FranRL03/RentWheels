import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/modelos/modelos_bloc.dart';
import 'package:flutter_rent_car/bloc/vehiculo/vehiculo_bloc.dart';
import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response/list_vehiculos_response.dart';
import 'package:flutter_rent_car/repositories/modelos/modelo_repository.dart';
import 'package:flutter_rent_car/repositories/modelos/modelo_repository_impl.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';
import 'package:flutter_rent_car/screen/page/vehiculo_details.dart';
import 'package:flutter_rent_car/variables.dart';

class ListaCochesWidget extends StatefulWidget {
  const ListaCochesWidget({super.key, required ListVehiculosResponse vehiculosResponse});

  @override
  State<ListaCochesWidget> createState() => _ListaCochesWidgetState();
}

class _ListaCochesWidgetState extends State<ListaCochesWidget> {
  late VehiculoRepository vehiculoRepository;
  late VehiculoBloc _vehiculoBloc;

  final String nombreModelo = '';

  @override
  void initState() {
    vehiculoRepository = VehiculoRepositoryImpl();
    _vehiculoBloc = VehiculoBloc(vehiculoRepository)..add(GetVehiculoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _vehiculoBloc,
      child: BlocBuilder<VehiculoBloc, VehiculoState>(
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
                    String disponible = '';
                    if (state.vehiculosResponse.content![index].disponible ==
                        true) {
                      disponible = 'Disponible';
                    } else {
                      disponible = 'No disponible';
                    }

                    return SizedBox(
                        width: 160,
                        height: 250,
                        child: Card(
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          shadowColor: Colors.grey,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 90, left: 10),
                                    child: Text(
                                      '${state.vehiculosResponse.content![index].modelo}',
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: SizedBox(
                                      width: 160,
                                      child: Image.network(
                                        state.vehiculosResponse.content![index]
                                            .imagen!,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                        '${state.vehiculosResponse.content![index].transmision} | ',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 99, 99))),
                                    Text(
                                        '${state.vehiculosResponse.content![index].combustion} | ',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 99, 99))),
                                    Text(disponible,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 99, 99)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 190),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VehiculoDetailsPage(
                                                  uuid: state.vehiculosResponse
                                                      .content![index].id!)),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.colorPrincipal,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 24,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.5),
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
                        ));
                  }),
            );
          } else if (state is GetModelosVehiculosSuccess) {
            return SizedBox(
              child: ListView.builder(
                  itemCount: state.vehiculosModelsResponse.content!.length,
                  itemBuilder: (context, index) {
                    String disponible = '';
                    if (state.vehiculosModelsResponse.content![index]
                            .disponible ==
                        true) {
                      disponible = 'Disponible';
                    } else {
                      disponible = 'No disponible';
                    }

                    return SizedBox(
                        width: 160,
                        height: 250,
                        child: Card(
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          shadowColor: Colors.grey,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 90, left: 10),
                                    child: Text(
                                      '${state.vehiculosModelsResponse.content![index].modelo}',
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: SizedBox(
                                      width: 160,
                                      child: Image.network(
                                        state.vehiculosModelsResponse
                                            .content![index].imagen!,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                        '${state.vehiculosModelsResponse.content![index].transmision} | ',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 99, 99))),
                                    Text(
                                        '${state.vehiculosModelsResponse.content![index].combustion} | ',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 99, 99))),
                                    Text(disponible,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 99, 99)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 190),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VehiculoDetailsPage(
                                                  uuid: state
                                                      .vehiculosModelsResponse
                                                      .content![index]
                                                      .id!)),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.colorPrincipal,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 24,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.5),
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
                        ));
                  }),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
