import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/register/register_bloc.dart';
import 'package:flutter_rent_car/repositories/auth/auth_repository.dart';
import 'package:flutter_rent_car/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_rent_car/screen/login/login_screen.dart';
import 'package:flutter_rent_car/screen/patatus.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formRegister = GlobalKey<FormState>();
  final userTextController = TextEditingController();
  // final fullNameTextController = TextEditingController();
  final passTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final verifyPassTextController = TextEditingController();
  final telefonoTextController = TextEditingController();
  final pinTextController = TextEditingController();

  late AuthRepository authRepository;
  late RegisterBloc _registerBloc;

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    _registerBloc = RegisterBloc(authRepository);
    super.initState();
  }

  @override
  void dispose() {
    userTextController.dispose();
    passTextController.dispose();
    _registerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _registerBloc,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(28, 38, 73, 1),
        body: BlocConsumer<RegisterBloc, RegisterState>(
          buildWhen: (context, state) {
            return state is RegisterInitial ||
                state is DoRegisterSuccess ||
                state is DoRegisterError ||
                state is DoRegisterLoading;
          },
          builder: (context, state) {
            if (state is DoRegisterError) {
              return const Text('Login error');
            } else if (state is DoRegisterLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(child: _buildRegister());
          },
          listener: (BuildContext context, RegisterState state) {
            if (state is DoRegisterSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyWidget()),
              );
            }
          },
        ),
      ),
    );
  }

  _buildRegister() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 10),
            child: FloatingActionButton.small(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  const Text(
                    'Registrate',
                    style: TextStyle(
                        color: Color.fromRGBO(254, 114, 76, 1),
                        fontWeight: FontWeight.w300,
                        fontSize: 40),
                  ),
                  const Text(
                    'Crea tu cuenta',
                    style: TextStyle(
                        color: Color.fromRGBO(167, 167, 167, 1),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                  Form(
                    key: _formRegister,
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
                            controller: userTextController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Nombre de Usuario',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(
                                          254,
                                          114,
                                          76,
                                          1,
                                        ),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20, right: 20),
                        //   child: TextFormField(
                        //     controller: fullNameTextController,
                        //     decoration: InputDecoration(
                        //         filled: true,
                        //         fillColor: Colors.white,
                        //         border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(10)),
                        //         labelText: 'Nombre completo',
                        //         focusedBorder: OutlineInputBorder(
                        //             borderSide: const BorderSide(
                        //                 color: Color.fromRGBO(
                        //                   254,
                        //                   114,
                        //                   76,
                        //                   1,
                        //                 ),
                        //                 width: 2),
                        //             borderRadius: BorderRadius.circular(10))),
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return 'Please enter some text';
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            controller: emailTextController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Email',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(
                                          254,
                                          114,
                                          76,
                                          1,
                                        ),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
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
                            controller: telefonoTextController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Telefono',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(
                                          254,
                                          114,
                                          76,
                                          1,
                                        ),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
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
                            controller: pinTextController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Pin',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(
                                          254,
                                          114,
                                          76,
                                          1,
                                        ),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
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
                            controller: passTextController,
                            obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Contraseña',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(
                                          254,
                                          114,
                                          76,
                                          1,
                                        ),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some contraseña';
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
                            controller: verifyPassTextController,
                            obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Confirmar contraseña',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(
                                          254,
                                          114,
                                          76,
                                          1,
                                        ),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some contraseña';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 40),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formRegister.currentState!.validate()) {
                                    _registerBloc.add(DoRegisterEvent(
                                        userTextController.text,
                                        // fullNameTextController.text,
                                        emailTextController.text,
                                        passTextController.text,
                                        verifyPassTextController.text,
                                        telefonoTextController.text,
                                        pinTextController.text));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(254, 114, 76, 1),
                                    fixedSize: const Size(303, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.5))),
                                child: const Text(
                                  'Registrarse',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32, top: 26),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '¿Tienes cuenta?',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                },
                                child: const Text('Iniciar sesión',
                                    style: TextStyle(
                                      color: Color.fromRGBO(254, 114, 76, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          Color.fromRGBO(254, 114, 76, 1),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
