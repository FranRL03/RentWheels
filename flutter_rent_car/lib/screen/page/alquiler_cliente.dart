import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/alquiler/alquiler_bloc.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository_impl.dart';
import 'package:flutter_rent_car/screen/login/login_screen.dart';
import 'package:flutter_rent_car/screen/page/home_page.dart';
import 'package:flutter_rent_car/screen/widget/alquiler/card_alquileres_widget.dart';

class ListAlquilerCliente extends StatefulWidget {
  const ListAlquilerCliente({super.key});

  @override
  State<ListAlquilerCliente> createState() => _ListAlquilerClienteState();
}

class _ListAlquilerClienteState extends State<ListAlquilerCliente> {
  late AlquilerRepository alquilerRepository;
  late AlquilerBloc _alquilerClienteBloc;
  bool statusAlquiler = false;

  @override
  void initState() {
    alquilerRepository = AlquilerRepositoryImpl();
    _alquilerClienteBloc = AlquilerBloc(alquilerRepository)
      ..add(GetAlquilerClienteEvent(false));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _alquilerClienteBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Alquileres'),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    icon: const Icon(Icons.format_list_bulleted_rounded)))
          ],
        ),
        body: BlocBuilder<AlquilerBloc, AlquilerState>(
          builder: (context, state) {
            if (state is GetAlquilerClienteError) {
              return const Text('Edit error');
            } else if (state is GetAlquilerClienteSuccess) {
              return SizedBox(
                child: ListView.builder(
                    itemCount: state.alquilerClientesResponse.content!.length,
                    itemBuilder: (context, index) {
                      final alquileres = state.alquilerClientesResponse;
                      return CardAlquileresWidget(
                          alquilerClientesResponse: alquileres, index: index);
                    }),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 240,
          child: Center(
            child: ListView(
              children: [
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.car_crash_outlined,
                        size: 30,
                      ),
                      Text(
                        ' Alquileres expirados',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    _alquilerClienteBloc.add(GetAlquilerClienteEvent(false));
                    setState(() {
                      statusAlquiler = false;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.car_rental_outlined,
                        size: 35,
                      ),
                      Text(' Alquileres activos',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  onTap: () {
                    _alquilerClienteBloc.add(GetAlquilerClienteEvent(true));
                    setState(() {
                      statusAlquiler = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.home,
                        size: 25,
                      ),
                      Text(' Inicio',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        size: 25,
                      ),
                      Text(' Cerrar sesión',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
