// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:skripsilocal/src/NewsDirect/Merdeka/core/merdeka_news_repository.dart';
// import '../../../../Utils/timeSavedNews.dart';
// import '../dunia/inquiryNewsMerdekaDunia.dart';
// import '../gaya/inquiryNewsMerdekaGaya.dart';
// import '../jakarta/inquiryNewsMerdekaJakarta.dart';
// import '../jateng/inquiryNewsMerdekaJateng.dart';
// import '../khas/inquiryNewsMerdekaKhas.dart';
// import '../olahraga/inquiryNewsMerdekaOlahraga.dart';
// import '../otomotif/inquiryNewsMerdekaOtomotif.dart';
// import '../sehat/inquiryNewsMerdekaSehat.dart';
// import '../teknologi/inquiryNewsMerdekaTeknologi.dart';
//
// class InquiryNewsMerdeka extends StatefulWidget {
//
//   const InquiryNewsMerdeka({super.key});
//
//   @override
//   State<InquiryNewsMerdeka> createState() => _InquiryNewsMerdeka();
// }
//
// class _InquiryNewsMerdeka extends State<InquiryNewsMerdeka> {
//
//   final dateTimecontroller = Get.put(PeriodSavedParser());
//
//   final newsRepo = Get.put(MerdekaNewsRepository());
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
//                 // 1. JAKARTA
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: ()async{
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriodNull();
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquiryMerdekaNewsJakarta());
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Jakarta",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 2. DUNIA
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: ()async{
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriodNull();
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquiryMerdekaNewsDunia());
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Dunia",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 3. GAYA
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: ()async{
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriodNull();
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquiryMerdekaNewsGaya());
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Gaya",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 4. OLAHRAGA
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: ()async{
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriodNull();
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquiryMerdekaNewsOlahraga());
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Olahraga",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 5. TEKNOLOGI
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: ()async{
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriodNull();
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquiryMerdekaNewsTeknologi());
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Teknologi",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 6. OTOMOTIF
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: ()async{
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriodNull();
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquiryMerdekaNewsOtomotif());
//                   },
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
//                 // 7. KHAS
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: ()async{
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriodNull();
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquiryMerdekaNewsKhas());
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Khas",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 8. SEHAT
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: ()async{
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriodNull();
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquiryMerdekaNewsSehat());
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Sehat",
//                         style: TextStyle(
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 // 9. JATENG
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: ()async{
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriodNull();
//                     await Future.delayed(Duration(milliseconds: 100));
//                     MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
//                     Get.to(()=>const InquiryMerdekaNewsJateng());
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.blue[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Center(
//                       child: Text("Jateng",
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