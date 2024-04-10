// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:random_name_generator/random_name_generator.dart';
// import 'package:skripsilocal/pages/components/square_tile.dart';
// import 'package:skripsilocal/pages/home_page.dart';
// import 'package:skripsilocal/src/NewsDirect/SindoNews/core/sindo_news_repository.dart';
// import '../../../../Utils/timeSavedNews.dart';
// import '../../../../pages/components/my_textfield.dart';
// import '../daerah/inquiryNewsSindoNewsDaerah.dart';
// import '../edukasi/inquiryNewsSindoNewsEdukasi.dart';
// import '../ekbis/inquiryNewsSindoNewsEkbis.dart';
// import '../international/inquiryNewsSindoNewsInternational.dart';
// import '../kalam/inquiryNewsSindoNewsKalam.dart';
// import '../lifestyle/inquiryNewsSindoNewsLifeStyle.dart';
// import '../metro/inquiryNewsSindoNewsMetro.dart';
// import '../nasional/inquiryNewsSindoNewsNasional.dart';
// import '../otomotif/inquiryNewsSindoNewsOtomotif.dart';
// import '../sains/inquiryNewsSindoNewsSains.dart';
// import '../sports/inquiryNewsSindoNewsSports.dart';
// import '../tekno/inquiryNewsSindoNewsTekno.dart';
// // import '../../src/features/authentication/models/user_model.dart';
// // import '../../src/features/authentication/screens/error_toast/show_toast.dart';
// // import '../components/my_textfield.dart';
// // import '../components/button.dart';
// // import 'core/update_profile_new.dart';
//
// class InquiryNewsSindoNews extends StatefulWidget {
//
//   const InquiryNewsSindoNews({super.key});
//
//   @override
//   State<InquiryNewsSindoNews> createState() => _InquiryNewsSindoNews();
// }
//
// class _InquiryNewsSindoNews extends State<InquiryNewsSindoNews> {
//
//   final dateTimecontroller = Get.put(PeriodSavedParser());
//
//   final newsRepo = Get.put(SindoNewsRepository());
//
//   @override
//   Widget build(BuildContext context) {
//     DateTime tets = DateTime.now();
//     String montValue = dateTimecontroller.montParser(tets.month.toInt());
//     String tanggalToday = tets.day.toString()+" "+montValue+" "+tets.year.toString();
//     int monthNumber = dateTimecontroller.periodSaver(tanggalToday);
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 50),
//                 const Icon(
//                   Icons.lock,
//                   size: 100,
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Pilih Kategori Berita dari portal antara yang mau di inquiry!',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                   ),
//                 ),
//
//                 // 1. NASIONAL
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsNasional());
//                   },
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Nasional",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 2. METRO
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsMetro());
//                   },
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Metro",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 3. EKBIS
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsEkbis());
//                   },
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Ekbis",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 4. INTERNATIONAL
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsInternational());
//                   },
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("International",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 5. DAERAH
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsDaerah());
//                   },
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Daerah",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 6. SPORTS
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsSports());
//                   },
//
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Sports",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 7. OTOMOTIF
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsOtomotif());
//                   },
//
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Otomotif",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//
//                 // 8. TEKNO
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsTekno());
//                   },
//
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Tekno",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 9. SAINS
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsSains());
//                   },
//
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Sains",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//
//                 // 10. EDUKASI
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsEdukasi());
//                   },
//
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Edukasi",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//
//                 // 11. LIFE STYLE
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsLifeStyle());
//                   },
//
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Life Style",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 12. KALAM
//                 const SizedBox(height: 20),
//                 // DISINI BUAT BUTTON
//                 GestureDetector(
//                   onTap: (){
//                     SindoNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquirySindoNewsKalam());
//                   },
//
//
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Kalam",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     right: 20,
//                     left: 20,
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           thickness: 0.5,
//                           color: Colors.blueGrey.shade400,
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 15,
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           thickness: 0.5,
//                           color: Colors.blueGrey.shade400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }