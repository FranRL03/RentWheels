import 'package:flutter/material.dart';
import 'package:flutter_rent_car/screen/login/login_screen.dart';
import 'package:flutter_rent_car/screen/login/register_screen.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 38, 73, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset('assets/images/logo.png'),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(254, 114, 76, 1),
                          fixedSize: const Size(303, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.5))),
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 29),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(254, 114, 76, 1),
                          fixedSize: const Size(303, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.5))),
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
