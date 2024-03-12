
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/authentication/models/news_model.dart';

class CNBCNewsRepository extends GetxController{

  var count = 0;

  static CNBCNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final String publisher = "CNBC Indonesia";


  // UTILS
  int dateSaved=0;
  int getDateSaved(){
    return dateSaved;
  }
  void setDateSaved(int time){
    dateSaved=time;
  }

  // Title List
  // NEWS - CNBC
  List<String> listJudulNews =[];
  String categoryNews = "news";
  Future<List<NewsModel>> getAllNewsCNBCNews(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryNews).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulNews.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNewsCNBCNews(){
    return listJudulNews;
  }
  void setNullListJudulNewsCNBCNews(){
    listJudulNews = [];
  }


  // MARKET - CNBC
  List<String> listJudulMarket =[];
  String categoryMarket = "market";
  Future<List<NewsModel>> getAllNewsCNBCMarket(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryMarket).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulMarket.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulMarketCNBCNews(){
    return listJudulMarket;
  }
  void setNullListJudulMarketCNBCNews(){
    listJudulMarket = [];
  }


  // ENTREPRENEUR - CNBC
  List<String> listJudulEntrepreneur =[];
  String categoryEntrepreneur = "entrepreneur";
  Future<List<NewsModel>> getAllNewsCNBCEntrepreneur(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryEntrepreneur).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulEntrepreneur.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulEntrepreneurCNBCNews(){
    return listJudulEntrepreneur;
  }
  void setNullListJudulEntrepreneurCNBCNews(){
    listJudulEntrepreneur = [];
  }



  // SYARIAH - CNBC
  List<String> listJudulSyariah =[];
  String categorySyariah = "syariah";
  Future<List<NewsModel>> getAllNewsCNBCSyariah(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categorySyariah).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulSyariah.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulSyariahCNBCNews(){
    return listJudulSyariah;
  }
  void setNullListJudulSyariahCNBCNews(){
    listJudulSyariah = [];
  }


  // TEKNOLOGI - CNBC
  List<String> listJudulTeknologi =[];
  String categoryTeknologi = "teknologi";
  Future<List<NewsModel>> getAllNewsCNBCTeknologi(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryTeknologi).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulTeknologi.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulTeknologiCNBCNews(){
    return listJudulTeknologi;
  }
  void setNullListJudulTeknologiCNBCNews(){
    listJudulTeknologi = [];
  }


  // LIFESTYLE - CNBC
  List<String> listJudulLifeStyle =[];
  String categoryLifeStyle = "lifestyle";
  Future<List<NewsModel>> getAllNewsCNBCLifeStyle(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryLifeStyle).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulLifeStyle.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulLifeStyleCNBCNews(){
    return listJudulLifeStyle;
  }
  void setNullListJudulLifeStyleCNBCNews(){
    listJudulLifeStyle = [];
  }


  // OPINI - CNBC
  List<String> listJudulOpini =[];
  String categoryOpini = "opini";
  Future<List<NewsModel>> getAllNewsCNBCOpini(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOpini).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulOpini.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOpiniCNBCNews(){
    return listJudulOpini;
  }
  void setNullListJudulOpiniCNBCNews(){
    listJudulOpini = [];
  }

  saveNewsCNBC(NewsModel newsModel)async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
    print('News ke ${count+=1} Berhasil dibuat');
  }


}