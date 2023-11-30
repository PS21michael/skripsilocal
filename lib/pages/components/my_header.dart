import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget implements PreferredSizeWidget {
  const MyHeader({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        '17 FEBRUARI 2024',
        style: TextStyle(
          fontSize: 30,
          letterSpacing: 4,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      elevation: 5,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          height: 1,
          color: Colors.black.withOpacity(1),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

}
