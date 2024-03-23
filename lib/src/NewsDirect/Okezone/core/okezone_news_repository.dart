
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/news_model.dart';


class OkezoneNewsRepository extends GetxController{

  var count = 0;

  static OkezoneNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final String publisher = "Okezone.com";

  // UTILS
  int dateSaved=0;
  int getDateSaved(){
    return dateSaved;
  }
  void setDateSaved(int time){
    dateSaved=time;
  }
  void setDateSavedNull(){
    dateSaved=0;
  }

  // Celebrity - Okezone
  List<String> listJudulCelebrity =[];
  String categoryCelebrity = "Selebritis";
  Future<List<NewsModel>> getAllNewsOkezoneCelebrity(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryCelebrity).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    listJudulCelebrity =[];
    for(int i=0; i<newsData.length;i++){
      listJudulCelebrity.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulCelebrityOkezoneNews(){
    return listJudulCelebrity;
  }
  void setNullListJudulCelebrityOkezoneNews(){
    listJudulCelebrity = [];
  }


  // Sports - Okezone
  List<String> listJudulSports =[];
  String categorySports = "Olahraga";
  Future<List<NewsModel>> getAllNewsOkezoneSports(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categorySports).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    listJudulSports =[];
    for(int i=0; i<newsData.length;i++){
      listJudulSports.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulSportsOkezoneNews(){
    return listJudulSports;
  }
  void setNullListJudulSportsOkezoneNews(){
    listJudulSports = [];
  }


  // Otomotif - Okezone
  List<String> listJudulOtomotif =[];
  String categoryOtomotif = "Otomotif";
  Future<List<NewsModel>> getAllNewsOkezoneOtomotif(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOtomotif).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    listJudulOtomotif =[];
    for(int i=0; i<newsData.length;i++){
      listJudulOtomotif.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOtomotifOkezoneNews(){
    return listJudulOtomotif;
  }
  void setNullListJudulOtomotifOkezoneNews(){
    listJudulOtomotif = [];
  }


  // Economy - Okezone
  List<String> listJudulEconomy =[];
  String categoryEconomy = "Ekonomi";
  Future<List<NewsModel>> getAllNewsOkezoneEconomy(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryEconomy).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    listJudulEconomy =[];
    for(int i=0; i<newsData.length;i++){
      listJudulEconomy.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulEconomyOkezoneNews(){
    return listJudulEconomy;
  }
  void setNullListJudulEconomyOkezoneNews(){
    listJudulEconomy = [];
  }


  // Techno - Okezone
  List<String> listJudulTechno =[];
  String categoryTechno = "Teknologi";
  Future<List<NewsModel>> getAllNewsOkezoneTechno(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryTechno).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    listJudulTechno =[];
    for(int i=0; i<newsData.length;i++){
      listJudulTechno.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulTechnoOkezoneNews(){
    return listJudulTechno;
  }
  void setNullListJudulTechnoOkezoneNews(){
    listJudulTechno = [];
  }


  // Lifestyle - Okezone
  List<String> listJudulLifestyle =[];
  String categoryLifestyle = "Lifestyle";
  Future<List<NewsModel>> getAllNewsOkezoneLifestyle(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryLifestyle).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    listJudulLifestyle =[];
    for(int i=0; i<newsData.length;i++){
      listJudulLifestyle.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulLifestyleOkezoneNews(){
    return listJudulLifestyle;
  }
  void setNullListJudulLifestyleOkezoneNews(){
    listJudulLifestyle = [];
  }

  // Bola - Okezone
  List<String> listJudulBola =[];
  String categoryBola = "Bola";
  Future<List<NewsModel>> getAllNewsOkezoneBola(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryBola).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    listJudulBola =[];
    for(int i=0; i<newsData.length;i++){
      listJudulBola.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulBolaOkezoneNews(){
    return listJudulBola;
  }
  void setNullListJudulBolaOkezoneNews(){
    listJudulBola = [];
  }

  saveNewsOkezone(NewsModel newsModel)async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
    print('News ke ${count+=1} Berhasil dibuat');
  }
}