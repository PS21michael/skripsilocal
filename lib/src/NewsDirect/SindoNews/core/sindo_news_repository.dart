
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/news_model.dart';

class SindoNewsRepository extends GetxController{

  var count = 0;

  static SindoNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final String publisher = "SINDOnews";

  // UTILS
  int dateSaved=0;
  int getDateSaved(){
    return dateSaved;
  }
  void setDateSaved(int time){
    dateSaved=time;
  }

  // Title List
  // NASIONAL - Sindo News
  List<String> listJudulNasional =[];
  String categoryNasional = "nasional";
  Future<List<NewsModel>> getAllNewsSindoNewsNasional(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryNasional).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulNasional.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNasionalSindoNews(){
    return listJudulNasional;
  }
  void setNullListJudulNasionalSindoNews(){
    listJudulNasional = [];
  }

  // METRO - Sindo News
  List<String> listJudulMetro =[];
  String categoryMetro = "metro";
  Future<List<NewsModel>> getAllNewsSindoNewsMetro(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryMetro).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulMetro.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulMetroSindoNews(){
    return listJudulMetro;
  }
  void setNullListJudulMetroSindoNews(){
    listJudulMetro = [];
  }


  // EKBIS - Sindo News
  List<String> listJudulEkbis =[];
  String categoryEkbis = "ekbis";
  Future<List<NewsModel>> getAllNewsSindoNewsEkbis(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryEkbis).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulEkbis.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulEkbisSindoNews(){
    return listJudulEkbis;
  }
  void setNullListJudulEkbisSindoNews(){
    listJudulEkbis = [];
  }


  // INTERNATIONAL - Sindo News
  List<String> listJudulInternasional =[];
  String categoryInternasional = "internasional";
  Future<List<NewsModel>> getAllNewsSindoNewsInternasional(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryInternasional).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulInternasional.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulInternasionalSindoNews(){
    return listJudulInternasional;
  }
  void setNullListJudulInternasionalSindoNews(){
    listJudulInternasional = [];
  }



  // DAERAH - Sindo News
  List<String> listJudulDaerah =[];
  String categoryDaerah = "daerah";
  Future<List<NewsModel>> getAllNewsSindoNewsDaerah(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryDaerah).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulDaerah.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulDaerahSindoNews(){
    return listJudulDaerah;
  }
  void setNullListJudulDaerahSindoNews(){
    listJudulDaerah = [];
  }


  // SPORTS - Sindo News
  List<String> listJudulSports =[];
  String categorySports = "olahraga";
  Future<List<NewsModel>> getAllNewsSindoNewsSports(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categorySports).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulSports.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulSportsSindoNews(){
    return listJudulSports;
  }
  void setNullListJudulSportsSindoNews(){
    listJudulSports = [];
  }


  // OTOMOTIF - Sindo News
  List<String> listJudulOtomotif =[];
  String categoryOtomotif = "otomotif";
  Future<List<NewsModel>> getAllNewsSindoNewsOtomotif(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOtomotif).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulOtomotif.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOtomotifSindoNews(){
    return listJudulOtomotif;
  }
  void setNullListJudulOtomotifSindoNews(){
    listJudulOtomotif = [];
  }


  // TEKNO - Sindo News
  List<String> listJudulTekno =[];
  String categoryTekno = "teknologi";
  Future<List<NewsModel>> getAllNewsSindoNewsTekno(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryTekno).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulTekno.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulTeknoSindoNews(){
    return listJudulTekno;
  }
  void setNullListJudulTeknoSindoNews(){
    listJudulTekno = [];
  }


  // SAINS - Sindo News
  List<String> listJudulSains =[];
  String categorySains = "sains";
  Future<List<NewsModel>> getAllNewsSindoNewsSains(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categorySains).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulSains.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulSainsSindoNews(){
    return listJudulSains;
  }
  void setNullListJudulSainsSindoNews(){
    listJudulSains = [];
  }


  // EDUKASI - Sindo News
  List<String> listJudulEdukasi =[];
  String categoryEdukasi = "edukasi";
  Future<List<NewsModel>> getAllNewsSindoNewsEdukasi(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryEdukasi).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulEdukasi.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulEdukasiSindoNews(){
    return listJudulEdukasi;
  }
  void setNullListJudulEdukasiSindoNews(){
    listJudulEdukasi = [];
  }


  // LIFE STYLE - Sindo News
  List<String> listJudulLifeStyle =[];
  String categoryLifeStyle = "lifestyle";
  Future<List<NewsModel>> getAllNewsSindoLifeStyle(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryLifeStyle).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulLifeStyle.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulLifeStyleSindoNews(){
    return listJudulLifeStyle;
  }
  void setNullListJudulLifeStyleSindoNews(){
    listJudulLifeStyle = [];
  }


  // KALAM - Sindo News
  List<String> listJudulKalam =[];
  String categoryKalam = "kalam";
  Future<List<NewsModel>> getAllNewsSindoKalam(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryKalam).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulKalam.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulKalamSindoNews(){
    return listJudulKalam;
  }
  void setNullListJudulKalamSindoNews(){
    listJudulKalam = [];
  }

  saveNewsSindoNews(NewsModel newsModel)async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
    print('News ke ${count+=1} Berhasil dibuat');
  }


}