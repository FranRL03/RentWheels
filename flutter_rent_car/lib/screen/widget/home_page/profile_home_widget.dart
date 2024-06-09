import 'package:flutter/material.dart';
import 'package:flutter_rent_car/model/response/user/user_details.dart';
import 'package:flutter_rent_car/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileHomeWidget extends StatelessWidget {
  final UserDetails userDetails;
  const ProfileHomeWidget({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    Future<Map<String, String>> getHeaders() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");
      return {
        'Authorization': 'Bearer $token',
      };
    }

    Future<ImageProvider> fetchImage(String url) async {
      final headers = await getHeaders();
      final response = await http.get(
          Uri.parse('http://$urlMovil/download/$url'),
          headers: headers);
      if (response.statusCode == 200) {
        return MemoryImage(response.bodyBytes);
      } else {
        throw Exception('Failed to load image');
      }
    }

    Widget avatarWidget;
    if (userDetails.avatar != null) {
      avatarWidget = FutureBuilder<ImageProvider>(
        future: fetchImage(userDetails.avatar!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load image'));
          } else {
            return CircleAvatar(
              radius: 25,
              backgroundColor: const Color.fromRGBO(28, 38, 73, 1),
              backgroundImage: snapshot.data!
            );
          }
        },
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
