import 'package:flutter/material.dart';
import 'package:flutter_rent_car/bloc/vehiculo/vehiculo_bloc.dart';
import 'package:flutter_rent_car/model/response/modelo/modelo_response_v2/modelo_response_v2.dart';

class CardModeloWidget extends StatelessWidget {
  final List<ModeloResponseV2> modeloResponse;
  final int index;
  final VehiculoBloc vehiculoBloc;
  const CardModeloWidget(
      {super.key,
      required this.modeloResponse,
      required this.index,
      required this.vehiculoBloc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: InkWell(
        onTap: () {
          vehiculoBloc.add(
              GetVehiculosModelosEvent(modeloResponse[index].modelo!));
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
                backgroundColor: const Color.fromARGB(255, 119, 133, 187),
                backgroundImage:
                    NetworkImage(modeloResponse[index].logo!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
