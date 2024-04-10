import 'package:flutter/material.dart';
import 'package:flutter_rent_car/model/response/user/alquiler_cliente/alquiler_clientes.dart';
import 'package:flutter_rent_car/variables.dart';

class CardAlquileresWidget extends StatefulWidget {
  final AlquilerClientesResponse alquilerClientesResponse;
  final int index;
  const CardAlquileresWidget(
      {super.key, required this.alquilerClientesResponse, required this.index});

  @override
  State<CardAlquileresWidget> createState() => _CardAlquileresWidgetState();
}

class _CardAlquileresWidgetState extends State<CardAlquileresWidget> {
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
        height: 370,
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
                    child: Row(
                      children: [
                        SizedBox(
                          width: 145,
                          child: Image.network(widget.alquilerClientesResponse
                              .content![widget.index].vehiculo!.imagen!),
                        ),
                      ],
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
                                fontSize: 18)),
                        const Icon(
                          Icons.check_circle_outline,
                          size: 20,
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
                        const Text('Inicio del alquiler: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Text(
                            widget.alquilerClientesResponse
                                .content![widget.index].fechaInicio!,
                            style: TextStyle(
                                color: AppColors.colorPrincipal,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          const Text('Fin del alquiler: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Text(
                              widget.alquilerClientesResponse
                                  .content![widget.index].fechaFin!,
                              style: TextStyle(
                                  color: AppColors.colorPrincipal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          const Text('Kilometros alquilados: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Text(
                              '${widget.alquilerClientesResponse.content![widget.index].kilometrosAnos} Km/año ',
                              style: TextStyle(
                                  color: AppColors.colorPrincipal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
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
                            fontSize: 18)),
                    Text(
                        '${widget.alquilerClientesResponse.content![widget.index].precio} € ',
                        style: TextStyle(
                            color: AppColors.colorPrincipal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
