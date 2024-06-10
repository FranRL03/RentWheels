// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rent_car/model/response/user/alquiler_cliente/alquiler_clientes.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CardAlquileresWidget extends StatefulWidget {
  final AlquilerClientesResponse alquilerClientesResponse;
  final int index;
  const CardAlquileresWidget(
      {super.key, required this.alquilerClientesResponse, required this.index});

  @override
  State<CardAlquileresWidget> createState() => _CardAlquileresWidgetState();
}

class _CardAlquileresWidgetState extends State<CardAlquileresWidget> {
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
    String alquilado = '';
    if (widget.alquilerClientesResponse.content![widget.index].vehiculo
            ?.disponible ==
        true) {
      alquilado = 'Alquiler expirado';
    } else {
      alquilado = 'Activo';
    }
    return SizedBox(
        width: 160,
        height: 470,
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
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Text(
                      '${widget.alquilerClientesResponse.content![widget.index].vehiculo!.modelo?.modelo}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: FutureBuilder<Uint8List>(
                      future: fetchImage(widget.alquilerClientesResponse
                          .content![widget.index].vehiculo!.imagen!),
                      builder: (BuildContext context,
                          AsyncSnapshot<Uint8List> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          return Image.memory(snapshot.data!,
                              fit: BoxFit.cover, width: 145);
                        } else {
                          return Text('No image data');
                        }
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(alquilado,
                        style: TextStyle(
                            color: AppColors.colorPrincipal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    const Icon(
                      Icons.check_circle_outline,
                      size: 25,
                      color: Color.fromARGB(255, 13, 136, 76),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.calendar_month,
                            size: 30,
                          ),
                        ),
                        const Text('Fecha de creación: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        Text(
                            widget.alquilerClientesResponse
                                .content![widget.index].fechaCreacion!,
                            style: TextStyle(
                                color: AppColors.colorPrincipal,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.calendar_month,
                              size: 30,
                            ),
                          ),
                          const Text('Inicio del alquiler: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(
                              widget.alquilerClientesResponse
                                  .content![widget.index].fechaInicio!,
                              style: TextStyle(
                                  color: AppColors.colorPrincipal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.calendar_month,
                              size: 30,
                            ),
                          ),
                          const Text('Fin del alquiler: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(
                              widget.alquilerClientesResponse
                                  .content![widget.index].fechaFin!,
                              style: TextStyle(
                                  color: AppColors.colorPrincipal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.pin_drop_outlined,
                              size: 30,
                            ),
                          ),
                          const Text('Origen: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(
                              widget.alquilerClientesResponse
                                  .content![widget.index].origen!,
                              style: TextStyle(
                                  color: AppColors.colorPrincipal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.pin_drop_outlined,
                              size: 30,
                            ),
                          ),
                          const Text('Destino: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Text(
                              widget.alquilerClientesResponse
                                  .content![widget.index].destino!,
                              style: TextStyle(
                                  color: AppColors.colorPrincipal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Precio: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text(
                        '${widget.alquilerClientesResponse.content![widget.index].precio} €/día ',
                        style: TextStyle(
                            color: AppColors.colorPrincipal,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
