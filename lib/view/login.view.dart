import 'package:flutter/material.dart';
import 'package:travelers/utils/global.colors.dart';
import 'package:travelers/utils/widgets/button.global.dart';
import 'package:travelers/utils/widgets/social.login.dart';
import 'package:travelers/utils/widgets/text.form.global.dart';
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
                    width: 250,  
                    height: 250,
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
                const ButtonGlobal(),
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