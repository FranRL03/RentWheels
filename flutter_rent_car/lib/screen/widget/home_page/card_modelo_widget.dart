import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rent_car/bloc/vehiculo/vehiculo_bloc.dart';
import 'package:flutter_rent_car/model/response/modelo/modelo_response_v2/modelo_response_v2.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CardModeloWidget extends StatelessWidget {
  final List<ModeloResponseV2> modeloResponse;
  final int index;
  final VehiculoBloc vehiculoBloc;
  const CardModeloWidget(
      {super.key,
      required this.modeloResponse,
      required this.index,
      required this.vehiculoBloc});

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Map<String, String>> _getHeaders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    return {
      'Authorization': 'Bearer $token',
    };
  }

  Future<ImageProvider> fetchImage(String url) async {
    final headers = await _getHeaders();
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8080/download/$url'), headers: headers);
    if (response.statusCode == 200) {
      return MemoryImage(response.bodyBytes);
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: InkWell(
        onTap: () {
          vehiculoBloc
              .add(GetVehiculosModelosEvent(modeloResponse[index].modelo!));
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
              child: FutureBuilder<ImageProvider>(
                future: fetchImage(modeloResponse[index].logo!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Failed to load image'));
                  } else {
                    return CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color.fromARGB(255, 119, 133, 187),
                      backgroundImage: MemoryImage(snapshot.data! as Uint8List),
                    );
                  }
                },
              ),
              // FutureBuilder<Uint8List>(
              //   future: fetchImage(modeloResponse[index].logo!),
              //   builder:
              //       (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const CircularProgressIndicator();
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else if (snapshot.hasData) {
              //       return CircleAvatar(
              //         radius: 30,
              //         backgroundColor: const Color.fromARGB(255, 119, 133, 187),
              //         backgroundImage: MemoryImage(snapshot.data!),
              //       );
              //     } else {
              //       return const Text('No image data');
              //     }
              //   },
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
