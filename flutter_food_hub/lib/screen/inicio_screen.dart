import 'package:flutter/material.dart';
import 'package:flutter_food_hub/screen/login/login_screen.dart';
import 'package:flutter_food_hub/screen/login/register_screen.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/inicio_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Padding(
            padding: EdgeInsets.only(top: 140, left: 32),
            child: Text(
              'Bienvenido a',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32),
            child: Text(
              'FOODHUB',
              style: TextStyle(
                color: Color.fromRGBO(254, 114, 76, 1),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32, top: 26),
            child: Text(
              'Tu comida favorita con entrega\n rápida en tu puerta',
              style: TextStyle(
                color: Color.fromRGBO(48, 56, 79, 1),
                fontSize: 18,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 227),
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
        ]),
      ),
    );
  }
}
