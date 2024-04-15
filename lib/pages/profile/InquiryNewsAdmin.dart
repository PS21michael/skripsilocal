import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/pages/components/InquiryAdminHeader.dart';
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
import '../../Utils/timeSavedNews.dart';
import '../../controller/signin_controller.dart';
import '../../src/NewsDirect/Antara/Core/antara_news_repository.dart';
import '../../src/NewsDirect/CNBC/core/cnbc_news_repository.dart';
import '../../src/NewsDirect/CNN/core/cnn_news_repository.dart';
import '../../src/NewsDirect/Merdeka/core/merdeka_news_repository.dart';
import '../../src/NewsDirect/Okezone/core/okezone_news_repository.dart';
import '../../src/NewsDirect/Republika/core/republika_news_repository.dart';
import '../../src/NewsDirect/SindoNews/core/sindo_news_repository.dart';
import '../../src/NewsDirect/Suara/core/suara_news_repository.dart';
import '../../src/NewsDirect/Tempo/core/tempo_news_repository.dart';

class InquiryNews extends StatefulWidget {
  const InquiryNews({Key? key}) : super(key: key);

  @override
  State<InquiryNews> createState() => _InquiryNewsState();
}

class _InquiryNewsState extends State<InquiryNews> {
  final dateTimecontroller = Get.put(PeriodSavedParser());
  int selectedIndex = 0;
  int selectedSecondIndex = 0;
  final newsRepoAntara = Get.put(AntaraNewsRepository());
  final newsRepoCNN = Get.put(CNNNewsRepository());
  final newsRepoCNBC = Get.put(CNBCNewsRepository());
  final newsRepoMerdeka = Get.put(MerdekaNewsRepository());
  final newsRepoOkezone = Get.put(OkezoneNewsRepository());
  final newsRepoRepublika = Get.put(RepublikaNewsRepository());
  final newsRepoSindo = Get.put(SindoNewsRepository());
  final newsRepoSuara = Get.put(SuaraNewsRepository());
  final newsRepoTempo = Get.put(TempoNewsRepository());


  final controller = Get.put(SignInController());

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
    DateTime tets = DateTime.now();
    String montValue = dateTimecontroller.montParser(tets.month.toInt());
    String tanggalToday = "${tets.day} $montValue ${tets.year}";
    int monthNumber = dateTimecontroller.periodSaver(tanggalToday);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: const InquiryAdminHeader(),
        body: Center(
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
                const Padding(
                  padding: EdgeInsets.only(left: 50),
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
                                style: const TextStyle(color: Colors.black),
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
                const Padding(
                  padding: EdgeInsets.only(left: 50),
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
                                  style: const TextStyle(color: Colors.black),
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
                TheButton(
                    text: 'Lanjut',
                    onTap: (){
                      handleSubmit(selectedIndex, selectedSecondIndex, monthNumber);
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> handleSubmit(firstIndex, secondIndex, int monthNumber) async {
    // print(firstIndex);
    // print(secondIndex);
    if(firstIndex == 0){
      if(secondIndex == 0){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsPolitik());
      }
      else if(secondIndex == 1){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsOtomotif());
      }
      else if(secondIndex == 2){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsOlahraga());
      }
      else if(secondIndex == 3){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsLifeStyle());
      }
      else if(secondIndex == 4){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsHumaniora());
      }
      else if(secondIndex == 5){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsHukum());
      }
      else if(secondIndex == 6){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsHiburan());
      }
      else if(secondIndex == 7){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsEkonomi());
      }
      else if(secondIndex == 8){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsInternasional());
      }
      else if(secondIndex == 9){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsBola());
      }
      else if(secondIndex == 10){
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        AntaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryAntaraNewsTeknologi());
      }
    }
    else if(firstIndex == 1){
      if(secondIndex == 0){
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNNNewsNasional());
      }
      else if(secondIndex == 1){
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNNNewsInternasional());
      }
      else if(secondIndex == 2){
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNNNewsEkonomi());
      }
      else if(secondIndex == 3){
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNNNewsOlahraga());
      }
      else if(secondIndex == 4){
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNNNewsTeknologi());
      }
      else if(secondIndex == 5){
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNNNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNNNewsHiburan());
      }
    }
    else if(firstIndex == 2){
      if(secondIndex == 0){
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNBCNewsNews());
      }
      else if(secondIndex == 1){
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNBCNewsMarket());
      }
      else if(secondIndex == 2){
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNBCNewsEntrepreneur());
      }
      else if(secondIndex == 3){
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNBCNewsSyariah());
      }
      else if(secondIndex == 4){
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNBCNewsTech());
      }
      else if(secondIndex == 5){
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNBCNewsLifeStyle());
      }
      else if(secondIndex == 6){
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        CNBCNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryCNBCNewsOpini());
      }
    }
    else if(firstIndex == 3){
      if(secondIndex == 0){
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryMerdekaNewsJakarta());
      }
      else if(secondIndex == 1){
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryMerdekaNewsDunia());
      }
      else if(secondIndex == 2){
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryMerdekaNewsGaya());
      }
      else if(secondIndex == 3){
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryMerdekaNewsOlahraga());
      }
      else if(secondIndex == 4){
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryMerdekaNewsTeknologi());
      }
      else if(secondIndex == 5){
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryMerdekaNewsOtomotif());
      }
      else if(secondIndex == 6){
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryMerdekaNewsKhas());
      }
      else if(secondIndex == 7){
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryMerdekaNewsSehat());
      }
      else if(secondIndex == 8){
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        MerdekaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryMerdekaNewsJateng());
      }
    }
    else if(firstIndex == 4){
      if(secondIndex == 0){
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryOkezoneNewsCelebrity());
      }
      else if(secondIndex == 1){
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryOkezoneNewsSports());
      }
      else if(secondIndex == 2){
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryOkezoneNewsOtomotif());
      }
      else if(secondIndex == 3){
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryOkezoneNewsEconomy());
      }
      else if(secondIndex == 4){
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryOkezoneNewsTechno());
      }
      else if(secondIndex == 5){
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        OkezoneNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryOkezoneNewsLifeStyle());
      }
    }
    else if(firstIndex == 5){
      if(secondIndex == 0){
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryRepublikaNewsNews());
      }
      else if(secondIndex == 1){
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryRepublikaNewsDaerah());
      }
      else if(secondIndex == 2){
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryRepublikaNewsKhazanah());
      }
      else if(secondIndex == 3){
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryRepublikaNewsIslam());
      }
      else if(secondIndex == 4){
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryRepublikaNewsInternasional());
      }
      else if(secondIndex == 5){
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryRepublikaNewsBola());
      }
      else if(secondIndex == 6){
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryRepublikaNewsLeisure());
      }
    }
    else if(firstIndex == 6){
      if(secondIndex == 0){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsNasional());
      }
      else if(secondIndex == 1){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsMetro());
      }
      else if(secondIndex == 2){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsEkbis());
      }
      else if(secondIndex == 3){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsInternational());
      }
      else if(secondIndex == 4){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsDaerah());
      }
      else if(secondIndex == 5){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsSports());
      }
      else if(secondIndex == 6){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsOtomotif());
      }
      else if(secondIndex == 7){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsTekno());
      }
      else if(secondIndex == 8){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsSains());
      }
      else if(secondIndex == 9){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsEdukasi());
      }
      else if(secondIndex == 10){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsLifeStyle());
      }
      else if(secondIndex == 11){
        await Future.delayed(const Duration(milliseconds: 100));
        SindoNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        RepublikaNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySindoNewsKalam());
      }
    }
    else if(firstIndex == 7){
      if(secondIndex == 0){
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySuaraNewsBisnis());
      }
      else if(secondIndex == 1){
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySuaraNewsBola());
      }
      else if(secondIndex == 2){
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySuaraNewsLifeStyle());
      }
      else if(secondIndex == 3){
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySuaraNewsEntertainment());
      }
      else if(secondIndex == 4){
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySuaraNewsOtomotif());
      }
      else if(secondIndex == 5){
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySuaraNewsTekno());
      }
      else if(secondIndex == 6){
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriodNull();
        await Future.delayed(const Duration(milliseconds: 100));
        SuaraNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquirySuaraNewsHealth());
      }
    }
    else if(firstIndex == 8){
      if(secondIndex == 0){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsNasional());
      }
      else if(secondIndex == 1){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsBisnis());
      }
      else if(secondIndex == 2){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsMetro());
      }
      else if(secondIndex == 3){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsDunia());
      }
      else if(secondIndex == 4){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsBola());
      }
      else if(secondIndex == 5){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsCantik());
      }
      else if(secondIndex == 6){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsTekno());
      }
      else if(secondIndex == 7){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsOtomotif());
      }
      else if(secondIndex == 8){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsSeleb());
      }
      else if(secondIndex == 9){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));

        Get.to(()=> const InquiryTempoNewsGaya());
      }
      else if(secondIndex == 10){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsTravel());
      }
      else if(secondIndex == 11){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsDifabel());
      }
      else if(secondIndex == 12){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsCreativeLab());
      }
      else if(secondIndex == 13){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsInforial());
      }
      else if(secondIndex == 14){
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriodNULL();
        await Future.delayed(const Duration(milliseconds: 100));
        TempoNewsRepository.instance.setCountPeriod(monthNumber);
        await Future.delayed(const Duration(milliseconds: 100));
        Get.to(()=> const InquiryTempoNewsEvent());
      }
    }
  }
}
