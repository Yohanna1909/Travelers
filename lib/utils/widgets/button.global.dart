// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, unnecessary_this, must_be_immutable

import 'package:flutter/material.dart';
import 'package:travelers/utils/global.colors.dart';

class ButtonGlobal extends StatelessWidget {
  ButtonGlobal({super.key, required this.context,required this.isLogin, required this.onTap});
  BuildContext context;
  bool isLogin;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: GestureDetector(
        onTap: () {
          onTap(); 
        },
        child: Container(
          decoration: BoxDecoration(
            color: GlobalColors.Verde,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              isLogin ? 'Sign In' : 'Sign Up',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}