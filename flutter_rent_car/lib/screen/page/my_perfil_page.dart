import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/user_details/user_bloc.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/repositories/user/user_repository_impl.dart';
import 'package:flutter_rent_car/screen/login/login_screen.dart';
import 'package:flutter_rent_car/screen/page/alquiler_cliente.dart';
import 'package:flutter_rent_car/screen/page/change_password.dart';
import 'package:flutter_rent_car/screen/page/edit_perfil_page.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyPerfilPage extends StatefulWidget {
  const MyPerfilPage({super.key});

  @override
  State<MyPerfilPage> createState() => _MyPerfilPageState();
}

class _MyPerfilPageState extends State<MyPerfilPage> {
  late UserRepository userRepository;

  late UserBloc _userDetailsBloc;

  @override
  void initState() {
    userRepository = UserRepositoryImpl();
    _userDetailsBloc = UserBloc(userRepository)..add(GetUserDetailsEvent());
    super.initState();
  }

  @override
  void dispose() {
    _userDetailsBloc.close();
    super.dispose();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    // ignore: avoid_print
    print('Token borrado exitosamente.');
  }

  // Future<String?> getToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('token');
  // }

  Future<Map<String, String>> _getHeaders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    return {
      'Authorization': 'Bearer $token',
    };
  }

  Future<ImageProvider> fetchImage(String url) async {
    final headers = await _getHeaders();
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8080/download/$url'), headers: headers);
    if (response.statusCode == 200) {
      return MemoryImage(response.bodyBytes);
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/perfil2.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
        ),
        child: Center(
          child: BlocProvider.value(
            value: _userDetailsBloc,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is DoUserError) {
                    return Column(
                      children: [
                        Text(state.errorMessage),
                      ],
                    );
                  } else if (state is DoUserSuccess) {
                    Widget avatarWidget;
                    if (state.userDetails.avatar != null) {
                      avatarWidget = FutureBuilder<ImageProvider>(
                        future: fetchImage(state.userDetails.avatar!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Failed to load image'));
                          } else {
                            return CircleAvatar(
                              radius: 65,
                              backgroundColor:
                                  const Color.fromRGBO(28, 38, 73, 1),
                              backgroundImage: snapshot.data!,
                            );
                          }
                        },
                      );
                    } else {
                      avatarWidget = const CircleAvatar(
                        radius: 65,
                        backgroundColor: Color.fromRGBO(28, 38, 73, 1),
                        backgroundImage:
                            AssetImage('assets/images/foto_perfil.png'),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Column(
                        children: [
                          avatarWidget,
                          Text(
                            state.userDetails.username!.toUpperCase(),
                            style: const TextStyle(
                                color: Color.fromRGBO(29, 47, 111, 1),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            state.userDetails.email!,
                            style: const TextStyle(
                              color: Color.fromRGBO(105, 105, 106, 1),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "(+34) ${state.userDetails.telefono!}",
                            style: const TextStyle(
                              color: Color.fromRGBO(105, 105, 106, 1),
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EditPerfilPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(29, 47, 111, 1),
                                    fixedSize: const Size(303, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.5))),
                                child: const Text(
                                  'Editar',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ListAlquilerCliente()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(29, 47, 111, 1),
                                    fixedSize: const Size(303, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.5))),
                                child: const Text(
                                  'Mis alquileres',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChangePasswordPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(29, 47, 111, 1),
                                    fixedSize: const Size(303, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.5))),
                                child: const Text(
                                  'Cambiar Contraseña',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 45),
                            child: ElevatedButton(
                                // onPressed: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const LoginScreen()),
                                //   );
                                // },
                                onPressed: () async {
                                  await logout(); // Llama a la función logout para eliminar el token
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushAndRemoveUntil(
                                    // Navega a la pantalla de inicio de sesión y elimina la pila de rutas
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                    (route) => false,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 140, 1, 1),
                                    fixedSize: const Size(303, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.5))),
                                child: const Text(
                                  'Cerrar Sesión',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16),
                                )),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
