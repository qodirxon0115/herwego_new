

import 'package:flutter/material.dart';
import 'package:herewego/pages/services/auth_service.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase"),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: (){
            AuthService.signOutUser(context);
          },
          child: const Text("Log Out"),
        ),
      ),
    );
  }
}
