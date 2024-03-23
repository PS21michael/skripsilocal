import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/core/cnn_news_repository.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/ekonomi/InquiryNewsCNNEkonomi.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/hiburan/InquiryNewsCNNHiburan.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/internasional/InquiryNewsCNNInternasional.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/nasional/inquiryNewsCNNNasional.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/olahraga/InquiryNewsCNNOlahraga.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/teknologi/InquiryNewsCNNTeknologi.dart';
import '../../../../Utils/TimeSavedNews.dart';

class InquiryNewsCNN extends StatefulWidget {

  const InquiryNewsCNN({super.key});

  @override
  State<InquiryNewsCNN> createState() => _InquiryNewsCNN();
}

class _InquiryNewsCNN extends State<InquiryNewsCNN> {

  final dateTimecontroller = Get.put(TimeSavedParser());

  final newsRepo = Get.put(CNNNewsRepository());

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
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSavedNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNNNewsNasional());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Nasional",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 2. Otomotif
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSavedNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNNNewsInternasional());
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

                // 3. Olahraga
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSavedNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNNNewsEkonomi());
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

                // 4. Life Style
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSavedNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNNNewsOlahraga());
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

                // 5. Humaniora
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSavedNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNNNewsTeknologi());
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

                // 6. Hukum
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSavedNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    CNNNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryCNNNewsHiburan());
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



                const SizedBox(height: 10),
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