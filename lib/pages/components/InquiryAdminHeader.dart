import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/pages/authentication/dummy.dart';
import 'package:skripsilocal/pages/profile/InquiryNewsAdmin.dart';
import 'package:skripsilocal/pages/profile/profile_page.dart';

class InquiryAdminHeader extends StatelessWidget implements PreferredSizeWidget {
  const InquiryAdminHeader({super.key});

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
            Get.to(()=> const ProfilePage());
          },
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text(
                'Selesai',
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
