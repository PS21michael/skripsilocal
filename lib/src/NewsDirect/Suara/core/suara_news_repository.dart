import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../models/news_model.dart';

class SuaraNewsRepository extends GetxController {

  var count = 0;
  static SuaraNewsRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final String publisher = "Suara News";

  // UTILS
  int countPeriod=0;
  int getCountPeriod(){
    return countPeriod;
  }
  void setCountPeriod(int time){
    countPeriod=time;
  }
  void setCountPeriodNull(){
    countPeriod=0;
  }

  // Title List
  // BISNIS - SUARA
  List<String> listJudulBisnis =[];
  String categoryBisnis = "Bisnis";
  Future<List<NewsModel>> getAllNewsSuaraBisnis(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryBisnis).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulBisnis.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulBisnisSuaraNews(){
    return listJudulBisnis;
  }
  void setNullListJudulBisnisSuaraNews(){
    listJudulBisnis = [];
  }


  // BOLA - SUARA
  List<String> listJudulBola =[];
  String categoryBola = "Bola";
  Future<List<NewsModel>> getAllNewsSuaraBola(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryBola).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulBola.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulBolaSuaraNews(){
    return listJudulBola;
  }
  void setNullListJudulBolaSuaraNews(){
    listJudulBola = [];
  }


  // LIFE STYLE - SUARA
  List<String> listJudulLifeStyle =[];
  String categoryLifeStyle = "Lifestyle";
  Future<List<NewsModel>> getAllNewsSuaraLifeStyle(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryLifeStyle).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulLifeStyle.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulLifeStyleSuaraNews(){
    return listJudulLifeStyle;
  }
  void setNullListJudulLifeStyleSuaraNews(){
    listJudulLifeStyle = [];
  }


  // ENTERTAINMENT - SUARA
  List<String> listJudulEntertainment =[];
  String categoryEntertainment = "Hiburan";
  Future<List<NewsModel>> getAllNewsSuaraEntertainment(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryEntertainment).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulEntertainment.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulEntertainmentSuaraNews(){
    return listJudulEntertainment;
  }
  void setNullListJudulEntertainmentSuaraNews(){
    listJudulEntertainment = [];
  }


  // OTOMOTIF - SUARA
  List<String> listJudulOtomotif =[];
  String categoryOtomotif = "Otomotif";
  Future<List<NewsModel>> getAllNewsSuaraOtomotif(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOtomotif).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulOtomotif.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOtomotifSuaraNews(){
    return listJudulOtomotif;
  }
  void setNullListJudulOtomotifSuaraNews(){
    listJudulOtomotif = [];
  }


  // TEKNO - SUARA
  List<String> listJudulTekno =[];
  String categoryTekno = "Teknologi";
  Future<List<NewsModel>> getAllNewsSuaraTekno(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryTekno).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulTekno.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulTeknoSuaraNews(){
    return listJudulTekno;
  }
  void setNullListJudulTeknoSuaraNews(){
    listJudulTekno = [];
  }


  // HEALTH - SUARA
  List<String> listJudulHealth =[];
  String categoryHealth = "Kesehatan";
  Future<List<NewsModel>> getAllNewsSuaraHealth(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryHealth).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulHealth.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulHealthSuaraNews(){
    return listJudulHealth;
  }
  void setNullListJudulHealthSuaraNews(){
    listJudulHealth = [];
  }

  saveNewsSuara(NewsModel newsModel)async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
      // print(error.toString());
    });
    // print('News ke ${count+=1} Berhasil dibuat');
  }
}