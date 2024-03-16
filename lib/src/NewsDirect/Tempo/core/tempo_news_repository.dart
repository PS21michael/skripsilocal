
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/news_model.dart';


class TempoNewsRepository extends GetxController{

  var count = 0;

  static TempoNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final String publisher = "Tempo News";

  // UTILS
  int dateSaved=0;
  int getDateSaved(){
    return dateSaved;
  }
  void setDateSaved(int time){
    dateSaved=time;
  }

  // Title List
  // NASIONAL - Tempo
  List<String> listJudulNasional =[];
  String categoryNasional = "Nasional";
  Future<List<NewsModel>> getAllNewsTempoNasional(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryNasional).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulNasional.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNasionalTempoNews(){
    return listJudulNasional;
  }
  void setNullListJudulNasionalTempoNews(){
    listJudulNasional = [];
  }


  // BISNIS - Tempo
  List<String> listJudulBisnis =[];
  String categoryBisnis = "Bisnis";
  Future<List<NewsModel>> getAllNewsTempoBisnis(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryBisnis).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulBisnis.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulBisnisTempoNews(){
    return listJudulBisnis;
  }
  void setNullListJudulBisnisTempoNews(){
    listJudulBisnis = [];
  }


  // BISNIS - Tempo
  List<String> listJudulMetro =[];
  String categoryMetro = "Metro";
  Future<List<NewsModel>> getAllNewsTempoMetro(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryMetro).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulMetro.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulMetroTempoNews(){
    return listJudulMetro;
  }
  void setNullListJudulMetroTempoNews(){
    listJudulMetro = [];
  }


  // DUNIA - Tempo
  List<String> listJudulDunia =[];
  String categoryDunia = "Internasional";
  Future<List<NewsModel>> getAllNewsTempoDunia(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryDunia).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulDunia.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulDuniaTempoNews(){
    return listJudulDunia;
  }
  void setNullListJudulDuniaTempoNews(){
    listJudulDunia = [];
  }


  // BOLA - Tempo
  List<String> listJudulBola =[];
  String categoryBola = "Bola";
  Future<List<NewsModel>> getAllNewsTempoBola(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryBola).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulBola.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulBolaTempoNews(){
    return listJudulBola;
  }
  void setNullListJudulBolaTempoNews(){
    listJudulBola = [];
  }


  // CANTIK - Tempo
  List<String> listJudulCantik =[];
  String categoryCantik = "Cantik";
  Future<List<NewsModel>> getAllNewsTempoCantik(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryCantik).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulCantik.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulCantikTempoNews(){
    return listJudulCantik;
  }
  void setNullListJudulCantikTempoNews(){
    listJudulCantik = [];
  }


  // TEKNO - Tempo
  List<String> listJudulTekno =[];
  String categoryTekno = "Teknologi";
  Future<List<NewsModel>> getAllNewsTempoTekno(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryTekno).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulTekno.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulTeknoTempoNews(){
    return listJudulTekno;
  }
  void setNullListJudulTeknoTempoNews(){
    listJudulCantik = [];
  }


  // OTOMOTIF - Tempo
  List<String> listJudulOtomotif =[];
  String categoryOtomotif = "Otomotif";
  Future<List<NewsModel>> getAllNewsTempoOtomotif(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOtomotif).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulOtomotif.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOtomotifTempoNews(){
    return listJudulOtomotif;
  }
  void setNullListJudulOtomotifTempoNews(){
    listJudulOtomotif = [];
  }

  // SELEB - Tempo
  List<String> listJudulSeleb =[];
  String categorySeleb = "Selebritis";
  Future<List<NewsModel>> getAllNewsTempoSeleb(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categorySeleb).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulSeleb.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulSelebTempoNews(){
    return listJudulSeleb;
  }
  void setNullListJudulSelebTempoNews(){
    listJudulSeleb = [];
  }


  // GAYA - Tempo
  List<String> listJudulGaya =[];
  String categoryGaya = "Lifestyle";
  Future<List<NewsModel>> getAllNewsTempoGaya(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryGaya).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulGaya.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulGayaTempoNews(){
    return listJudulGaya;
  }
  void setNullListJudulGayaTempoNews(){
    listJudulGaya = [];
  }

  // TRAVEL - Tempo
  List<String> listJudulTravel =[];
  String categoryTravel = "Travel";
  Future<List<NewsModel>> getAllNewsTempoTravel(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryTravel).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulTravel.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulTravelTempoNews(){
    return listJudulTravel;
  }
  void setNullListJudulTravelTempoNews(){
    listJudulTravel = [];
  }

  // DIFABEL - Tempo
  List<String> listJudulDifabel =[];
  String categoryDifabel = "Difabel";
  Future<List<NewsModel>> getAllNewsTempoDifabel(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryDifabel).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulDifabel.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulDifabelTempoNews(){
    return listJudulDifabel;
  }
  void setNullListJudulDifabelTempoNews(){
    listJudulDifabel = [];
  }


  // CREATIVE LAB - Tempo
  List<String> listJudulCreativeLab =[];
  String categoryCreativeLab = "Creativelab";
  Future<List<NewsModel>> getAllNewsTempoCreativeLab(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryCreativeLab).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulCreativeLab.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulCreativeLabTempoNews(){
    return listJudulCreativeLab;
  }
  void setNullListJudulCreativeLabTempoNews(){
    listJudulCreativeLab = [];
  }


  // INFORIAL - Tempo
  List<String> listJudulInforial =[];
  String categoryInforial = "Inforial";
  Future<List<NewsModel>> getAllNewsTempoInforial(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryInforial).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulInforial.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulInforialTempoNews(){
    return listJudulInforial;
  }
  void setNullListJudulInforialTempoNews(){
    listJudulInforial = [];
  }

  // EVENT - Tempo
  List<String> listJudulEvent =[];
  String categoryEvent = "Event";
  Future<List<NewsModel>> getAllNewsTempoEvent(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryEvent).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulEvent.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulEventTempoNews(){
    return listJudulEvent;
  }
  void setNullListJudulEventTempoNews(){
    listJudulEvent = [];
  }

  saveNewsTempo(NewsModel newsModel)async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
    print('News ke ${count+=1} Berhasil dibuat');
  }



}