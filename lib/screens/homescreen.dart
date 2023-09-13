import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasesignin/screens/signin.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child:const Text('Log Out'),
          onPressed: (){
            FirebaseAuth.instance.signOut().then((value) {
              print('Signed Out');

            Navigator.push(context, MaterialPageRoute(builder: (context)
            => const SignInScreen()
            ));
            });
          },
        )
      ),
    );
  }
}
