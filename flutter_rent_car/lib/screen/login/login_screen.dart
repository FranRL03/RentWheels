import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/login/login_bloc.dart';
import 'package:flutter_rent_car/repositories/auth/auth_repository.dart';
import 'package:flutter_rent_car/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_rent_car/screen/login/register_screen.dart';
import 'package:flutter_rent_car/screen/patatus.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formLogin = GlobalKey<FormState>();
  final userTextController = TextEditingController();
  final passTextController = TextEditingController();

  late AuthRepository authRepository;
  late LoginBloc _loginBloc;

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    _loginBloc = LoginBloc(authRepository);
    super.initState();
  }

  @override
  void dispose() {
    userTextController.dispose();
    passTextController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _loginBloc,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(28, 38, 73, 1),
        body: BlocConsumer<LoginBloc, LoginState>(
          buildWhen: (context, state) {
            return state is LoginInitial ||
                state is DoLoginSuccess ||
                state is DoLoginError ||
                state is DoLoginLoading;
          },
          builder: (context, state) {
            if (state is DoLoginError) {
              return const Text('Login error');
            } else if (state is DoLoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(child: _buildForm());
          },
          listener: (BuildContext context, LoginState state) {
            if (state is DoLoginSuccess) {
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

  _buildForm() {
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
                    'Inicio sesión',
                    style: TextStyle(
                        color: Color.fromRGBO(
                          254,
                          114,
                          76,
                          1,
                        ),
                        fontWeight: FontWeight.w300,
                        fontSize: 40),
                  ),
                  const Text(
                    'Bienvenido de vuelta',
                    style: TextStyle(
                        color: Color.fromRGBO(167, 167, 167, 1),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      height: 200, // Altura deseada
                      width: 200, // Anchura deseada
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  Form(
                    key: _formLogin,
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
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 40),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formLogin.currentState!.validate()) {
                                    _loginBloc.add(DoLoginEvent(
                                        userTextController.text,
                                        passTextController.text));
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
                                  'Iniciar sesión',
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
                                '¿No tienes cuenta?',
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
                                            const RegisterScreen()),
                                  );
                                },
                                child: const Text('Registrate',
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
