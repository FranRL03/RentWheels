import 'package:flutter/material.dart';
import 'package:flutter_rent_car/model/response/vehiculos/vehiculo_details_response/vehiculo_details_response.dart';

class VehiculoDetailsWidget extends StatelessWidget {
  final VehiculoDetailsResponse vehiculoDetailsResponse;
  const VehiculoDetailsWidget(
      {super.key, required this.vehiculoDetailsResponse});

  @override
  Widget build(BuildContext context) {
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
                Text(vehiculoDetailsResponse.modelo!.modelo!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30)),
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.network(vehiculoDetailsResponse.imagen!),
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
                  color: Colors.transparent, // Hacer la tarjeta transparente
                  elevation:
                      0, // Agregar una sombra para dar la apariencia de un borde
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(
                          20)) // Establecer un borde negro // Opcional: redondear las esquinas
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Estado',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          vehiculoDetailsResponse.estado!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Card(
                  color: Colors.transparent, // Hacer la tarjeta transparente
                  elevation:
                      0, // Agregar una sombra para dar la apariencia de un borde
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(
                          20)) // Establecer un borde negro // Opcional: redondear las esquinas
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Autonomía',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          '${vehiculoDetailsResponse.autonomia} Km',
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
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
                  color: Colors.transparent, // Hacer la tarjeta transparente
                  elevation:
                      0, // Agregar una sombra para dar la apariencia de un borde
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(
                          20)) // Establecer un borde negro // Opcional: redondear las esquinas
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Capacacidad',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          '${vehiculoDetailsResponse.capacidadPasajeros} pasajeros',
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Card(
                  color: Colors.transparent, // Hacer la tarjeta transparente
                  elevation:
                      0, // Agregar una sombra para dar la apariencia de un borde
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(
                          20)) // Establecer un borde negro // Opcional: redondear las esquinas
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Potencia',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          '${vehiculoDetailsResponse.potencia} cc',
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
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
                  color: Colors.transparent, // Hacer la tarjeta transparente
                  elevation:
                      0, // Agregar una sombra para dar la apariencia de un borde
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(
                          20)) // Establecer un borde negro // Opcional: redondear las esquinas
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Combustible',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          vehiculoDetailsResponse.combustion!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Card(
                  color: Colors.transparent, // Hacer la tarjeta transparente
                  elevation:
                      0, // Agregar una sombra para dar la apariencia de un borde
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(
                          20)) // Establecer un borde negro // Opcional: redondear las esquinas
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Transmisión',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          vehiculoDetailsResponse.transmision!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
