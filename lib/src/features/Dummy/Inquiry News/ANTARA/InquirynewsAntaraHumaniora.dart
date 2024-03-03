import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/pages/components/square_tile.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/profile/register_page.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/Core/antara_news_repository.dart';
import 'package:skripsilocal/src/features/authentication/controller/signin_controller.dart';
import 'package:skripsilocal/src/features/authentication/screens/forget_password/reset_password_screen.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';
import '../../../../../Utils/Helper/TimeSavedNews.dart';
import '../../../../../pages/components/my_textfield.dart';
import '../../../../NewsDirect/Antara/politik/InquiryAntaraNewsPolitik.dart';
import '../../../../repository/news_repository/news_repository.dart';
import 'InquiryHumanioraNews.dart';
// import '../../src/features/authentication/models/user_model.dart';
// import '../../src/features/authentication/screens/error_toast/show_toast.dart';
// import '../../src/repository/user_repository/user_repository.dart';
// import '../components/my_textfield.dart';
// import '../components/button.dart';
// import 'core/update_profile_new.dart';

class InquiryNewsAnataraHumaniora extends StatefulWidget {

  const InquiryNewsAnataraHumaniora({super.key});

  @override
  State<InquiryNewsAnataraHumaniora> createState() => _InquiryNewsAnataraHumaniora();
}

class dateTime{
  final String timeSaved;

  dateTime(this.timeSaved);
}


class _InquiryNewsAnataraHumaniora extends State<InquiryNewsAnataraHumaniora> {

  final dateTimecontroller = Get.put(TimeSavedParser());

  // final newsRepo = Get.put(NewsRepository());
  final newsRepo1 = Get.put(AntaraNewsRepository());

  int dateSaved=0;

  final controller = Get.put(SignInController());
  final timeSavedController = TextEditingController();

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
                  'Masukkan tanggal berita yang akan dia inquiry\n Contoh : 11 Februari 2024',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    // Get.to(()=>const InquiryAntaraNewsPolitik());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Politik",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 10),
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