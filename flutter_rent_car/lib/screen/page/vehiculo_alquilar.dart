import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/vehiculo/vehiculo_bloc.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';
import 'package:flutter_rent_car/screen/widget/alquiler/formulario_alquiler_widget.dart';
import 'package:flutter_rent_car/screen/widget/vehiculo/vehiculo_details_widget.dart';

class VehiculoAlquilarPage extends StatefulWidget {
  final String uuid;
  const VehiculoAlquilarPage({super.key, required this.uuid});

  @override
  State<VehiculoAlquilarPage> createState() => _VehiculoAlquilarPageState();
}

class _VehiculoAlquilarPageState extends State<VehiculoAlquilarPage> {
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
                    Widget formularioAlquiler;
                    if (state.vehiculoDetailsResponse.disponible == true) {
                      formularioAlquiler = FormAlquiler(
                        uuid: widget.uuid,
                      );
                    } else {
                      formularioAlquiler = const Text('No disponible');
                    }
                    final detalles = state.vehiculoDetailsResponse;
                    return ListView(
                      children: [
                        Column(
                          children: [
                            VehiculoDetailsWidget(
                                vehiculoDetailsResponse: detalles),
                            const Divider(
                              color: Colors.black,
                              thickness: 2,
                              indent: 5,
                              endIndent: 5,
                            ),
                            formularioAlquiler
                            // botonDisponible
                          ],
                        ),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }))));
  }
}
