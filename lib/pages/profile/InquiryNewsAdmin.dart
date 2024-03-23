import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/pages/components/button.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/bola/InquiryNewsAntaraBola.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/dunia/InquiryNewsAntaraDunia.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/ekonomi/InquiryNewsAntaraEkonomi.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/hiburan/InquiryNewsAntaraHiburan.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/hukum/InquiryNewsAntaraHukum.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/humaniora/InquiryNewsAntaraHumaniora.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/lifestyle/InquiryNewsAntaraLifeStyle.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/olahraga/InquiryAntaraNewsOlahraga.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/otomotif/InquiryAntaraNewsOtomotif.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/politik/InquiryAntaraNewsPolitik.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/tekno/InquiryAntaraNewsTeknologi.dart';
import 'package:skripsilocal/src/NewsDirect/CNBC/entrepreneur/inquiryNewsCNBCEntrepreneur.dart';
import 'package:skripsilocal/src/NewsDirect/CNBC/lifestyle/inquiryNewCNBCLifeStyle.dart';
import 'package:skripsilocal/src/NewsDirect/CNBC/market/inquiryNewsCNBCMarket.dart';
import 'package:skripsilocal/src/NewsDirect/CNBC/news/inquiryNewsCNBCNews.dart';
import 'package:skripsilocal/src/NewsDirect/CNBC/opini/inquiryNewsCNBCOpini.dart';
import 'package:skripsilocal/src/NewsDirect/CNBC/syariah/inquiryNewsCNBCSyariah.dart';
import 'package:skripsilocal/src/NewsDirect/CNBC/tech/inquiryNewsCNBCTech.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/ekonomi/InquiryNewsCNNEkonomi.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/hiburan/InquiryNewsCNNHiburan.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/internasional/InquiryNewsCNNInternasional.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/nasional/inquiryNewsCNNNasional.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/olahraga/InquiryNewsCNNOlahraga.dart';
import 'package:skripsilocal/src/NewsDirect/CNN/teknologi/InquiryNewsCNNTeknologi.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/dunia/inquiryNewsMerdekaDunia.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/gaya/inquiryNewsMerdekaGaya.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/jakarta/inquiryNewsMerdekaJakarta.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/jateng/inquiryNewsMerdekaJateng.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/khas/inquiryNewsMerdekaKhas.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/olahraga/inquiryNewsMerdekaOlahraga.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/otomotif/inquiryNewsMerdekaOtomotif.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/sehat/inquiryNewsMerdekaSehat.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/teknologi/inquiryNewsMerdekaTeknologi.dart';
import 'package:skripsilocal/src/NewsDirect/Okezone/celebrity/inquiryNewsOkezoneCelebrity.dart';
import 'package:skripsilocal/src/NewsDirect/Okezone/economy/inquiryNewsOkezoneEconomy.dart';
import 'package:skripsilocal/src/NewsDirect/Okezone/lifestyle/inquiryNewsOkezoneLifestyle.dart';
import 'package:skripsilocal/src/NewsDirect/Okezone/otomotif/inquiryNewsOkezoneOtomotif.dart';
import 'package:skripsilocal/src/NewsDirect/Okezone/sports/inquiryNewsOkezoneSports.dart';
import 'package:skripsilocal/src/NewsDirect/Okezone/techno/inquiryNewsOkezoneTechno.dart';
import 'package:skripsilocal/src/NewsDirect/Republika/bola/inquiryNewsRepublikaBola.dart';
import 'package:skripsilocal/src/NewsDirect/Republika/daerah/inquiryNewsRepublikaDaerah.dart';
import 'package:skripsilocal/src/NewsDirect/Republika/internasional/inquiryNewsRepublikaInternasional.dart';
import 'package:skripsilocal/src/NewsDirect/Republika/islam/inquiryNewsRepublikaIslam.dart';
import 'package:skripsilocal/src/NewsDirect/Republika/khazanah/inquiryNewsRepublikaKhazanah.dart';
import 'package:skripsilocal/src/NewsDirect/Republika/leisure/inquiryNewsRepublikaLeisure.dart';
import 'package:skripsilocal/src/NewsDirect/Republika/news/inquiryNewsRepublikaNews.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/daerah/inquiryNewsSindoNewsDaerah.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/edukasi/inquiryNewsSindoNewsEdukasi.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/ekbis/inquiryNewsSindoNewsEkbis.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/international/inquiryNewsSindoNewsInternational.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/kalam/inquiryNewsSindoNewsKalam.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/lifestyle/inquiryNewsSindoNewsLifeStyle.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/metro/inquiryNewsSindoNewsMetro.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/nasional/inquiryNewsSindoNewsNasional.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/otomotif/inquiryNewsSindoNewsOtomotif.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/sains/inquiryNewsSindoNewsSains.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/sports/inquiryNewsSindoNewsSports.dart';
import 'package:skripsilocal/src/NewsDirect/SindoNews/tekno/inquiryNewsSindoNewsTekno.dart';
import 'package:skripsilocal/src/NewsDirect/Suara/bisnis/inquiryNewsSuaraBisnis.dart';
import 'package:skripsilocal/src/NewsDirect/Suara/bola/inquiryNewsSuaraBola.dart';
import 'package:skripsilocal/src/NewsDirect/Suara/entertainment/inquiryNewsSuaraEntertainment.dart';
import 'package:skripsilocal/src/NewsDirect/Suara/health/inquiryNewsSuaraHealth.dart';
import 'package:skripsilocal/src/NewsDirect/Suara/lifestyle/inquiryNewsSuaraLifeStyle.dart';
import 'package:skripsilocal/src/NewsDirect/Suara/otomotif/inquiryNewsSuaraOtomotif.dart';
import 'package:skripsilocal/src/NewsDirect/Suara/tekno/inquiryNewsSuaraTekno.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/bisnis/inquiryNewsTempoBisnis.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/bola/inquiryNewsTempoBola.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/cantik/inquiryNewsTempoCantik.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/creativelab/inquiryNewsTempoCreativeLab.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/difabel/inquiryNewsTempoDifabel.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/dunia/inquiryNewsTempoDunia.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/event/inquiryNewsTempoEvent.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/gaya/inquiryNewsTempoGaya.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/inforial/inquiryNewsTempoInforial.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/metro/inquiryNewsTempoMetro.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/nasional/inquiryNewsTempoNasional.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/otomotif/inquiryNewsTempoOtomotif.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/seleb/inquiryNewsTempoSeleb.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/tekno/inquiryNewsTempoTekno.dart';
import 'package:skripsilocal/src/NewsDirect/Tempo/travel/inquiryNewsTempoTravel.dart';

class InquiryNews extends StatefulWidget {
  const InquiryNews({Key? key}) : super(key: key);

  @override
  State<InquiryNews> createState() => _InquiryNewsState();
}

class _InquiryNewsState extends State<InquiryNews> {
  int selectedIndex = 0;
  int selectedSecondIndex = 0;

  List<String> portal = [
    'Antara', 'CNN', 'CNBC', 'Merdeka', 'Okezone', 'Republika', 'Sindo News', 'Suara', 'Tempo'
  ];
  List<List<String>> kategori = [
    ['Politik', 'Otomotif', 'Olahraga', 'Lifestyle', 'Humaniora', 'Hukum', 'Hiburan', 'Ekonomi', 'Internasional', 'Bola', 'Teknologi'],
    ['Nasional', 'Internasional', 'Ekonomi', 'Olahraga', 'Teknologi', 'Hiburan'],
    ['News', 'Market', 'Enterpreneur', 'Syariah', 'Teknologi', 'Lifestyle', 'Opini'],
    ['Jakarta', 'Dunia', 'Gaya', 'Olahrga', 'Teknologi', 'Otomotif', 'Khas', 'Sehat','Jawa Tengah'],
    ['Celebrity', 'Olahraga', 'Otomotif', 'Ekonomi', 'Teknologi', 'Lifestyle'],
    ['News', 'Daerah', 'Khazanah', 'Islam', 'Internasional', 'Bola', 'Leisure'],
    ['Nasional', 'Metro', 'Ekbis', 'Internasional', 'Daerah', 'Olahraga', 'Otomotif', 'Teknologi', 'Sains', 'Edukasi', 'Lifestyle', 'Kalam'],
    ['Bisnis', 'Bola', 'Lifestyle', 'Entertainment', 'Otomotif', 'Teknologi', 'Kesehatan'],
    ['Nasional', 'Bisnis', 'Metro', 'Dunia', 'Bola', 'Kecatikan', 'Teknologi', 'Otomotif', 'Celebrity', 'Style', 'Travel', 'Difabel', 'Creative Lab', 'Inforial', 'Event']
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.jpg',
                  width: 200,
                  height: 200,
                ),
                const Text(
                  'Update news dulu!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Portal Berita :',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    value: portal[selectedIndex],
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedIndex = portal.indexOf(newValue);
                        });
                      }
                    },
                    items: portal.map<DropdownMenuItem<String>>((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    buttonStyleData: ButtonStyleData(
                      height: 60,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 16,
                      iconEnabledColor: Colors.black,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 60,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kategori Berita :',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (selectedIndex >= 0 && selectedIndex < kategori.length)
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      value: kategori[selectedIndex][selectedSecondIndex],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedSecondIndex = kategori[selectedIndex].indexOf(newValue);
                          });
                        }
                      },
                      items: kategori[selectedIndex].map<DropdownMenuItem<String>>((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      buttonStyleData: ButtonStyleData(
                        height: 60,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 16,
                        iconEnabledColor: Colors.black,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 60,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(10),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                theButton(
                    text: 'Submit',
                    onTap: (){
                      handleSubmit(selectedIndex, selectedSecondIndex);
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleSubmit(firstIndex, secondIndex){
    print(firstIndex);
    print(secondIndex);
    if(firstIndex == 0){
      if(secondIndex == 0){
        Get.to(()=> InquiryAntaraNewsPolitik());
      }
      else if(secondIndex == 1){
        Get.to(()=> InquiryAntaraNewsOtomotif());
      }
      else if(secondIndex == 2){
        Get.to(()=> InquiryAntaraNewsOlahraga());
      }
      else if(secondIndex == 3){
      Get.to(()=> InquiryAntaraNewsLifeStyle());
      }
      else if(secondIndex == 4){
      Get.to(()=> InquiryAntaraNewsHumaniora());
      }
      else if(secondIndex == 5){
        Get.to(()=> InquiryAntaraNewsHukum());
      }
      else if(secondIndex == 6){
        Get.to(()=> InquiryAntaraNewsHiburan());
      }
      else if(secondIndex == 7){
        Get.to(()=> InquiryAntaraNewsEkonomi());
      }
      else if(secondIndex == 8){
        Get.to(()=> InquiryAntaraNewsInternasional());
      }
      else if(secondIndex == 9){
        Get.to(()=> InquiryAntaraNewsBola());
      }
      else if(secondIndex == 10){
        Get.to(()=> InquiryAntaraNewsTeknologi());
      }
    }
    else if(firstIndex == 1){
      if(secondIndex == 0){
        Get.to(()=> InquiryCNNNewsNasional());
      }
      else if(secondIndex == 1){
        Get.to(()=> InquiryCNNNewsInternasional());
      }
      else if(secondIndex == 2){
        Get.to(()=> InquiryCNNNewsEkonomi());
      }
      else if(secondIndex == 3){
        Get.to(()=> InquiryCNNNewsOlahraga());
      }
      else if(secondIndex == 4){
        Get.to(()=> InquiryCNNNewsTeknologi());
      }
      else if(secondIndex == 5){
        Get.to(()=> InquiryCNNNewsHiburan());
      }
    }
    else if(firstIndex == 2){
      if(secondIndex == 0){
        Get.to(()=> InquiryCNBCNewsNews());
      }
      else if(secondIndex == 1){
        Get.to(()=> InquiryCNBCNewsMarket());
      }
      else if(secondIndex == 2){
        Get.to(()=> InquiryCNBCNewsEntrepreneur());
      }
      else if(secondIndex == 3){
        Get.to(()=> InquiryCNBCNewsSyariah());
      }
      else if(secondIndex == 4){
        Get.to(()=> InquiryCNBCNewsTech());
      }
      else if(secondIndex == 5){
        Get.to(()=> InquiryCNBCNewsLifeStyle());
      }
      else if(secondIndex == 6){
        Get.to(()=> InquiryCNBCNewsOpini());
      }
    }
    else if(firstIndex == 3){
      if(secondIndex == 0){
        Get.to(()=> InquiryMerdekaNewsJakarta());
      }
      else if(secondIndex == 1){
        Get.to(()=> InquiryMerdekaNewsDunia());
      }
      else if(secondIndex == 2){
        Get.to(()=> InquiryMerdekaNewsGaya());
      }
      else if(secondIndex == 3){
        Get.to(()=> InquiryMerdekaNewsOlahraga());
      }
      else if(secondIndex == 4){
        Get.to(()=> InquiryMerdekaNewsTeknologi());
      }
      else if(secondIndex == 5){
        Get.to(()=> InquiryMerdekaNewsOtomotif());
      }
      else if(secondIndex == 6){
        Get.to(()=> InquiryMerdekaNewsKhas());
      }
      else if(secondIndex == 7){
        Get.to(()=> InquiryMerdekaNewsSehat());
      }
      else if(secondIndex == 8){
        Get.to(()=> InquiryMerdekaNewsJateng());
      }
    }
    else if(firstIndex == 4){
      if(secondIndex == 0){
        Get.to(()=> InquiryOkezoneNewsCelebrity());
      }
      else if(secondIndex == 1){
        Get.to(()=> InquiryOkezoneNewsSports());
      }
      else if(secondIndex == 2){
        Get.to(()=> InquiryOkezoneNewsOtomotif());
      }
      else if(secondIndex == 3){
        Get.to(()=> InquiryOkezoneNewsEconomy());
      }
      else if(secondIndex == 4){
        Get.to(()=> InquiryOkezoneNewsTechno());
      }
      else if(secondIndex == 5){
        Get.to(()=> InquiryOkezoneNewsLifeStyle());
      }
    }
    else if(firstIndex == 5){
      if(secondIndex == 0){
        Get.to(()=> InquiryRepublikaNewsNews());
      }
      else if(secondIndex == 1){
        Get.to(()=> InquiryRepublikaNewsDaerah());
      }
      else if(secondIndex == 2){
        Get.to(()=> InquiryRepublikaNewsKhazanah());
      }
      else if(secondIndex == 3){
        Get.to(()=> InquiryRepublikaNewsIslam());
      }
      else if(secondIndex == 4){
        Get.to(()=> InquiryRepublikaNewsInternasional());
      }
      else if(secondIndex == 5){
        Get.to(()=> InquiryRepublikaNewsBola());
      }
      else if(secondIndex == 6){
        Get.to(()=> InquiryRepublikaNewsLeisure());
      }
    }
    else if(firstIndex == 6){
      if(secondIndex == 0){
        Get.to(()=> InquirySindoNewsNasional());
      }
      else if(secondIndex == 1){
        Get.to(()=> InquirySindoNewsMetro());
      }
      else if(secondIndex == 2){
        Get.to(()=> InquirySindoNewsEkbis());
      }
      else if(secondIndex == 3){
        Get.to(()=> InquirySindoNewsInternational());
      }
      else if(secondIndex == 4){
        Get.to(()=> InquirySindoNewsDaerah());
      }
      else if(secondIndex == 5){
        Get.to(()=> InquirySindoNewsSports());
      }
      else if(secondIndex == 6){
        Get.to(()=> InquirySindoNewsOtomotif());
      }
      else if(secondIndex == 7){
        Get.to(()=> InquirySindoNewsTekno());
      }
      else if(secondIndex == 8){
        Get.to(()=> InquirySindoNewsSains());
      }
      else if(secondIndex == 9){
        Get.to(()=> InquirySindoNewsEdukasi());
      }
      else if(secondIndex == 10){
        Get.to(()=> InquirySindoNewsLifeStyle());
      }
      else if(secondIndex == 11){
        Get.to(()=> InquirySindoNewsKalam());
      }
    }
    else if(firstIndex == 7){
      if(secondIndex == 0){
        Get.to(()=> InquirySuaraNewsBisnis());
      }
      else if(secondIndex == 1){
        Get.to(()=> InquirySuaraNewsBola());
      }
      else if(secondIndex == 2){
        Get.to(()=> InquirySuaraNewsLifeStyle());
      }
      else if(secondIndex == 3){
        Get.to(()=> InquirySuaraNewsEntertainment());
      }
      else if(secondIndex == 4){
        Get.to(()=> InquirySuaraNewsOtomotif());
      }
      else if(secondIndex == 5){
        Get.to(()=> InquirySuaraNewsTekno());
      }
      else if(secondIndex == 6){
        Get.to(()=> InquirySuaraNewsHealth());
      }
    }
    else if(firstIndex == 8){
      if(secondIndex == 0){
        Get.to(()=> InquiryTempoNewsNasional());
      }
      else if(secondIndex == 1){
        Get.to(()=> InquiryTempoNewsBisnis());
      }
      else if(secondIndex == 2){
        Get.to(()=> InquiryTempoNewsMetro());
      }
      else if(secondIndex == 3){
        Get.to(()=> InquiryTempoNewsDunia());
      }
      else if(secondIndex == 4){
        Get.to(()=> InquiryTempoNewsBola());
      }
      else if(secondIndex == 5){
        Get.to(()=> InquiryTempoNewsCantik());
      }
      else if(secondIndex == 6){
        Get.to(()=> InquiryTempoNewsTekno());
      }
      else if(secondIndex == 7){
        Get.to(()=> InquiryTempoNewsOtomotif());
      }
      else if(secondIndex == 8){
        Get.to(()=> InquiryTempoNewsSeleb());
      }
      else if(secondIndex == 9){
        Get.to(()=> InquiryTempoNewsGaya());
      }
      else if(secondIndex == 10){
        Get.to(()=> InquiryTempoNewsTravel());
      }
      else if(secondIndex == 11){
        Get.to(()=> InquiryTempoNewsDifabel());
      }
      else if(secondIndex == 12){
        Get.to(()=> InquiryTempoNewsCreativeLab());
      }
      else if(secondIndex == 13){
        Get.to(()=> InquiryTempoNewsInforial());
      }
      else if(secondIndex == 14){
        Get.to(()=> InquiryTempoNewsEvent());
      }
    }
  }
}
