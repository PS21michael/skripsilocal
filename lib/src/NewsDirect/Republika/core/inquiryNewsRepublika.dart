import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/NewsDirect/Republika/core/republika_news_repository.dart';
import '../../../../Utils/TimeSavedNews.dart';
import '../bola/inquiryNewsRepublikaBola.dart';
import '../daerah/inquiryNewsRepublikaDaerah.dart';
import '../internasional/inquiryNewsRepublikaInternasional.dart';
import '../islam/inquiryNewsRepublikaIslam.dart';
import '../khazanah/inquiryNewsRepublikaKhazanah.dart';
import '../leisure/inquiryNewsRepublikaLeisure.dart';
import '../news/inquiryNewsRepublikaNews.dart';

class InquiryNewsRepublika extends StatefulWidget {

  const InquiryNewsRepublika({super.key});

  @override
  State<InquiryNewsRepublika> createState() => _InquiryNewsRepublika();
}

class _InquiryNewsRepublika extends State<InquiryNewsRepublika> {

  final dateTimecontroller = Get.put(PeriodSavedParser());

  final newsRepo = Get.put(RepublikaNewsRepository());

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

                // 1. NEWS
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquiryRepublikaNewsNews());
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

                // 2. DAERAH
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquiryRepublikaNewsDaerah());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Daerah",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 3. KHAZANAH
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquiryRepublikaNewsKhazanah());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Khazanah",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 4. ISLAM
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquiryRepublikaNewsIslam());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Islam",
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                // 5. INTERNASIONAL
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquiryRepublikaNewsInternasional());
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

                // 6. BOLA
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquiryRepublikaNewsBola());
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

                // 7. LEISURE
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()async{
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriodNull();
                    await Future.delayed(Duration(milliseconds: 100));
                    RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
                    Get.to(()=>const InquiryRepublikaNewsLeisure());
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text("Leisure",
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