import 'package:flutter/material.dart';
import 'package:skripsilocal/pages/components/my_header.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyHeader(),
      body: Container(
        color: Colors.orange,
      ),
      bottomNavigationBar: const MyNavBar(index: 1),
    );
  }
}