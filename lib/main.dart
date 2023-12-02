import 'package:flutter/material.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/landing_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';

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
      home: RegisterPage(),
    );
  }
}

