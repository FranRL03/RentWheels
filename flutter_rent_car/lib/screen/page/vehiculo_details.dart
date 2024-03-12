import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/vehiculo/vehiculo_bloc.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';
import 'package:flutter_rent_car/variables.dart';

class VehiculoDetailsPage extends StatefulWidget {
  final String uuid;
  const VehiculoDetailsPage({super.key, required this.uuid});

  @override
  State<VehiculoDetailsPage> createState() => _VehiculoDetailsPageState();
}

class _VehiculoDetailsPageState extends State<VehiculoDetailsPage> {
  late VehiculoRepository vehiculoRepository;
  late VehiculoBloc _vehiculoBloc;

  @override
  void initState() {
    vehiculoRepository = VehiculoRepositoryImpl();
    _vehiculoBloc = VehiculoBloc(vehiculoRepository)
      ..add(GetVehiculoDetailsEvent(widget.uuid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: BlocProvider.value(
                value: _vehiculoBloc,
                child: BlocBuilder<VehiculoBloc, VehiculoState>(
                    builder: (context, state) {
                  if (state is GetVehiculoError) {
                    return Column(
                      children: [Text(state.errorMessage)],
                    );
                  } else if (state is GetVehiculoDetailsSuccess) {
                    Widget botonDisponible;
                    if (state.vehiculoDetailsResponse.disponible == true) {
                      botonDisponible =  Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.colorPrincipal,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 54,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.5),
                                    ),
                                  ),
                                  child: const Text(
                                    'Alquilar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              );
                    } else {
                      botonDisponible =  Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 54,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.5),
                                    ),
                                  ),
                                  child: const Text(
                                    'Alquilar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              );
                    }
                    return Column(
                      children: [
                        Card(
                          margin: EdgeInsets.zero,
                          color: const Color.fromRGBO(242, 242, 242, 1),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.arrow_back),
                                      tooltip: 'back',
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                                Text(
                                    state.vehiculoDetailsResponse.modelo!
                                        .modelo!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                                SizedBox(
                                  height: 250,
                                  width: 250,
                                  child: Image.network(
                                      state.vehiculoDetailsResponse.imagen!),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 30),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: Card(
                                  color: Colors
                                      .transparent, // Hacer la tarjeta transparente
                                  elevation:
                                      0, // Agregar una sombra para dar la apariencia de un borde
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              20)) // Establecer un borde negro // Opcional: redondear las esquinas
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Estado',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          state.vehiculoDetailsResponse.estado!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Card(
                                  color: Colors
                                      .transparent, // Hacer la tarjeta transparente
                                  elevation:
                                      0, // Agregar una sombra para dar la apariencia de un borde
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              20)) // Establecer un borde negro // Opcional: redondear las esquinas
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Autonomía',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          '${state.vehiculoDetailsResponse.autonomia} Km',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 30),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: Card(
                                  color: Colors
                                      .transparent, // Hacer la tarjeta transparente
                                  elevation:
                                      0, // Agregar una sombra para dar la apariencia de un borde
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              20)) // Establecer un borde negro // Opcional: redondear las esquinas
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Capacacidad',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          '${state.vehiculoDetailsResponse.capacidadPasajeros} pasajeros',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Card(
                                  color: Colors
                                      .transparent, // Hacer la tarjeta transparente
                                  elevation:
                                      0, // Agregar una sombra para dar la apariencia de un borde
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              20)) // Establecer un borde negro // Opcional: redondear las esquinas
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Potencia',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          '${state.vehiculoDetailsResponse.potencia} cc',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 30),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: Card(
                                  color: Colors
                                      .transparent, // Hacer la tarjeta transparente
                                  elevation:
                                      0, // Agregar una sombra para dar la apariencia de un borde
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              20)) // Establecer un borde negro // Opcional: redondear las esquinas
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Combustible',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          state.vehiculoDetailsResponse
                                              .combustion!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Card(
                                  color: Colors
                                      .transparent, // Hacer la tarjeta transparente
                                  elevation:
                                      0, // Agregar una sombra para dar la apariencia de un borde
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              20)) // Establecer un borde negro // Opcional: redondear las esquinas
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Transmisión',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          state.vehiculoDetailsResponse
                                              .transmision!,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        botonDisponible
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }))));
  }
}
