
import 'package:get/get.dart';

class CategoryListParser extends GetxController{

  static CategoryListParser get instance => Get.find();

  String kategori1 = "nasional";
  String kategori2 = "bisnis";
  String kategori3 = "politik";
  String kategori4 = "hukum";
  String kategori5 = "ekonomi";
  String kategori6 = "olahraga";
  String kategori7 = "teknologi";
  String kategori8 = "otomotif";
  String kategori9 = "internasional";
  String kategori10 = "bola";
  String kategori11 = "selebritis";
  String kategori12 = "lifestyle";
  String kategori13 = "hiburan";
  String kategori14 = "jakarta";
  String kategori15 = "market";
  String kategori16 = "news";
  String kategori17 = "cantik";
  String kategori18 = "travel";
  String kategori19 = "syariah";
  String kategori20 = "islam";
  String kategori21 = "sains";
  String kategori22 = "edukasi";
  String kategori23 = "kesehatan";
  String kategori24 = "humaniora";
  String kategori25 = "entrepreneur";
  String kategori26 = "opini";
  String kategori27 = "khas";
  String kategori28 = "jateng";
  String kategori29 = "daerah";
  String kategori30 = "khazanah";
  String kategori31 = "leisure";
  String kategori32 = "metro";
  String kategori33 = "ekbis";
  String kategori34 = "kalam";
  String kategori35 = "difabel";
  String kategori36 = "creativelab";
  String kategori37 = "inforial";
  String kategori38 = "event";

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