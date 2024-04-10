import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:skripsilocal/pages/authentication/login_page.dart';
import 'package:skripsilocal/pages/news/explore.dart';
import 'package:skripsilocal/pages/news/history.dart';
import 'package:skripsilocal/pages/profile/InquiryNewsAdmin.dart';
import 'package:skripsilocal/pages/profile/show_user.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';

class InquiryHeader extends StatelessWidget implements PreferredSizeWidget {
  const InquiryHeader({Key? key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
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
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [
        InkWell(
          onTap: () {
            Get.to(()=> const InquiryNews());
          },
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                'Done',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ],
      elevation: 5,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 1,
          color: Colors.black.withOpacity(1),
        ),
      ),
    );
  }
}
