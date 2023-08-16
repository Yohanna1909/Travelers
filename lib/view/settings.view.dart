import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelers/view/login.view.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Logout"),
          onPressed: (){
            FirebaseAuth.instance.signOut().then((value){
              print('Signed Out');
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>LoginView()));
            });
          },
        ),
      ),
    );
  }
}