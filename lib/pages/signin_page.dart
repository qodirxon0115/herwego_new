
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static const String id = "signin_page";
  const SignInPage({Key? key}) : super(key: key);


  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn", style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("HereWe Go", style: TextStyle(color: Colors.black, fontSize: 162),)
          ],
        ),
      ),
    );
  }
}
