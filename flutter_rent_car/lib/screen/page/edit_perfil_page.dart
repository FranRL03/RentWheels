import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/edit_user/edit_user_bloc.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/repositories/user/user_repository_impl.dart';
import 'package:flutter_rent_car/screen/page/home_page.dart';
import 'package:image_picker/image_picker.dart';

class EditPerfilPage extends StatefulWidget {
  const EditPerfilPage({super.key});

  @override
  State<EditPerfilPage> createState() => _EditPerfilPageState();
}

class _EditPerfilPageState extends State<EditPerfilPage> {
  final _formEdit = GlobalKey<FormState>();

  late TextEditingController userTextController = TextEditingController();
  late TextEditingController avatarTextController = TextEditingController();
  late TextEditingController emailTextController = TextEditingController();
  late TextEditingController telefonoTextController = TextEditingController();
  late TextEditingController pinTextController = TextEditingController();

  File? _avatar;

  late UserRepository userRepository;
  late EditUserBloc _editUserBloc;
  late UserDetails userDetails;

  @override
  void initState() {
    userRepository = UserRepositoryImpl();
    _editUserBloc = EditUserBloc(userRepository);

    _loadUserData();
    super.initState();
  }

  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _avatar = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _loadUserData() async {
    try {
      userDetails = await userRepository.userDetails();
      // Actualiza los controladores de texto con los datos del usuario
      setState(() {
        userTextController.text = userDetails.username ?? '';
        // _avatar;
        // avatarTextController.text = userDetails.avatar ?? '';
        emailTextController.text = userDetails.email ?? '';
        telefonoTextController.text = userDetails.telefono ?? '';
        pinTextController.text = userDetails.pin ?? '';
      });
    } catch (e) {
      // ignore: avoid_print
      print("Error cargando los datos del usuario: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _editUserBloc,
      child: Scaffold(
        body: BlocConsumer<EditUserBloc, EditUserState>(
          buildWhen: (context, state) {
            return state is EditUserInitial ||
                state is DoEditUserSuccess ||
                state is DoEditUserError ||
                state is DoEditUserLoading;
          },
          builder: (context, state) {
            if (state is DoEditUserError) {
              return const Text('Edit error');
            } else if (state is DoEditUserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(child: _buildEdit());
          },
          listener: (BuildContext context, EditUserState state) {
            if (state is DoEditUserSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          },
        ),
      ),
    );
  }

  _buildEdit() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 13),
              child: Column(
                children: [
                  const Text(
                    'Editar Perfil',
                    style: TextStyle(
                        color: Color.fromRGBO(28, 38, 73, 1),
                        fontWeight: FontWeight.w300,
                        fontSize: 40),
                  ),
                  const Text(
                    'Edita tus datos',
                    style: TextStyle(
                        color: Color.fromRGBO(105, 105, 106, 1),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                  Form(
                    key: _formEdit,
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
                            enabled: false,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Nombre del Usuario',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(28, 38, 73, 1),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20, right: 20),
                        //   child: TextFormField(
                        //     controller: avatarTextController,
                        //     decoration: InputDecoration(
                        //         filled: true,
                        //         fillColor: Colors.white,
                        //         border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(10)),
                        //         labelText: 'Avatar del Usuario',
                        //         focusedBorder: OutlineInputBorder(
                        //             borderSide: const BorderSide(
                        //                 color: Color.fromRGBO(28, 38, 73, 1),
                        //                 width: 2),
                        //             borderRadius: BorderRadius.circular(10))),
                        //   ),
                        // ),
                        if (_avatar != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Image.file(_avatar!),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            onPressed: _pickImage,
                            child: const Text('Seleccionar Imagen'),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                                        color: Color.fromRGBO(28, 38, 73, 1),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10))),
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
                                        color: Color.fromRGBO(28, 38, 73, 1),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            controller: pinTextController,
                            obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Pin',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(28, 38, 73, 1),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formEdit.currentState!.validate()) {
                                    _editUserBloc.add(DoEditUserEvent(
                                      // avatarTextController.text,
                                      _avatar!,
                                      emailTextController.text,
                                      telefonoTextController.text,
                                      pinTextController.text,
                                    ));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(28, 38, 73, 1),
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
