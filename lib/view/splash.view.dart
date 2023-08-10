import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelers/view/login.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), (){
      Get.to(LoginView());
    });
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Image.asset(
          'assets/imgs/TravelersTrek.png',  
          width: 300,  
          height: 300, 
        ),
      ),
    );
  }
}