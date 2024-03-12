import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/pages/components/square_tile.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/profile/register_page.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/bola/InquiryNewsAntaraBola.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/dunia/InquiryNewsAntaraDunia.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/hiburan/InquiryNewsAntaraHiburan.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/hukum/InquiryNewsAntaraHukum.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/humaniora/InquiryNewsAntaraHumaniora.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/lifestyle/InquiryNewsAntaraLifeStyle.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/olahraga/InquiryAntaraNewsOlahraga.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/otomotif/InquiryAntaraNewsOtomotif.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/tekno/InquiryAntaraNewsTeknologi.dart';
import 'package:skripsilocal/src/features/authentication/controller/signin_controller.dart';
import 'package:skripsilocal/src/features/authentication/screens/forget_password/reset_password_screen.dart';
import '../../../../Utils/Helper/TimeSavedNews.dart';
import '../../../../pages/components/my_textfield.dart';
import 'antara_news_repository.dart';
import '../politik/InquiryAntaraNewsPolitik.dart';
import '../../../features/Dummy/Inquiry News/ANTARA/XXX-InquirynewsAntaraHumaniora.dart';
// import '../../src/features/authentication/models/user_model.dart';
// import '../../src/features/authentication/screens/error_toast/show_toast.dart';
// import '../components/my_textfield.dart';
// import '../components/button.dart';
// import 'core/update_profile_new.dart';

class InquiryNewsAnatara extends StatefulWidget {

  const InquiryNewsAnatara({super.key});

  @override
  State<InquiryNewsAnatara> createState() => _InquiryNewsAnatara();
}

class _InquiryNewsAnatara extends State<InquiryNewsAnatara> {

  final dateTimecontroller = Get.put(TimeSavedParser());

  final controller = Get.put(SignInController());

  final newsRepo = Get.put(AntaraNewsRepository());

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
                // 1. Politik
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsPolitik());
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

                // 2. Otomotif
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsOtomotif());
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

                // 3. Olahraga
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsOlahraga());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Olahraga",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 4. Life Style
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsLifeStyle());
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

                // 5. Humaniora
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsHumaniora());
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Humaniora",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 6. Hukum
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsHukum());
                  },


                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Hukum",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 7. Hiburan
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsHiburan());
                  },


                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Hiburan",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 8. Ekonomi
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsHiburan());
                  },


                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Ekonomi",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 9. Internasional
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsInternasional());
                  },




                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Internasional",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 10. Bola
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsBola());
                  },




                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Bola",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 11. Teknologi
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                GestureDetector(
                  onTap: (){
                    AntaraNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryAntaraNewsTeknologi());
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