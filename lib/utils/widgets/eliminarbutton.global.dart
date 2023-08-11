// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:travelers/utils/global.colors.dart';

class ButtonGlobal2 extends StatelessWidget {
  const ButtonGlobal2({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('Sign Up');
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: GlobalColors.Verde,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ]
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
          )
        ),
      ),
    );
  }
}