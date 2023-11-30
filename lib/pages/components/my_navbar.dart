import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class myNavBar extends StatefulWidget {
  const myNavBar ({super.key});

  @override
  State<myNavBar> createState() => _myNavBarState();
}

class _myNavBarState extends State<myNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade400,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        child: GNav(
          backgroundColor: Colors.red.shade400,
          color: Colors.white,
          tabBackgroundColor: Colors.red.shade200,
          gap : 10,
          padding: EdgeInsets.all(10),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: IconData(0xf0541, fontFamily: 'MaterialIcons'),
              text: 'News',
            ),
            GButton(
              icon: IconData(0xe043, fontFamily: 'MaterialIcons'),
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
