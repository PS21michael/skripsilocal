import 'package:flutter/material.dart';
import 'package:skripsilocal/pages/components/my_header.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/home_detail2/post2_1.dart';
import 'package:skripsilocal/pages/home_detail2/post2_2.dart';
import 'package:skripsilocal/pages/home_detail2/post2_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeDetail_2 extends StatefulWidget {
  const HomeDetail_2({Key? key}) : super(key: key);

  @override
  State<HomeDetail_2> createState() => _HomeDetail_2State();
}

class _HomeDetail_2State extends State<HomeDetail_2> {
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
                Post2_1(),
                Post2_2(),
                Post2_3(),
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
