import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasesignin/colors/color_utils.dart';
import 'package:firebasesignin/reusablewidgets/buttons.dart';
import 'package:firebasesignin/reusablewidgets/textfield.dart';
import 'package:firebasesignin/screens/homescreen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController _passwordTextController = TextEditingController();
TextEditingController _emailTextController = TextEditingController();
TextEditingController _usernameTextController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  const Text(''
            'Sign Up',
        style: TextStyle(
          fontSize: 24,fontWeight: FontWeight.bold
        ),
        ),
      ),
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
    const SizedBox(
    height: 30,
    ),
    reusableTextField("Enter User Name",Icons.person_outline,false,
    _usernameTextController),
    const SizedBox(
    height: 20,
    ),
    reusableTextField("Enter email ",Icons.email,true,
    _emailTextController),
    const SizedBox(
    height: 20,
    ),
    reusableTextField("Enter Password",Icons.lock,true,
    _passwordTextController),
    const SizedBox(
    height: 20,
    ),
   signInSignUpButton(context, false, (){
     FirebaseAuth.instance
         .createUserWithEmailAndPassword(
        email: _emailTextController.text,
         password: _passwordTextController.text)
        .then((value) {
       print('created Account');
       Navigator.push(context,
           MaterialPageRoute(builder: (context) => HomeScreen()));
     }).onError((error, stackTrace) {
       print('Error ${error.toString()}');
     });
   })
    ],
    ) ,
    ),
    )
    )
    );
  }
}
