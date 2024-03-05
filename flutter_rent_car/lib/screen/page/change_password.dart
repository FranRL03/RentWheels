import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rent_car/bloc/user_details/change_password/change_password_bloc.dart';
import 'package:flutter_rent_car/repositories/user/user_repository.dart';
import 'package:flutter_rent_car/repositories/user/user_repository_impl.dart';
import 'package:flutter_rent_car/screen/login/login_screen.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends State<ChangePasswordPage> {

  final _formChangePassword = GlobalKey<FormState>();

  final oldPasswordTextController = TextEditingController();
  final newPasswordTextController = TextEditingController();
  final verifyPasswordTextController = TextEditingController();
 
  late UserRepository userRepository;
  late ChangePasswordBloc _changePasswordBloc;

   @override
  void initState() {
    userRepository = UserRepositoryImpl();
    _changePasswordBloc = ChangePasswordBloc(userRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _changePasswordBloc,
      child: Scaffold(
        body: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
          buildWhen: (context, state) {
            return state is ChangePasswordInitial ||
                state is DoChangePasswordSuccess ||
                state is DoChangePasswordError ||
                state is DoChangePasswordLoading;
          },
          builder: (context, state) {
            if (state is DoChangePasswordError) {
              return const Text('Edit error');
            } else if (state is DoChangePasswordLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(child: _buildChangePassword());
          },
          listener: (BuildContext context, ChangePasswordState state) {
            if (state is DoChangePasswordSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            }
          },
        ),
      ),
    );
  }

  _buildChangePassword() {
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
                    'Cambiar Contraseña',
                    style: TextStyle(
                        color: Color.fromRGBO(28, 38, 73, 1),
                        fontWeight: FontWeight.w300,
                        fontSize: 35),
                  ),
                  const Text(
                    'Cambia tu contraseña',
                    style: TextStyle(
                        color: Color.fromRGBO(105, 105, 106, 1),
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                  Form(
                    key: _formChangePassword,
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
                            controller: oldPasswordTextController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Antigua Contraseña',
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
                            controller: newPasswordTextController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Nueva Contraseña',
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
                            controller: verifyPasswordTextController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Verificar contraseña',
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
                                  if (_formChangePassword.currentState!.validate()) {
                                    _changePasswordBloc.add(DoChangePasswordEvent(
                                        oldPasswordTextController.text,
                                        newPasswordTextController.text,
                                        verifyPasswordTextController.text,
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
                                  'Cambiar contraseña',
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