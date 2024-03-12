import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/pages/components/square_tile.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/src/NewsDirect/Okezone/core/okezone_news_repository.dart';
import '../../../../Utils/Helper/TimeSavedNews.dart';
import '../../../../pages/components/my_textfield.dart';
import '../bola/inquiryNewsOkezoneBola.dart';
import '../celebrity/inquiryNewsOkezoneCelebrity.dart';
import '../economy/inquiryNewsOkezoneEconomy.dart';
import '../lifestyle/inquiryNewsOkezoneLifestyle.dart';
import '../otomotif/inquiryNewsOkezoneOtomotif.dart';
import '../sports/inquiryNewsOkezoneSports.dart';
import '../techno/inquiryNewsOkezoneTechno.dart';
// import '../../src/features/authentication/models/user_model.dart';
// import '../../src/features/authentication/screens/error_toast/show_toast.dart';
// import '../components/my_textfield.dart';
// import '../components/button.dart';
// import 'core/update_profile_new.dart';

class InquiryNewsOkezone extends StatefulWidget {

  const InquiryNewsOkezone({super.key});

  @override
  State<InquiryNewsOkezone> createState() => _InquiryNewsOkezone();
}

class _InquiryNewsOkezone extends State<InquiryNewsOkezone> {

  final dateTimecontroller = Get.put(TimeSavedParser());

  final newsRepo = Get.put(OkezoneNewsRepository());

  @override
  Widget build(BuildContext context) {
    DateTime tets = DateTime.now();
    String montValue = dateTimecontroller.montParser(tets.month.toInt());
    String tanggalToday = tets.day.toString()+" "+montValue+" "+tets.year.toString();
    int monthNumber = dateTimecontroller.timeSaver(tanggalToday);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pilih Kategori Berita dari portal antara yang mau di inquiry!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),

                // 1. CELEBRITY
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    OkezoneNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryOkezoneNewsCelebrity());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Celebrity",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 2. SPORTS
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    OkezoneNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryOkezoneNewsSports());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Sports",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 3. OTOMOTIF
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    OkezoneNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryOkezoneNewsOtomotif());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Otomotif",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 4. ECONOMY
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    OkezoneNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryOkezoneNewsEconomy());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Economy",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 5. TECHNO
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    OkezoneNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryOkezoneNewsTechno());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Techno",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 6. LIFE STYLE
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    OkezoneNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryOkezoneNewsLifeStyle());
                  },


                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Life Style",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 10),
                // Forget Password
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 4),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blueGrey.shade400,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blueGrey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}