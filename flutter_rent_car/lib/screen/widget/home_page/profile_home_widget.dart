import 'package:flutter/material.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';

class ProfileHomeWidget extends StatelessWidget {
  final UserDetails userDetails;
  const ProfileHomeWidget({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    Widget avatarWidget;
    if (userDetails.avatar != null) {
      avatarWidget = CircleAvatar(
        radius: 25,
        backgroundColor: const Color.fromRGBO(28, 38, 73, 1),
        backgroundImage: NetworkImage(userDetails.avatar!),
      );
    } else {
      avatarWidget = const CircleAvatar(
        radius: 25,
        backgroundColor: Color.fromRGBO(28, 38, 73, 1),
        backgroundImage: AssetImage('assets/images/foto_perfil.png'),
      );
    }
    return Column(
      children: [
        Row(
          children: [
            avatarWidget,
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  Text(
                    userDetails.username!.toUpperCase(),
                    style: const TextStyle(
                        color: Color.fromRGBO(29, 47, 111, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userDetails.email!,
                    style: const TextStyle(
                        color: Color.fromRGBO(105, 105, 106, 1), fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
