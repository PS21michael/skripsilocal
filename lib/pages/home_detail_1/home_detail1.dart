// import 'package:flutter/material.dart';
// import 'package:skripsilocal/pages/components/basicHeader.dart';
// import 'package:skripsilocal/pages/components/my_navbar.dart';
// import 'package:skripsilocal/pages/home_detail_1/post1_1.dart';
// import 'package:skripsilocal/pages/home_detail_1/post1_2.dart';
// import 'package:skripsilocal/pages/home_detail_1/post1_3.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class HomeDetail_1 extends StatefulWidget {
//   const HomeDetail_1({Key? key}) : super(key: key);
//
//   @override
//   State<HomeDetail_1> createState() => _HomeDetail_1State();
// }
//
// class _HomeDetail_1State extends State<HomeDetail_1> {
//   final _controller = PageController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BasicHeader(),
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView(
//               controller: _controller,
//               scrollDirection: Axis.horizontal,
//               children: const [
//                 Post1_1(),
//                 Post1_2(),
//                 Post1_3(),
//               ],
//             ),
//           ),
//           const SizedBox(height: 5),
//           SmoothPageIndicator(
//             controller: _controller,
//             count: 3,
//             effect: const JumpingDotEffect(
//               dotColor: Colors.grey,
//               activeDotColor: Colors.black,
//               dotHeight: 10,
//               dotWidth: 20,
//               spacing: 10,
//               verticalOffset: 5,
//             ),
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//       bottomNavigationBar: const MyNavBar(index: 0),
//     );
//   }
// }
