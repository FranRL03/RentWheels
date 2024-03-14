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

  @override
  void initState() {
    alquilerRepository = AlquilerRepositoryImpl();
    _alquilerClienteBloc = AlquilerBloc(alquilerRepository)
      ..add(GetAlquilerClienteEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _alquilerClienteBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Mis Alquileres')),
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
}
