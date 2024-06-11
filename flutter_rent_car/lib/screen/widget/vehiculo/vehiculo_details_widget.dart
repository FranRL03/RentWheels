// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rent_car/model/response/vehiculos/vehiculo_details_response/vehiculo_details_response.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VehiculoDetailsWidget extends StatelessWidget {
  final VehiculoDetailsResponse vehiculoDetailsResponse;
  const VehiculoDetailsWidget(
      {super.key, required this.vehiculoDetailsResponse});

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Uint8List> fetchImage(String filename) async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse('$urlMovil/download/$filename'), // Ajusta la URL según tu API
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }

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
                FutureBuilder<Uint8List>(
                  future: fetchImage(vehiculoDetailsResponse.imagen!),
                  builder: (BuildContext context,
                      AsyncSnapshot<Uint8List> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Image.memory(snapshot.data!,
                          fit: BoxFit.cover, width: 300);
                    } else {
                      return Text('No image data');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: Card(
                  color: Colors.transparent, // Hacer la tarjeta transparente
                  elevation:
                      0, // Agregar una sombra para dar la apariencia de un borde
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          'Precio',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          '${vehiculoDetailsResponse.precioBase} €',
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
