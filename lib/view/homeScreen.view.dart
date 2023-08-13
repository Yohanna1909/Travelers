import 'package:flutter/material.dart';
import 'package:travelers/utils/widgets/appBar.global.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          HomeAppBar(),
          Container(
            height: 500,
            padding: const EdgeInsets.only(top:15),
            decoration: const BoxDecoration(
              color:Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children:[
                Container(
                  margin:const EdgeInsets.symmetric(horizontal:15),
                  padding: const EdgeInsets.symmetric(horizontal:15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children:[
                      Container(
                        margin: const EdgeInsets.only(left:5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search here...',
                          )
                        )
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.search,
                        size:27,
                        color: Color.fromARGB(255, 18, 118, 23),
                      )
                    ]
                  )
                )
              ]
            ),
          )
        ]
      ),
    );
  }
}