import 'package:flutter/material.dart';
import 'package:flutter_rent_car/variables.dart';

class VehiculoDetailsPage extends StatelessWidget {
  const VehiculoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  const Text('Ford Mustang',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Image.asset('assets/images/cars.png'),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 30),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: Card(
                    color: Colors.transparent, // Hacer la tarjeta transparente
                    elevation:
                        0, // Agregar una sombra para dar la apariencia de un borde
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(
                            20)) // Establecer un borde negro // Opcional: redondear las esquinas
                        ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Estado',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'Nuevo',
                            style: TextStyle(
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
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(
                            20)) // Establecer un borde negro // Opcional: redondear las esquinas
                        ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Autonomía',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            '30000 Km',
                            style: TextStyle(
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
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 30),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: Card(
                    color: Colors.transparent, // Hacer la tarjeta transparente
                    elevation:
                        0, // Agregar una sombra para dar la apariencia de un borde
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(
                            20)) // Establecer un borde negro // Opcional: redondear las esquinas
                        ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Capacacidad',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            '5 pasajeros',
                            style: TextStyle(
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
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(
                            20)) // Establecer un borde negro // Opcional: redondear las esquinas
                        ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Potencia',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            '280 Kw',
                            style: TextStyle(
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
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 30),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: Card(
                    color: Colors.transparent, // Hacer la tarjeta transparente
                    elevation:
                        0, // Agregar una sombra para dar la apariencia de un borde
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(
                            20)) // Establecer un borde negro // Opcional: redondear las esquinas
                        ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Combustible',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'Gasolina',
                            style: TextStyle(
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
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(
                            20)) // Establecer un borde negro // Opcional: redondear las esquinas
                        ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Transmisión',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'Manual',
                            style: TextStyle(
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
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
              },
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
          ),
        ],
      ),
    );
  }
}
