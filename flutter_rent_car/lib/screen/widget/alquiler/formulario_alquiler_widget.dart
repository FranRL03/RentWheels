import 'package:flutter/material.dart';
import 'package:flutter_rent_car/model/response/vehiculos/vehiculo_details_response/vehiculo_details_response.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:intl/intl.dart';

class FormAlquiler extends StatefulWidget {
  final String uuid;
  const FormAlquiler({super.key, required this.uuid});

  @override
  State<FormAlquiler> createState() => _FormAlquilerState();
}

class _FormAlquilerState extends State<FormAlquiler> {
  late double _precio = 0.0;

  final _formAlquiler = GlobalKey<FormState>();
  late TextEditingController dateEndTextController = TextEditingController();
  late TextEditingController dateStartTextController = TextEditingController();
  late TextEditingController precioTextController = TextEditingController();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  var _currentSelectedDate = DateTime.now();

  late VehiculoDetailsResponse vehiculoDetailsResponse;
  late VehiculoRepository vehiculoRepository;

  @override
  void initState() {
    super.initState();
    vehiculoRepository = VehiculoRepositoryImpl();
    _loadPrecioBase();
  }

  void _loadPrecioBase() async {
    try {
      vehiculoDetailsResponse =
          await vehiculoRepository.vehiculoDetails(widget.uuid);
      setState(() {
        _precio = vehiculoDetailsResponse.precioBase!;
        precioTextController.text = _precio.toString();
      });
    } catch (e) {
      precioTextController.text = 'Error al cargar el precio';
    }
  }

  void callDatePicker() async {
    var selectedDate = await getDatePickedWidget();
    setState(() {
      _currentSelectedDate = selectedDate!;
      dateEndTextController.text = formatter.format(selectedDate);
      dateStartTextController.text = formatter.format(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formAlquiler,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: dateStartTextController,
                onTap: callDatePicker,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_month_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Desde',
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(28, 38, 73, 1), width: 2),
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some date';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: dateEndTextController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_month_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Hasta',
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(28, 38, 73, 1), width: 2),
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some date';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _precio = (vehiculoDetailsResponse.precioBase! + 0.0);
                        precioTextController.text =
                            '$_precio'; // Cambiar precio // Cambiar tipo de precio
                      });
                    },
                    child: const Text('10000 Km/Año'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _precio = (vehiculoDetailsResponse.precioBase! + 100.0);
                        precioTextController.text =
                            '$_precio'; // Cambiar precio // Cambiar tipo de precio
                      });
                    },
                    child: const Text('20000 Km/Año'),
                  ),
                  // Aquí puedes agregar los demás campos de tu formulario
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _precio = (vehiculoDetailsResponse.precioBase! + 150.0);
                    precioTextController.text = '$_precio'; // Cambiar precio
                  });
                },
                child: const Text('30000 Km/Año'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: precioTextController,
                enabled: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.euro),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Precio',
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(28, 38, 73, 1), width: 2),
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some date';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 100),
              child: ElevatedButton(
                onPressed: () {},
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
            )
          ]),
    );
  }

  Future<DateTime?> getDatePickedWidget() {
    return showDatePicker(
        context: context,
        initialDate: _currentSelectedDate,
        firstDate: DateTime(2017),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        });
  }
}
