import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, top: 40),
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromRGBO(28, 38, 73, 1),
                backgroundImage: AssetImage('assets/images/foto_perfil.png'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Column(
                  children: [
                    Text(
                      'Fran',
                      style: TextStyle(
                          color: Color.fromRGBO(29, 47, 111, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'fran@gmail.com',
                      style: TextStyle(
                          color: Color.fromRGBO(105, 105, 106, 1),
                          fontWeight: FontWeight.w300,
                          fontSize: 15),
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
