import 'package:flutter/material.dart';
import 'package:travelers/utils/global.colors.dart';
import 'package:travelers/utils/widgets/social.login.dart';
import 'package:travelers/utils/widgets/text.form.global.dart';
import 'package:travelers/view/login.view.dart';

import '../utils/widgets/button2.global.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController CPasswordController = TextEditingController();
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
                    width: 250,  
                    height: 250,
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
                //Confirm Password input
                TextFormGlobal(
                  controller: CPasswordController, 
                  text: "Confirm Password", 
                  textInputType: TextInputType.text, 
                  obscure: true
                ),
                const SizedBox(height: 10),
                const ButtonGlobal2(),
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