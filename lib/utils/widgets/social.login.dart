import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travelers/utils/global.colors.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key, required this.text});
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: GlobalColors.textColor,
              fontWeight: FontWeight.w600,
            ) ,
          ),
        ),
        const SizedBox(height:15),
        Row(
          children:[
            //Google
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  )]
            
                ),
                child: SvgPicture.asset(
                  'assets/imgs/google.svg', 
                  height:30,
                ),
              ),
            ),
          ]
        )
      ]
    );
  }
}