

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herewego/pages/home_page.dart';
import 'package:herewego/pages/services/auth_service.dart';
import 'package:herewego/pages/signin_page.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "signup_page";
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var isLoading = false;
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var conPassController = TextEditingController();

  void _doLogin(){

    String fullName = fullNameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String password = passController.text.toString().trim();
    String conPassword = conPassController.text.toString().trim();

    if(fullName.isEmpty || email.isEmpty || password.isEmpty) return;
    if(conPassword != password){
      return;
    }
    setState(() {
      isLoading = true;
    });
    AuthService.signUpUser(fullName, email, password).then((value) => {
      responseSignUp(value!),
    });
  }

  void responseSignUp(User firebaseUser){
    setState(() {
      isLoading = false;
    });
    Navigator.pushReplacementNamed(context, HomePage.id);
  }

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
        child: Stack(
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white54.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: TextField(
                            controller: fullNameController,
                            decoration: InputDecoration(
                                hintText: "Full Name",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.grey[400],
                                )
                            ),
                          ),
                        ),

                        const SizedBox(height: 7,),

                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white54.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.person_2_outlined,
                                  color: Colors.grey[400],
                                )
                            ),
                          ),
                        ),
                        const SizedBox(height: 7,),

                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white54.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: TextField(
                            controller: passController,
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
                        const SizedBox(height: 7,),

                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white54.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: TextField(
                            controller: conPassController,
                            decoration: InputDecoration(
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.lock_person_outlined,
                                  color: Colors.grey[400],
                                )
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: _doLogin,
                          child:   Container(
                              margin: const EdgeInsets.only(left: 20, right: 20),
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Colors.white54.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(7)
                              ),
                              child: const Center(
                                child: Text("Sign Up", style: TextStyle( color: Colors.white, fontSize: 20
                                    ,fontWeight: FontWeight.bold),),
                              )
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("Already have an account?",
                              style: TextStyle(color: Colors.white, fontSize: 18),),
                            const SizedBox(width: 5,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushReplacementNamed(context, SignInPage.id);
                              },
                              child: const Text("Sign In", style:
                              TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),),
                            ),
                            const SizedBox(width: 20,)
                          ],
                        ),
                      ]
                  ),
                ),
              ],
            ),

            isLoading ? const Center(
              child: CircularProgressIndicator(),
            ) : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

}
