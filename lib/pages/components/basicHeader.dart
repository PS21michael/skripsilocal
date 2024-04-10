import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:skripsilocal/pages/authentication/login_page.dart';
import 'package:skripsilocal/pages/news/explore.dart';
import 'package:skripsilocal/pages/news/history.dart';
import 'package:skripsilocal/pages/profile/show_user.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';

class BasicHeader extends StatelessWidget implements PreferredSizeWidget {
  const BasicHeader({Key? key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        'Baca Berita',
        style: TextStyle(
          fontSize: 28,
          letterSpacing: 5,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      elevation: 5,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          height: 1,
          color: Colors.black.withOpacity(1),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
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
              } else{
                Get.to(()=>const HistoryPage());
              }
            },
            icon: Icon(Icons.history),
            iconSize: 30,
          ),
        ),
      ],
    );
  }
}
