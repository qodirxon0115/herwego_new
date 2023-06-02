

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "signup_page";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp")
      ),
      body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 55,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: Colors.grey[400],
                  )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 1,
              color: Colors.grey[700],
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 55,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.phone_android_outlined,
                      color: Colors.grey[400],
                    )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 1,
              color: Colors.grey[700],
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 55,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.lock_person_outlined,
                      color: Colors.grey[400],
                    )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 1,
              color: Colors.grey[700],
            ),

            const SizedBox(height: 35,),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 40,
              width: 170,

              child: Center(
                child: ElevatedButton(
                  onPressed: (){},
                  child: const Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20,),
                    ),
                  ),
                )
              ),
            ),
          ]
      ),
    );
  }
}
