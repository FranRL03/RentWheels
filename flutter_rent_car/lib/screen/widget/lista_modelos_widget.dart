import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/modelos/modelos_bloc.dart';
import 'package:flutter_rent_car/bloc/vehiculo/vehiculo_bloc.dart';
import 'package:flutter_rent_car/repositories/modelos/modelo_repository.dart';
import 'package:flutter_rent_car/repositories/modelos/modelo_repository_impl.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';

class ListModelosWidget extends StatefulWidget {
  const ListModelosWidget({super.key});

  @override
  State<ListModelosWidget> createState() => _ListModelosWidgetState();
}

class _ListModelosWidgetState extends State<ListModelosWidget> {
  late ModeloRepository modeloRepository;
  late VehiculoRepository vehiculoRepository;

  late ModelosBloc _modelosBloc;
  late VehiculoBloc _vehiculoBloc;

  final String nombreModelo = '';

  @override
  void initState() {
    modeloRepository = ModeloRepositorioImpl();
    _modelosBloc = ModelosBloc(modeloRepository)..add(GetModelosEvent());
    vehiculoRepository = VehiculoRepositoryImpl();
    _vehiculoBloc = VehiculoBloc(vehiculoRepository)..add(GetVehiculoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _modelosBloc,
      child: BlocBuilder<ModelosBloc, ModelosState>(
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
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.modeloResponse.content!.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 80,
                        child: InkWell(
                          onTap: () {
                            _vehiculoBloc.add(GetVehiculosModelosEvent(
                                state.modeloResponse.content![index].modelo!));
                          },
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
                                  backgroundImage: NetworkImage(state
                                      .modeloResponse.content![index].logo!),
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
      ),
    );
  }
}
