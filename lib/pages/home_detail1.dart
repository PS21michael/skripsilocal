import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:skripsilocal/pages/components/my_header.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';

class HomeDetail_1 extends StatefulWidget {
  const HomeDetail_1 ({super.key});

  @override
  State<HomeDetail_1> createState() => _HomeDetail_1State();
}

class _HomeDetail_1State extends State<HomeDetail_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myNavBar(),
    );
  }
}
