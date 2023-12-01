import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:skripsilocal/pages/components/my_header.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/home_detail_1/post_1.dart';
import 'package:skripsilocal/pages/home_detail_1/post_2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeDetail_1 extends StatefulWidget {
  HomeDetail_1({Key? key}) : super(key: key);

  @override
  State<HomeDetail_1> createState() => _HomeDetail_1State();
}

class _HomeDetail_1State extends State<HomeDetail_1> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeader(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: const [
                Post1(),
                Post2(),
              ],
            ),
          ),
          SizedBox(height: 5),
          SmoothPageIndicator(
            controller: _controller,
            count: 2,
            effect: JumpingDotEffect(
              dotColor: Colors.grey,
              activeDotColor: Colors.black,
              dotHeight: 10,
              dotWidth: 20,
              spacing: 10,
              verticalOffset: 5,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
      bottomNavigationBar: myNavBar(),
    );
  }
}
