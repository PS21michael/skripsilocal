import 'package:flutter/material.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/landing_page.dart';
import 'pages/profile/login_page.dart';
import 'pages/profile/register_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: MyHeader(),
      home: HomePage(),
    );
  }
}

