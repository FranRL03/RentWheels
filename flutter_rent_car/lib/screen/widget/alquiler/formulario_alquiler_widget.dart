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

  // late TextEditingController kilomettrosTextController =
  //     TextEditingController(text: '10000');
  late TextEditingController dateEndTextController = TextEditingController();
  late TextEditingController dateStartTextController = TextEditingController();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  var _currentSelectedDate = DateTime.now();
  var _selecteEnd = DateTime.now();

  late AlquilerBloc _alquilerBloc;
  late AlquilerRepository alquilerRepository;
  late VehiculoDetailsResponse vehiculoDetailsResponse;
  late VehiculoRepository vehiculoRepository;

  // List lista = ['10000', '20000', '30000'];
  // String dropdownValue = '10000';

  @override
  void initState() {
    super.initState();
    alquilerRepository = AlquilerRepositoryImpl();
    _alquilerBloc = AlquilerBloc(alquilerRepository);
    vehiculoRepository = VehiculoRepositoryImpl();
    // _loadPrecioBase();
  }

  // void _loadPrecioBase() async {
  //   try {
  //     vehiculoDetailsResponse =
  //         await vehiculoRepository.vehiculoDetails(widget.uuid);
  //     setState(() {
  //       _precio = vehiculoDetailsResponse.precioBase!;
  //       precioTextController.text = _precio.toString();
  //     });
  //   } catch (e) {
  //     precioTextController.text = 'Error al cargar el precio';
  //   }
  // }

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
              state is DoAlquilerSuccess ||
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
        // listenWhen: (context, state) {
        //   return state is DoAlquilerSuccess;
        // },
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
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('¿Quieres alquilar?', style: TextStyle(fontSize: 25),),
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
                    labelText: 'Fecha inicio',
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
                    labelText: 'Fecha fin',
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
            const Text('*Por cada semana alquilada suma 25€*', style: TextStyle(color: Colors.red, fontSize: 16),),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: dateEndTextController,
                // onTap: callDatePickerEnd,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.pin_drop),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Origen',
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
                // onTap: callDatePickerEnd,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.pin_drop),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Destino',
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
          ]),
    );
  }

  Future<DateTime?> getDatePickedWidget() {
    return showDatePicker(
        context: context,
        initialDate: _currentSelectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        });
  }

  Future<DateTime?> getDatePickedEnd() {
    return showDatePicker(
        context: context,
        initialDate: _selecteEnd,
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        });
  }
}
