import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/alquiler/alquiler_bloc.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository_impl.dart';
import 'package:flutter_rent_car/variables.dart';

class ListAlquilerCliente extends StatefulWidget {
  const ListAlquilerCliente({super.key});

  @override
  State<ListAlquilerCliente> createState() => _ListAlquilerClienteState();
}

class _ListAlquilerClienteState extends State<ListAlquilerCliente> {
  late AlquilerRepository alquilerRepository;
  late AlquilerBloc _alquilerClienteBloc;

  @override
  void initState() {
    alquilerRepository = AlquilerRepositoryImpl();
    _alquilerClienteBloc = AlquilerBloc(alquilerRepository)
      ..add(GetAlquilerClienteEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _alquilerClienteBloc,
      child: Scaffold(
        body: BlocBuilder<AlquilerBloc, AlquilerState>(
          builder: (context, state) {
            if (state is GetAlquilerClienteError) {
              return const Text('Edit error');
            } else if (state is GetAlquilerClienteSuccess) {
              return SizedBox(
                child: ListView.builder(
                    itemCount: state.alquilerClientesResponse.content!.length,
                    itemBuilder: (context, index) {
                      String disponible = '';
                      if (state.alquilerClientesResponse.content![index]
                              .vehiculo?.disponible ==
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
                                        '${state.alquilerClientesResponse.content![index].vehiculo!.modelo?.modelo}',
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
                                        child: Image.network(state
                                            .alquilerClientesResponse
                                            .content![index]
                                            .vehiculo!
                                            .imagen!),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                          '${state.alquilerClientesResponse.content![index].vehiculo?.transmision} | ',
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 100, 99, 99))),
                                      Text(
                                          '${state.alquilerClientesResponse.content![index].vehiculo?.combustion} | ',
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
                                      // Acción a realizar cuando se presione el botón
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.colorPrincipal,
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
                          ));
                    }),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
