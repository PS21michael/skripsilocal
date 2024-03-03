import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skripsilocal/pages/news/news_page.dart';
import 'package:skripsilocal/pages/profile/core/profile_creen.dart';

import '../home_page.dart';
import '../profile/profile_page.dart';

class MyNavBar extends StatefulWidget {
  final int index;

  const MyNavBar ({
    super.key,
    required this.index,
  });

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  late int _selectedIndex;

  @override
  void initState(){
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        child: GNav(
          backgroundColor: Colors.grey.shade200,
          color: Colors.black87,
          tabBackgroundColor: Colors.grey.shade500,
          gap : 10,
          padding: const EdgeInsets.all(10),
          selectedIndex: _selectedIndex,
          onTabChange: (index){
            _tabChange(index);
          },
          tabs: const [
            GButton(
              icon: Icons.explore,
              text: 'Explore',
            ),
            GButton(
              icon: IconData(0xf0541, fontFamily: 'MaterialIcons'),
              text: 'News',
            ),
            GButton(
              icon: Icons.archive,
              text: 'Saved',
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
                  (context) => const HomePage()
              )
          );
          break;
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) => const NewsPage()
              )
          );
          break;
        case 2:
          // Navigator.push(context,
          //     MaterialPageRoute(builder:
          //         (context) => const ProfileScreen()
          //     )
          // );
          break;
        case 3:
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) => const ProfilePage()
              )
          );
          break;
      }
    });
  }
}

