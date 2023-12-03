import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:skripsilocal/pages/news/news_page.dart';

import '../home_page.dart';

class myNavBar extends StatefulWidget {
  final int index;

  const myNavBar ({
    super.key,
    required this.index,
  });

  @override
  State<myNavBar> createState() => _myNavBarState();
}

class _myNavBarState extends State<myNavBar> {
  late int _selectedIndex;

  void initState(){
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade500,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        child: GNav(
          backgroundColor: Colors.red.shade500,
          color: Colors.white,
          tabBackgroundColor: Colors.red.shade200,
          gap : 10,
          padding: EdgeInsets.all(10),
          selectedIndex: _selectedIndex,
          onTabChange: (index){
            _tabChange(index);
          },
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

  void _tabChange (int index){
    setState(() {
      _selectedIndex = index;
      // You can use Navigator to push/pop pages based on the index
      switch (index) {
        case 0:
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) => HomePage()
              )
          );
          break;
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) => NewsPage()
              )
          );
          break;
        case 2:
        // Navigate to Profile page
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          break;
      }
    });
  }
}

