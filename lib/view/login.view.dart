// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelers/utils/global.colors.dart';
import 'package:travelers/utils/widgets/button.global.dart';
import 'package:travelers/utils/widgets/social.login.dart';
import 'package:travelers/utils/widgets/text.form.global.dart';
import 'package:travelers/view/home.view.dart';
import 'package:travelers/view/signup.view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/imgs/TravelersTrek.png',  
                    width: 200,  
                    height: 200,
                  ),
                ),
    
                Text("Login to your account",
                  style: TextStyle(
                  color: GlobalColors.textColor,
                  fontSize:16,
                  fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 15),
                //Email input
                TextFormGlobal(
                  controller: EmailController, 
                  text:"Email", 
                  obscure:false,
                  textInputType: TextInputType.emailAddress
                ),
                const SizedBox(height: 10),
                //Password input
                TextFormGlobal(
                  controller: PasswordController, 
                  text: "Password", 
                  textInputType: TextInputType.text, 
                  obscure: true
                ),
                const SizedBox(height: 10),
                ButtonGlobal(isLogin: true, context: context, onTap: (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: EmailController.text,
                    password: PasswordController.text).then((value){
                      print('Login');
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Home()));
                    }
                  ).onError((error, stackTrace){
                    print("Error ${error.toString()}");
                  });
                }),
                const SizedBox(height: 25),
                const SocialLogin(text: '-Or sign in with-'),
              ],
              
            )
          )
        )
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account? '
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpView()),
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: GlobalColors.Verde,
                ),
              )
            )
          ],
        )
      ),
    );
  }
}