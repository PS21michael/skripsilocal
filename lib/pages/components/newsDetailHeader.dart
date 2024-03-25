import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget implements PreferredSizeWidget {
  const DetailHeader({Key? key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
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
    );
  }
}
