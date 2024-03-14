import 'package:flutter/material.dart';
import 'package:flutter_rent_car/model/response/vehiculos/list_vehiculos_response/list_vehiculos_response.dart';
import 'package:flutter_rent_car/screen/page/vehiculo_alquilar.dart';
import 'package:flutter_rent_car/variables.dart';

class CardCocheWidget extends StatelessWidget {
  final ListVehiculosResponse vehiculosResponse;
  final int index;
  const CardCocheWidget(
      {super.key, required this.vehiculosResponse, required this.index});

  @override
  Widget build(BuildContext context) {
    String disponible = '';
                    if (vehiculosResponse.content![index].disponible ==
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
                    padding: const EdgeInsets.only(bottom: 90, left: 10),
                    child: Text(
                      '${vehiculosResponse.content![index].modelo}',
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
                        vehiculosResponse.content![index].imagen!,
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
                        '${vehiculosResponse.content![index].transmision} | ',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 100, 99, 99))),
                    Text(
                        '${vehiculosResponse.content![index].combustion} | ',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 100, 99, 99))),
                    Text(disponible,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 100, 99, 99)))
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
                          builder: (context) => VehiculoAlquilarPage(
                              uuid:
                                  vehiculosResponse.content![index].id!)),
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
  }
}
