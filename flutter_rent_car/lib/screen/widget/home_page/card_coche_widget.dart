// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response_v2/list_vehiculos_response_v2.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';
import 'package:flutter_rent_car/screen/page/vehiculo_alquilar.dart';
import 'package:flutter_rent_car/variables.dart';

class CardCocheWidget extends StatelessWidget {
  final List<ListVehiculosResponseV2> vehiculosResponse;
  final int index;
  final VehiculoRepositoryImpl repository;

  const CardCocheWidget(
      {super.key,
      required this.vehiculosResponse,
      required this.index,
      required this.repository});

  @override
  Widget build(BuildContext context) {
    String disponible = '';
    if (vehiculosResponse[index].disponible == true) {
      disponible = 'Disponible';
    } else {
      disponible = 'No disponible';
    }
    return SizedBox(
        width: 160,
        height: 250,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      VehiculoAlquilarPage(uuid: vehiculosResponse[index].id!)),
            );
          },
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 90,),
                      child: Text(
                        '${vehiculosResponse[index].modelo}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    FutureBuilder<Uint8List>(
                      future: repository
                          .fetchImage(vehiculosResponse[index].imagen!),
                      builder: (BuildContext context,
                          AsyncSnapshot<Uint8List> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          return Image.memory(
                            snapshot.data!,
                            fit: BoxFit.cover,
                            width:
                                160
                          );
                        } else {
                          return Text('No image data');
                        }
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text('${vehiculosResponse[index].transmision} | ',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 100, 99, 99))),
                      Text('${vehiculosResponse[index].combustion} | ',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 100, 99, 99))),
                      Text(disponible,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 100, 99, 99)))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Precio base: ${vehiculosResponse[index].precioBase} €/día',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: AppColors.colorPrincipal,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
