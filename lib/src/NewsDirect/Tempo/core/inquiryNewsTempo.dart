import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/core/tempo_news_repository.dart';
import '../../../../Utils/TimeSavedNews.dart';
import '../bisnis/inquiryNewsTempoBisnis.dart';
import '../bola/inquiryNewsTempoBola.dart';
import '../cantik/inquiryNewsTempoCantik.dart';
import '../creativelab/inquiryNewsTempoCreativeLab.dart';
import '../difabel/inquiryNewsTempoDifabel.dart';
import '../dunia/inquiryNewsTempoDunia.dart';
import '../event/inquiryNewsTempoEvent.dart';
import '../gaya/inquiryNewsTempoGaya.dart';
import '../inforial/inquiryNewsTempoInforial.dart';
import '../metro/inquiryNewsTempoMetro.dart';
import '../nasional/inquiryNewsTempoNasional.dart';
import '../otomotif/inquiryNewsTempoOtomotif.dart';
import '../seleb/inquiryNewsTempoSeleb.dart';
import '../tekno/inquiryNewsTempoTekno.dart';
import '../travel/inquiryNewsTempoTravel.dart';

class InquiryNewsTempo extends StatefulWidget {

  const InquiryNewsTempo({super.key});

  @override
  State<InquiryNewsTempo> createState() => _InquiryNewsTempo();
}

class _InquiryNewsTempo extends State<InquiryNewsTempo> {

  final dateTimecontroller = Get.put(TimeSavedParser());

  final newsRepo = Get.put(TempoNewsRepository());

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

                // 1. NASIONAL
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsNasional());
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

                // 2. BISNIS
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsBisnis());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Bisnis",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 3. METRO
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsMetro());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Metro",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 4. DUNIA
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsDunia());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Dunia",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 5. BOLA
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsBola());
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

                // 6. CANTIK
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsCantik());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Cantik",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 7. TEKNO
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsTekno());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Tekno",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),


                // 8. OTOMOTIF
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsOtomotif());
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

                // 9. SELEB
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsSeleb());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Seleb",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),


                // 10. GAYA
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsGaya());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Gaya",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),


                // 11. TRAVEL
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsTravel());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Travel",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),


                // 12. DIFABEL
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsDifabel());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Difabel",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 13. CREATIVE LAB
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsCreativeLab());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Creative Lab",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 14. INFORIAL
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsInforial());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Inforial",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 15. EVENT
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSavedNULL();
                    await Future.delayed(Duration(milliseconds: 100));
                    TempoNewsRepository.instance.setDateSaved(monthNumber);
                    Get.to(()=>const InquiryTempoNewsEvent());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Event",
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