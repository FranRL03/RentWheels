import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/vehiculo/vehiculo_bloc.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';
import 'package:flutter_rent_car/screen/widget/home_page/card_coche_widget.dart';

class ListCocheWidget extends StatefulWidget {
  const ListCocheWidget({super.key});

  @override
  State<ListCocheWidget> createState() => _ListCocheWidgetState();
}

class _ListCocheWidgetState extends State<ListCocheWidget> {

   late VehiculoRepository vehiculoRepository;

   late VehiculoBloc vehiculoBloc;

    @override
  void initState() {
    vehiculoRepository = VehiculoRepositoryImpl();
    vehiculoBloc = VehiculoBloc(vehiculoRepository)..add(GetVehiculoEvent());
    super.initState();
  }

  @override
  void dispose() {
    vehiculoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: vehiculoBloc,
      child: Scaffold(
        body: BlocBuilder<VehiculoBloc, VehiculoState>(
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
                    itemCount: state.vehiculosResponse.content!.length,
                    itemBuilder: (context, index) {
                      final vehiculo = state.vehiculosResponse;
                      return CardCocheWidget(
                          vehiculosResponse: vehiculo, index: index);
                    }));
          } else if (state is GetModelosVehiculosSuccess) {
            return SizedBox(
                child: ListView.builder(
                    itemCount: state.vehiculosModelsResponse.content!.length,
                    itemBuilder: (context, index) {
                      final vehiculo = state.vehiculosModelsResponse;
                      return CardCocheWidget(
                          vehiculosResponse: vehiculo, index: index);
                    }));
          }
          return const Center(child: CircularProgressIndicator());
        })
  ),
  );
  }
}