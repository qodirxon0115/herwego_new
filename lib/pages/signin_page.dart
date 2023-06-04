
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herewego/pages/home_page.dart';
import 'package:herewego/pages/services/auth_service.dart';
import 'package:herewego/pages/signup_page.dart';

class SignInPage extends StatefulWidget {
  static const String id = "signin_page";
  const SignInPage({Key? key}) : super(key: key);


  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var isLoading = false;
  var emailController = TextEditingController();
  var passController = TextEditingController();

  void _callSingUpPage(){
    Navigator.pushReplacementNamed(context, SignUpPage.id);
  }

  void _doLogin(){
    String email = emailController.text.toString().trim();
    String password = passController.text.toString().trim();
    if(email.isEmpty || password.isEmpty) return;

    setState(() {
      isLoading = true;
    });
    AuthService.signInUser(email, password).then((value) => {
      responseSingIn(value!),
    });

    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  void responseSingIn(User firebaseUser) async{
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
                            controller: emailController,
                            style: const TextStyle(color: Colors.white),
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
                            style: const TextStyle(color: Colors.white),
                            controller: passController,
                            obscureText: true,
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
                                child: Text("Sign In", style: TextStyle( color: Colors.white, fontSize: 20
                                    ,fontWeight: FontWeight.bold),),
                              )
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("Don't have an account?", style: TextStyle(
                                color: Colors.white, fontSize: 18),),
                            const SizedBox(width: 5,),
                            GestureDetector(
                              onTap: _callSingUpPage,
                              child: const Text("Sign Up", style: TextStyle(
                                  color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),),
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
