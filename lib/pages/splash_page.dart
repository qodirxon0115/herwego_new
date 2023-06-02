
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:herewego/pages/signup_page.dart';

class SplashPage extends StatefulWidget {
  static const String id = "splash_page";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTimer();
  }

  void _initTimer(){
    Timer(const Duration(seconds: 3),(){
      _callNextPage();
    });
  }

  // _callNextPage(){
  //   Navigator.pushReplacementNamed(context, SignUpPage.id);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(193, 53, 132, 1),
              Color.fromRGBO(131, 58, 180, 1),
            ]
          ),
        ),
        child: const Center(
          child: Text("Bis", style: TextStyle(color: Colors.white,
              fontSize: 25, fontWeight: FontWeight.bold),),
        )
      ),
    );
  }
}
