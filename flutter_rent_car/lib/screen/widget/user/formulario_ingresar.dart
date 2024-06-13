import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/edit_user/edit_user_bloc.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/repositories/user/user_repository_impl.dart';
import 'package:flutter_rent_car/screen/page/confirm_alquiler_page.dart';

class FormularioIngresar extends StatefulWidget {
  const FormularioIngresar({super.key});

  @override
  State<FormularioIngresar> createState() => _FormularioIngresarState();
}

class _FormularioIngresarState extends State<FormularioIngresar> {
  final _formIngreso = GlobalKey<FormState>();

  late TextEditingController cantidadTextController = TextEditingController();

  late UserRepository userRepository;
  late EditUserBloc _editUserBloc;

  @override
  void initState() {
    userRepository = UserRepositoryImpl();
    _editUserBloc = EditUserBloc(userRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: _editUserBloc,
        child: Scaffold(
            appBar: AppBar(title: const Text('Ingresar Dinero')),
            body: BlocConsumer<EditUserBloc, EditUserState>(
              buildWhen: (context, state) {
                return state is IngresarInitial ||
                    state is DoIngresarSuccess ||
                    state is DoIngresarError ||
                    state is DoIngresarLoading;
              },
              builder: (context, state) {
                if (state is DoIngresarError) {
                  return const Text('Edit error');
                } else if (state is DoIngresarLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Center(child: formIngreso());
              },
              listener: (BuildContext context, EditUserState state) {
                if (state is DoIngresarSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfirmAlquilerPage()),
                  );
                }
              },
            )));
  }

  Widget formIngreso() {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              'Inserte la cantidad que deseas ingresar',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Form(
            key: _formIngreso,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
                child: TextFormField(
                  controller: cantidadTextController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.euro),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Cantidad a ingresar',
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(28, 38, 73, 1), width: 2),
                          borderRadius: BorderRadius.circular(10))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El campo no puede estar vacío';
                    }

                    // if (RegExp(r'^[0-9]+$').hasMatch(value)) {
                    //   return 'El campo solo acepta números';
                    // }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formIngreso.currentState!.validate()) {
                          _editUserBloc.add(DoIngresarEvent(
                            double.tryParse(cantidadTextController.text) ?? 0.0
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(28, 38, 73, 1),
                          fixedSize: const Size(303, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.5))),
                      child: const Text(
                        'Ingresar dinero',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16),
                      )),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
