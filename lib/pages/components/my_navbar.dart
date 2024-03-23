import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/news/explore.dart';
import 'package:skripsilocal/pages/news/news.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import 'package:skripsilocal/pages/news/bookmark.dart';
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
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        child: GNav(
          backgroundColor: Colors.black,
          tabBackgroundColor: Colors.white,
          gap : 10,
          padding: const EdgeInsets.all(10),
          selectedIndex: _selectedIndex,
          onTabChange : (index) async{
            UserRepository.instance.resetListScore();
            await Future.delayed(Duration(milliseconds: 500));
            await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
            _tabChange(index);
          },
          tabs: const [
            GButton(
              icon: Icons.explore,
              text: 'Explore',
              iconColor: Colors.white,
            ),
            GButton(
              icon: IconData(0xf0541, fontFamily: 'MaterialIcons'),
              text: 'News',
              iconColor: Colors.white,
            ),
            GButton(
              icon: Icons.archive,
              text: 'Bookmark',
              iconColor: Colors.white,
            ),
            GButton(
              icon: IconData(0xe043, fontFamily: 'MaterialIcons'),
              text: 'Profile',
              iconColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _tabChange (int index){
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) => const ExplorePage()
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
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) => const BookmarkPage()
              )
          );
          break;
        case 3:
          Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) => ProfilePage()
              )
          );
          break;
      }
    });
  }
}

