import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/NewsDirect/Suara/core/suara_news_repository.dart';
import '../../../../Utils/TimeSavedNews.dart';
import '../bisnis/inquiryNewsSuaraBisnis.dart';
import '../bola/inquiryNewsSuaraBola.dart';
import '../entertainment/inquiryNewsSuaraEntertainment.dart';
import '../health/inquiryNewsSuaraHealth.dart';
import '../lifestyle/inquiryNewsSuaraLifeStyle.dart';
import '../otomotif/inquiryNewsSuaraOtomotif.dart';
import '../tekno/inquiryNewsSuaraTekno.dart';

class InquiryNewsSuara extends StatefulWidget {

  const InquiryNewsSuara({super.key});

  @override
  State<InquiryNewsSuara> createState() => _InquiryNewsSuara();
}

class _InquiryNewsSuara extends State<InquiryNewsSuara> {

  final dateTimecontroller = Get.put(PeriodSavedParser());

  final newsRepo = Get.put(SuaraNewsRepository());

  @override
  Widget build(BuildContext context) {
    DateTime tets = DateTime.now();
    String montValue = dateTimecontroller.montParser(tets.month.toInt());
    String tanggalToday = tets.day.toString()+" "+montValue+" "+tets.year.toString();
    int monthNumber = dateTimecontroller.periodSaver(tanggalToday);

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

                // 1. BISNIS
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquirySuaraNewsBisnis());
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

                // 2. BOLA
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquirySuaraNewsBola());
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

                // 3. LIFESTYLE
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquirySuaraNewsLifeStyle());
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

                // 4. ENTERTAINMENT
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquirySuaraNewsEntertainment());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Entertainment",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 5. OTOMOTIF
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquirySuaraNewsOtomotif());
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

                // 6. TEKNO
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquirySuaraNewsTekno());
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

                // 7. HEALTH
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    SuaraNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquirySuaraNewsHealth());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Health",
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