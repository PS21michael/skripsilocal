
import 'package:get/get.dart';

class CategoryListParser extends GetxController{

  static CategoryListParser get instance => Get.find();

  String kategori1 = "Nasional";
  String kategori2 = "Bisnis";
  String kategori3 = "Politik";
  String kategori4 = "Hukum";
  String kategori5 = "Ekonomi";
  String kategori6 = "Olahraga";
  String kategori7 = "Teknologi";
  String kategori8 = "Otomotif";
  String kategori9 = "Internasional";
  String kategori10 = "Bola";
  String kategori11 = "Selebritis";
  String kategori12 = "Lifestyle";
  String kategori13 = "Hiburan";
  String kategori14 = "Jakarta";
  String kategori15 = "Market";
  String kategori16 = "News";
  String kategori17 = "Cantik";
  String kategori18 = "Travel";
  String kategori19 = "Syariah";
  String kategori20 = "Islam";
  String kategori21 = "Sains";
  String kategori22 = "Edukasi";
  String kategori23 = "Kesehatan";
  String kategori24 = "Humaniora";
  String kategori25 = "Entrepreneur";
  String kategori26 = "Opini";
  String kategori27 = "Khas";
  String kategori28 = "Jateng";
  String kategori29 = "Daerah";
  String kategori30 = "Khazanah";
  String kategori31 = "Leisure";
  String kategori32 = "Metro";
  String kategori33 = "Ekbis";
  String kategori34 = "Kalam";
  String kategori35 = "Difabel";
  String kategori36 = "Creativelab";
  String kategori37 = "Inforial";
  String kategori38 = "Event";

  int index1 = 1;
  int index2 = 2;
  int index3 = 3;
  int index4 = 4;
  int index5 = 5;
  int index6 = 6;
  int index7 = 7;
  int index8 = 8;
  int index9 = 9;
  int index10 = 10;
  int index11 = 11;
  int index12 = 12;
  int index13 = 13;
  int index14 = 14;
  int index15 = 15;
  int index16 = 16;
  int index17 = 17;
  int index18 = 18;
  int index19 = 19;
  int index20 = 20;
  int index21 = 21;
  int index22 = 22;
  int index23 = 23;
  int index24 = 24;
  int index25 = 25;
  int index26 = 26;
  int index27 = 27;
  int index28 = 28;
  int index29 = 29;
  int index30 = 30;
  int index31 = 31;
  int index32 = 32;
  int index33 = 33;
  int index34 = 34;
  int index35 = 35;
  int index36 = 36;
  int index37 = 37;
  int index38 = 38;

  int listToScore (String list){
    if(list == kategori1){
      return index1;
    } else if(list == kategori2){
      return index2;
    }else if(list == kategori3){
      return index3;
    }else if(list == kategori4){
      return index4;
    }else if(list == kategori5){
      return index5;
    }else if(list == kategori6){
      return index6;
    }else if(list == kategori7){
      return index7;
    }else if(list == kategori8){
      return index8;
    }else if(list == kategori9){
      return index9;
    }else if(list == kategori10){
      return index10;
    } else if(list == kategori11){
      return index11;
    } else if(list == kategori12){
      return index12;
    }else if(list == kategori13){
      return index13;
    }else if(list == kategori14){
      return index14;
    }else if(list == kategori15){
      return index15;
    }else if(list == kategori16){
      return index6;
    }else if(list == kategori17){
      return index17;
    }else if(list == kategori18){
      return index18;
    }else if(list == kategori19){
      return index19;
    }else if(list == kategori20){
      return index20;
    } else if(list == kategori21){
      return index21;
    } else if(list == kategori22){
      return index22;
    }else if(list == kategori23){
      return index23;
    }else if(list == kategori24){
      return index24;
    }else if(list == kategori25){
      return index25;
    }else if(list == kategori26){
      return index26;
    }else if(list == kategori27){
      return index27;
    }else if(list == kategori28){
      return index28;
    }else if(list == kategori29){
      return index29;
    }else if(list == kategori30){
      return index30;
    } else if(list == kategori31){
      return index31;
    } else if(list == kategori32){
      return index32;
    }else if(list == kategori33){
      return index33;
    }else if(list == kategori34){
      return index34;
    }else if(list == kategori35){
      return index35;
    }else if(list == kategori36){
      return index36;
    }else if(list == kategori37){
      return index37;
    }else if(list == kategori38){
      return index38;
    } else {
      return 0;
    }


  }


  String scoreToList(int index){
    index+=1;
    if(index == 1 ){
      return kategori1;
    } else if(index == 2){
      return kategori2;
    } else if(index == 3){
      return kategori3;
    }else if(index == 4){
      return kategori4;
    }else if(index == 5){
      return kategori5;
    }else if(index == 6){
      return kategori6;
    }else if(index == 7){
      return kategori7;
    }else if(index == 8){
      return kategori8;
    }else if(index == 9){
      return kategori9;
    }else if(index == 10){
      return kategori10;
    }else if(index == 11){
      return kategori11;
    }else if(index == 12){
      return kategori12;
    }else if(index == 13){
      return kategori13;
    }else if(index == 14){
      return kategori14;
    }else if(index == 15){
      return kategori15;
    }else if(index == 16){
      return kategori16;
    }else if(index == 17){
      return kategori17;
    }else if(index == 18){
      return kategori18;
    }else if(index == 19){
      return kategori19;
    }else if(index == 20){
      return kategori20;
    }else if(index == 21){
      return kategori21;
    }else if(index == 22){
      return kategori22;
    }else if(index == 23){
      return kategori23;
    }else if(index == 24){
      return kategori24;
    }else if(index == 25){
      return kategori25;
    }else if(index == 26){
      return kategori26;
    }else if(index == 27){
      return kategori27;
    }else if(index == 28){
      return kategori28;
    }else if(index == 29){
      return kategori29;
    }else if(index == 30){
      return kategori30;
    }else if(index == 31){
      return kategori31;
    }else if(index == 32){
      return kategori32;
    }else if(index == 33){
      return kategori33;
    }else if(index == 34){
      return kategori34;
    }else if(index == 35){
      return kategori35;
    }else if(index == 36){
      return kategori36;
    }else if(index == 37){
      return kategori37;
    }else if(index == 38){
      return kategori38;
    } else {
      return "";
    }
  }

  List<String> parseScoreToList(List<int> listScore){
    List<String> listFavorit =[];
    for(int i=0; i<listScore.length; i++){
      if(listScore[i].isGreaterThan(9999)){
        listFavorit.add(scoreToList(i));
      }
    }

    return listFavorit;
  }


}