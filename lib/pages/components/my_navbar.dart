import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skripsilocal/controller/bookmark_controller.dart';
import 'package:skripsilocal/pages/authentication/login_page.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/news/explore.dart';
import 'package:skripsilocal/pages/news/news.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:skripsilocal/repository/recommendation_repository/recommendation_repository.dart';
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
  final controller = Get.put(BookmarkController());

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
            // if(AuthenticationRepository.instance.firebaseUser==null){
            //   Get.snackbar(
            //     'Informasi!',
            //     'Login dulu yaa!',
            //     snackPosition: SnackPosition.BOTTOM,
            //     backgroundColor: Colors.yellow,
            //     borderRadius: 10.0,
            //     messageText: Text(
            //       'Login dulu yaa!',
            //       style: TextStyle(
            //         fontSize: 18.0,
            //         color: Colors.black, // Customize as needed
            //       ),
            //     ),
            //   );
            //   await Future.delayed(Duration(seconds: 3));
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            // } else {
            //   UserRepository.instance.resetListScore();
            //   await Future.delayed(Duration(milliseconds: 500));
            //   await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
            //   String idPengguna = UserRepository.instance.getUserModelId();
            //   BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
            //   String temp = "";
            //   temp = BookmarkRepository.instance.isDataAvail();
            //   print("isDataAvail $temp");
            // }
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

  void _tabChange(int index) async {
    _selectedIndex = index;
    switch (index) {
      case 0:
        if (AuthenticationRepository.instance.firebaseUser == null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => const ExplorePage()
              )
          );
        }
        else{
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
          // print("object : $AuthenticationRepository.instance.getUserEmail");
          // print("object2 : ${AuthenticationRepository.instance.getUserEmail}");
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          await Future.delayed(const Duration(milliseconds: 100));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => const ExplorePage()
              )
          );
        }
        break;
      case 1:
        if (AuthenticationRepository.instance.firebaseUser == null) {
          Get.snackbar(
            'Informasi!',
            'Login dulu yaa!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.yellow,
            borderRadius: 10.0,
            messageText: Text(
              'Login dulu yaa!',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          );
          Future.delayed(Duration(seconds: 3));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        }
        else {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
          // Future.delayed(Duration(milliseconds: 500));
          // UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          // print("object : $AuthenticationRepository.instance.getUserEmail");
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          // print("object2 : $AuthenticationRepository.instance.getUserEmail");
          String idPengguna = UserRepository.instance.getUserModelId();
          await Future.delayed(const Duration(seconds: 1));
          BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
          await Future.delayed(const Duration(seconds: 1));
          RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
          await Future.delayed(const Duration(seconds: 1));
          HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);
          // String temp = "";
          // temp = BookmarkRepository.instance.isDataAvail();
          // print("isDataAvail $temp");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NewsPage()));
        }
        break;
      case 2:
        if (AuthenticationRepository.instance.firebaseUser == null) {
          Get.snackbar(
            'Informasi!',
            'Login dulu yaa!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.yellow,
            borderRadius: 10.0,
            messageText: Text(
              'Login dulu yaa!',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          );
          Future.delayed(Duration(seconds: 3));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        }
        else {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          await Future.delayed(const Duration(milliseconds: 100));
          Future.delayed(Duration(milliseconds: 500));
          UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          String idPengguna = UserRepository.instance.getUserModelId();
          await Future.delayed(const Duration(seconds: 1));
          BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
          await Future.delayed(const Duration(seconds: 1));
          RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
          await Future.delayed(const Duration(seconds: 1));
          HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);
          // String temp = "";
          // temp = BookmarkRepository.instance.isDataAvail();
          // print("isDataAvail $temp");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BookmarkPage()));
        }
        break;
      case 3:
        if (AuthenticationRepository.instance.firebaseUser == null) {
          Get.snackbar(
            'Informasi!',
            'Login dulu yaa!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.yellow,
            borderRadius: 10.0,
            messageText: Text(
              'Login dulu yaa!',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          );
          Future.delayed(Duration(seconds: 3));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        }
        else {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          await Future.delayed(const Duration(milliseconds: 100));
          await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          await Future.delayed(const Duration(milliseconds: 100));
          Future.delayed(Duration(milliseconds: 500));
          UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
          String idPengguna = UserRepository.instance.getUserModelId();
          // BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
          // String temp = "";
          // temp = BookmarkRepository.instance.isDataAvail();
          // print("isDataAvail $temp");
          await Future.delayed(const Duration(seconds: 1));
          BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
          await Future.delayed(const Duration(seconds: 1));
          RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
          await Future.delayed(const Duration(seconds: 1));
          HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
        }
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }


}

