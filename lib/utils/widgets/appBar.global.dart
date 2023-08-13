import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: const Row(
        children: [
          Icon(
            Icons.map,
            size:30,
            color: Color.fromARGB(255, 18, 118, 23),
          ),
          Padding(
            padding: EdgeInsets.only(left:20),
            child: Text(
              'Travelers',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 18, 118, 23),
              )
            )
          ),
        ]
      ),
    );
  }
}