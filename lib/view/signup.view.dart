import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelers/utils/global.colors.dart';
import 'package:travelers/utils/widgets/social.login.dart';
import 'package:travelers/utils/widgets/text.form.global.dart';
import 'package:travelers/view/home.view.dart';
import 'package:travelers/view/login.view.dart';

import '../utils/widgets/button.global.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
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
    
                Text("Create your account",
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
                ButtonGlobal(isLogin: false, context: context, onTap: (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: EmailController.text,
                    password: PasswordController.text
                  ).then((value){
                    print('Created New Account');
                    print('Sign Up');
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> Home()));
                  }).onError((error, stackTrace){
                    print("Error ${error.toString()}");
                  });
                }),
                const SizedBox(height: 25),
                const SocialLogin(text: '-Or sign up with-'),
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
              'Do you have an account? '
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              child: Text(
                'Sign In',
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