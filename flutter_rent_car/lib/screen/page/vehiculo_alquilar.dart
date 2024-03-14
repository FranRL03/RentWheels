import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/vehiculo/vehiculo_bloc.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';
import 'package:flutter_rent_car/screen/widget/vehiculo/vehiculo_details_widget.dart';
import 'package:flutter_rent_car/variables.dart';

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
                    Widget botonDisponible;
                    if (state.vehiculoDetailsResponse.disponible == true) {
                      botonDisponible = Padding(
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
                      botonDisponible = Padding(
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
                    final detalles = state.vehiculoDetailsResponse;
                    return ListView(
                      children: [
                        Column(
                          children: [
                            VehiculoDetailsWidget(vehiculoDetailsResponse: detalles),
                            const Divider(
                              color: Colors.black,
                              thickness: 2,
                              indent: 5,
                              endIndent: 5,
                            ),
                            botonDisponible
                          ],
                        ),
                      ],
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }))));
  }
}
