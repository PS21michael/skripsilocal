import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/pages/components/square_tile.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/src/NewsDirect/CNBC/core/inquiryNewsCNBC.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/core/inquiryNewsCNN.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/core/inquiryNewsMerdeka.dart';
import 'package:skripsilocal/src/NewsDirect/Okezone/core/inquiryNewsOkezone.dart';
import 'package:skripsilocal/src/NewsDirect/Republika/core/inquiryNewsRepublika.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/core/inquiryNewsSindoNews.dart';
import 'package:skripsilocal/src/NewsDirect/Suara/core/inquiryNewsSuara.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/core/inquiryNewsTempo.dart';
import '../../../../../pages/components/my_textfield.dart';
import '../../../../Utils/Helper/TimeSavedNews.dart';
import '../../../../controller/signin_controller.dart';
import '../../../NewsDirect/Antara/Core/inquiryNewsAntara.dart';
// import '../../src/features/authentication/models/user_model.dart';
// import '../../src/features/authentication/screens/error_toast/show_toast.dart';
// import '../../src/repository/user_repository/user_repository.dart';
// import '../components/my_textfield.dart';
// import '../components/button.dart';
// import 'core/update_profile_new.dart';

class InquiryNews extends StatefulWidget {

  const InquiryNews({super.key});

  @override
  State<InquiryNews> createState() => _InquiryNews();
}

class _InquiryNews extends State<InquiryNews> {

  final dateTimecontroller = Get.put(TimeSavedParser());

  final controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
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
                  'Pilih Portal berita yang mau di inquiry!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                // DISINI BUAT BUTTON
                // 1. ANTARA
                GestureDetector(
                  onTap: (){

                    /// Untuk dapetin list favorit
                    // print("email yang didapat ${AuthenticationRepository.instance.getUserEmail}");
                    // List<int> daftarScore = [0];
                    // daftarScore = UserRepository.instance.getListScore();
                    // if(daftarScore.length.isLowerThan(2)){
                    //   UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
                    // }
                    // print("Total score ${daftarScore.length}");
                    // for(int i=0; i<daftarScore.length; i++){
                    //   print("List Score yang di dapat adalah : ${daftarScore[i]}");
                    //   if(daftarScore[i].isGreaterThan(900)){
                    //     print("List Score yang favorit ada di index ${i}");
                    //   }
                    // }
                    // if(daftarScore.length != 38){
                    //   UserRepository.instance.resetListScore();
                    // }
                    // UserRepository.instance.get



                    Get.to(()=>const InquiryNewsAnatara());
                    
                    // SignUpController.instace.logout();
                    // AuthenticationRepository.instance.logout();
                  },

                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Antara",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // 2. CNN
                GestureDetector(
                  onTap: (){

                    Get.to(()=>const InquiryNewsCNN());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("CNN",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // 3. CNBC
                GestureDetector(
                  onTap: (){

                    Get.to(()=>const InquiryNewsCNBC());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("CNBC",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),


                // 4. Merdeka
                GestureDetector(
                  onTap: (){

                    Get.to(()=>const InquiryNewsMerdeka());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Merdeka",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),


                // 5. Okezone
                GestureDetector(
                  onTap: (){

                    Get.to(()=>const InquiryNewsOkezone());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Okezone",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),


                // 6. Republika
                GestureDetector(
                  onTap: (){

                    Get.to(()=>const InquiryNewsRepublika());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Republika",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),


                // 7. Sindo News
                GestureDetector(
                  onTap: (){

                    Get.to(()=>const InquiryNewsSindoNews());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Sindo News",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),


                // 8. Suara
                GestureDetector(
                  onTap: (){

                    Get.to(()=>const InquiryNewsSuara());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Suara",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),


                // 9. Tempo
                GestureDetector(
                  onTap: (){

                    Get.to(()=>const InquiryNewsTempo());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Tempo",
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