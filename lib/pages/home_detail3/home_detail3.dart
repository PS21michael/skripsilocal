import 'package:flutter/material.dart';
import 'package:skripsilocal/pages/components/my_header.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/home_detail3/post3_1.dart';
import 'package:skripsilocal/pages/home_detail3/post3_2.dart';
import 'package:skripsilocal/pages/home_detail3/post3_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeDetail_3 extends StatefulWidget {
  const HomeDetail_3({Key? key}) : super(key: key);

  @override
  State<HomeDetail_3> createState() => _HomeDetail_3State();
}

class _HomeDetail_3State extends State<HomeDetail_3> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyHeader(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: const [
                Post3_1(),
                Post3_2(),
                Post3_3(),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const JumpingDotEffect(
              dotColor: Colors.grey,
              activeDotColor: Colors.black,
              dotHeight: 10,
              dotWidth: 20,
              spacing: 10,
              verticalOffset: 5,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      bottomNavigationBar: const MyNavBar(index: 0),
    );
  }
}