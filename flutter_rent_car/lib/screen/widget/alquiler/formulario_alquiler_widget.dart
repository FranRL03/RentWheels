import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/alquiler/alquiler_bloc.dart';
import 'package:flutter_rent_car/model/response/vehiculos/vehiculo_details_response/vehiculo_details_response.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository_impl.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository.dart';
import 'package:flutter_rent_car/repositories/vehiculos/vehiculos_repository_impl.dart';
import 'package:flutter_rent_car/screen/page/home_page.dart';
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

  late TextEditingController kilomettrosTextController =
      TextEditingController(text: '10000');
  late TextEditingController dateEndTextController = TextEditingController();
  late TextEditingController dateStartTextController = TextEditingController();
  late TextEditingController precioTextController = TextEditingController();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  var _currentSelectedDate = DateTime.now();
  var _selecteEnd = DateTime.now();

  late AlquilerBloc _alquilerBloc;
  late AlquilerRepository alquilerRepository;
  late VehiculoDetailsResponse vehiculoDetailsResponse;
  late VehiculoRepository vehiculoRepository;

  List lista = ['10000', '20000', '30000'];
   String dropdownValue = '10000';

  @override
  void initState() {
    super.initState();
    alquilerRepository = AlquilerRepositoryImpl();
    _alquilerBloc = AlquilerBloc(alquilerRepository);
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

  void callDatePickerStart() async {
    var selectedDate = await getDatePickedWidget();
    if (selectedDate != null) {
      setState(() {
        _currentSelectedDate = selectedDate;
        dateStartTextController.text = formatter.format(selectedDate);
      });
    }
  }

  void callDatePickerEnd() async {
    var selectedDate = await getDatePickedEnd();
    if (selectedDate != null) {
      setState(() {
        _selecteEnd = selectedDate;
        dateEndTextController.text = formatter.format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _alquilerBloc,
      child: BlocConsumer<AlquilerBloc, AlquilerState>(
        buildWhen: (context, state) {
          return state is AlquilerInitial ||
              state is! DoAlquilerSuccess ||
              state is DoAlquilerError ||
              state is DoAlquilerLoading;
        },
        builder: (context, state) {
          if (state is DoAlquilerError) {
            return const Text('Alquiler Error');
          } else if (state is DoAlquilerLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildAlquiler();
        },
        listenWhen: (context, state) {
          return state is DoAlquilerSuccess;
        },
        listener: (BuildContext context, AlquilerState state) {
          if (state is DoAlquilerSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
      ),
    );
  }

  _buildAlquiler() {
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
                onTap: callDatePickerStart,
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
                onTap: callDatePickerEnd,
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
            // DropdownButtonFormField(
            //   items: lista.map((e){
            //     return DropdownMenuItem(value: e,child: Text(e),);
            //   }).toList(),
            //   onChanged: (value) {
            //     if (value == '10000') {
            //       setState(() {
            //             _precio = (vehiculoDetailsResponse.precioBase! + 0.0);
            //             precioTextController.text = '$_precio';
            //             kilomettrosTextController.text = '10000';
            //           });
            //     } else if (value == '20000') {
            //       setState(() {
            //             _precio = (vehiculoDetailsResponse.precioBase! + 100.0);
            //             precioTextController.text = '$_precio';
            //             kilomettrosTextController.text = '20000';
            //           });
            //     } else {
            //       setState(() {
            //             _precio = (vehiculoDetailsResponse.precioBase! + 150.0);
            //             precioTextController.text = '$_precio';
            //             kilomettrosTextController.text = '30000';
            //           });
            //     }
            //   }),
            // DropdownButtonFormField(
            //   value: dropdownValue,
            //   items: lista.map((e) {
            //     return DropdownMenuItem(
            //       value: e,
            //       child: Text(e),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       dropdownValue = value.toString();
            //       if (dropdownValue == '10000') {
            //         _precio = (vehiculoDetailsResponse.precioBase! + 0.0);
            //         kilomettrosTextController.text = '10000';
            //       } else if (dropdownValue == '20000') {
            //         _precio = (vehiculoDetailsResponse.precioBase! + 100.0);
            //         kilomettrosTextController.text = '20000';
            //       } else {
            //         _precio = (vehiculoDetailsResponse.precioBase! + 150.0);
            //         kilomettrosTextController.text = '30000';
            //       }
            //       precioTextController.text = _precio.toString();
            //     });
            //   },
            // ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: precioTextController,
                // enabled: false,
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: kilomettrosTextController,
                // enabled: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.car_crash_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Kilometros/Año',
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(28, 38, 73, 1), width: 2),
                        borderRadius: BorderRadius.circular(10))),
                validator: (value) {
                  // ignore: unrelated_type_equality_checks
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
                onPressed: () {
                  if (_formAlquiler.currentState!.validate()) {
                    _alquilerBloc.add(DoAlquilerEvent(
                       int.parse(kilomettrosTextController.text),
                        dateStartTextController.text,
                        dateEndTextController.text,
                        double.parse(precioTextController.text),
                        widget.uuid));
                  }
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

  Future<DateTime?> getDatePickedEnd() {
    return showDatePicker(
        context: context,
        initialDate: _selecteEnd,
        firstDate: DateTime(2017),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        });
  }
}
