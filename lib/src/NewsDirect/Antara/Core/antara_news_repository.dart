
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/repository/news_repository/news_repository.dart';

import '../../../features/authentication/models/news_model.dart';

class AntaraNewsRepository extends GetxController{

  var count = 0;

  static AntaraNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final String publisher = "ANTARA News";


  // UTILS
  int dateSaved=0;
  int getDateSaved(){
    return dateSaved;
  }
  void setDateSaved(int time){
    dateSaved=time;
  }

  // Title List
  // POLITIK - Antara
  List<String> listJudulPolitik =[];
  String categoryPolitik = "politik";
  Future<List<NewsModel>> getAllNewsAntaraPolitik(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryPolitik).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulPolitik.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulPolitikAntaraNews(){
    return listJudulPolitik;
  }


  // HUKUM - Antara
  List<String> listJudulHukum =[];
  String categoryHukum = "hukum";
  Future<List<NewsModel>> getAllNewsAntaraHukum(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryHukum).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulHukum.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulHukumAntaraNews(){
    return listJudulHukum;
  }




  // EKONOMI - Antara
  List<String> listJudulEkonomi =[];
  String categoryEkonomi ="ekonomi";
  Future<List<NewsModel>> getAllNewsAntaraEkonomi(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryEkonomi).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulEkonomi.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulEkonomiAntaraNews(){
    return listJudulEkonomi;
  }



  // BOLA - Antara
  List<String> listJudulBola =[];
  String categoryBola = "bola";
  Future<List<NewsModel>> getAllNewsAntaraBola(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryBola).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulBola.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulBolaAntaraNews(){
    return listJudulBola;
  }


  // OLAHRAGA - Antara
  List<String> listJudulOlahraga =[];
  String categoryOlahraga = "olahraga";
  Future<List<NewsModel>> getAllNewsAntaraOlahraga(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOlahraga).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulOlahraga.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOlahragaAntaraNews(){
    return listJudulOlahraga;
  }



  // HUMANIORA - Antara
  List<String> listJudulHumaniora =[];
  String categoryHumaniora = "humaniora";
  Future<List<NewsModel>> getAllNewsAntaraHumaniora(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryHumaniora).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulHumaniora.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulHumanioraAntaraNews(){
    return listJudulHumaniora;
  }



  // LIFESTYLE - Antara
  List<String> listJudulLifeStyle =[];
  String categoryLifeStyle = "lifestyle";
  Future<List<NewsModel>> getAllNewsAntaraLifeStyle(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryLifeStyle).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulLifeStyle.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulLifeStyleAntaraNews(){
    return listJudulLifeStyle;
  }




  // HIBURAN - Antara
  List<String> listJudulHiburan =[];
  String categoryHiburan = "hiburan";
  Future<List<NewsModel>> getAllNewsAntaraHiburan(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryHiburan).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulHiburan.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulHiburanAntaraNews(){
    return listJudulHiburan;
  }



  // INTERNASIONAL/DUNIA - Antara
  List<String> listJudulInternasional =[];
  String categoryInternasional = "internasional";
  Future<List<NewsModel>> getAllNewsAntaraInternasional(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryInternasional).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulInternasional.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulInternasionalAntaraNews(){
    return listJudulInternasional;
  }



  // TEKNOLOGI - Antara
  List<String> listJudulTeknologi =[];
  String categoryTeknologi = "teknologi";
  Future<List<NewsModel>> getAllNewsAntaraTeknologi(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryTeknologi).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulTeknologi.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulTeknologiAntaraNews(){
    return listJudulTeknologi;
  }



  // OTOMOTIF - Antara
  List<String> listJudulOtomotif =[];
  String categoryOtomotif = "otomotif";
  Future<List<NewsModel>> getAllNewsAntaraOtomotif(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOtomotif).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulOtomotif.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOtomotifAntaraNews(){
    return listJudulOtomotif;
  }



  saveNewsAntara(NewsModel newsModel)async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
    print('News ke ${count+=1} Berhasil dibuat');
  }

  // POLITIK



}