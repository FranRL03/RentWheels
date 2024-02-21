import 'package:flutter/material.dart';
import 'package:flutter_food_hub/screen/login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formLogin = GlobalKey<FormState>();
  final userTextController = TextEditingController();
  final passTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          color: Color.fromRGBO(105, 105, 106, 1),
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
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
                              controller: userTextController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  labelText: 'Nombre completo',
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
                              controller: userTextController,
                              decoration: InputDecoration(
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
                              controller: passTextController,
                              obscureText: true,
                              decoration: InputDecoration(
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
                              controller: userTextController,
                              decoration: InputDecoration(
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
                                  return 'Please enter some text';
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
                                  onPressed: () {},
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
      ),
    );
  }
}
