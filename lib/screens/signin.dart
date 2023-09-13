import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasesignin/colors/color_utils.dart';
import 'package:firebasesignin/reusablewidgets/buttons.dart';
import 'package:firebasesignin/reusablewidgets/logo.dart';
import 'package:firebasesignin/reusablewidgets/textfield.dart';
import 'package:firebasesignin/screens/homescreen.dart';
import 'package:firebasesignin/screens/signup.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

TextEditingController _passwordTextController = TextEditingController();
TextEditingController _emailTextController = TextEditingController();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                hexStringToColor("CB2893"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4"),
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,
            MediaQuery.of(context).size.width *0.2,20,0),
            child: Column(
              children: [
                logoWidget("assets/images/logo1.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter User Name",Icons.person_outline,false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password",Icons.lock,true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, (){
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value)  {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }).onError((error, stackTrace) {
                    print('Error ${error.toString()}');
                  });
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't Have an Account",
        style: TextStyle(
          color: Colors.white60
        ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> const SignUpScreen()));
          },
          child: const Text("sign Up",
          style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.bold
          ),),
        ),
      ],
    );
  }
}

