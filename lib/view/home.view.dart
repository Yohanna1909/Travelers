import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'camera.view.dart';
import 'favorite.view.dart';
import 'homeScreen.view.dart';
import 'settings.view.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final screens = [
    HomeScreen(),
    Favorite(),
    Camera(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal:10.0),
        margin:const EdgeInsets.only(bottom:10.0),
        child: GNav(
          tabBackgroundColor: const Color.fromARGB(106, 133, 221, 123),
          gap: 8,
          curve: Curves.easeOutExpo,
          tabBorderRadius: 20,
          activeColor:const Color.fromARGB(255, 18, 118, 23),
          padding: const EdgeInsets.symmetric(vertical:15, horizontal:20),
          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'Favorite',
            ),
            GButton(
              icon: Icons.camera_alt_outlined,
              text: 'Camera',
            ),
            GButton(
              icon: Icons.settings_outlined,
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
