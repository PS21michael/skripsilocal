import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/pages/components/square_tile.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/src/NewsDirect/CNBC/core/cnbc_news_repository.dart';
import 'package:skripsilocal/src/NewsDirect/CNBC/lifestyle/inquiryNewCNBCLifeStyle.dart';
import '../../../../Utils/Helper/TimeSavedNews.dart';
import '../../../../pages/components/my_textfield.dart';
import '../entrepreneur/inquiryNewsCNBCEntrepreneur.dart';
import '../market/inquiryNewsCNBCMarket.dart';
import '../news/inquiryNewsCNBCNews.dart';
import '../opini/inquiryNewsCNBCOpini.dart';
import '../syariah/inquiryNewsCNBCSyariah.dart';
import '../tech/inquiryNewsCNBCTech.dart';
// import '../../src/features/authentication/models/user_model.dart';
// import '../../src/features/authentication/screens/error_toast/show_toast.dart';
// import '../components/my_textfield.dart';
// import '../components/button.dart';
// import 'core/update_profile_new.dart';

class InquiryNewsCNBC extends StatefulWidget {

  const InquiryNewsCNBC({super.key});

  @override
  State<InquiryNewsCNBC> createState() => _InquiryNewsCNBC();
}

class _InquiryNewsCNBC extends State<InquiryNewsCNBC> {

  final dateTimecontroller = Get.put(TimeSavedParser());

  final newsRepo = Get.put(CNBCNewsRepository());

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

                // 1. NEWS
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    CNBCNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNBCNewsNews());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("News",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 2. MARKET
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    CNBCNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNBCNewsMarket());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Market",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 3. ENTREPRENEUR
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    CNBCNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNBCNewsEntrepreneur());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Entrepreneur",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 4. SYARIAH
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    CNBCNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNBCNewsSyariah());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Syariah",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 5. TEKNOLOGI
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    CNBCNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNBCNewsTech());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Teknologi",
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
                    CNBCNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNBCNewsLifeStyle());
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


                // 6. OPINI
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    CNBCNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNBCNewsOpini());
                  },


                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Opini",
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