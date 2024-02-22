import 'package:flutter/material.dart';
import 'package:flutter_food_hub/screen/login/login_screen.dart';
import 'package:flutter_food_hub/screen/login/register_screen.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                      backgroundColor: const Color.fromRGBO(254, 114, 76, 1),
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
                      backgroundColor: const Color.fromRGBO(254, 114, 76, 1),
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
    );
  }
}
