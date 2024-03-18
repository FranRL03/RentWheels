import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/alquiler/alquiler_bloc.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository.dart';
import 'package:flutter_rent_car/repositories/alquiler/alquiler_repository_impl.dart';
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
          title: const Text('Mis Alquileres'),
          actions: [
            IconButton(
              onPressed: () {
                _showBottomSheet(context);
              }, 
              icon: const Icon(Icons.format_list_bulleted_rounded))
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
          height: 200,
          child: Center(
            child: ListView(
              children: [
                ListTile(
                  title: const Row(
                    children: [
                      Text('Alquileres expirados'),
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
                      Text('Alquileres activos'),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
