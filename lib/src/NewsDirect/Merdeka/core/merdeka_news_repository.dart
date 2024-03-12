
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/news_model.dart';



class MerdekaNewsRepository extends GetxController{

  var count = 0;

  static MerdekaNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final String publisher = "Merdeka News";

  // UTILS
  int dateSaved=0;
  int getDateSaved(){
    return dateSaved;
  }
  void setDateSaved(int time){
    dateSaved=time;
  }

  // Title List

  // Jakarta - Merdeka News
  List<String> listJudulJakarta = [];
  String categoryJakarta = "jakarta";
  Future<List<NewsModel>> getAllNewsMerdekaJakarta(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryJakarta).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulJakarta.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulJakartaMerdekaNews(){
    return listJudulJakarta;
  }
  void setNullListJudulJakartaMerdekaNews(){
    listJudulJakarta = [];
  }


  // Dunia - Merdeka News
  List<String> listJudulDunia = [];
  String categoryDunia = "internasional";
  Future<List<NewsModel>> getAllNewsMerdekaDunia(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryDunia).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulDunia.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulDuniaMerdekaNews(){
    return listJudulDunia;
  }
  void setNullListJudulDuniaMerdekaNews(){
    listJudulDunia = [];
  }

  // Gaya - Merdeka News
  List<String> listJudulGaya = [];
  String categoryGaya = "lifestyle";
  Future<List<NewsModel>> getAllNewsMerdekaGaya(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryGaya).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulGaya.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulGayaMerdekaNews(){
    return listJudulGaya;
  }
  void setNullListJudulGayaMerdekaNews(){
    listJudulGaya = [];
  }


  // Olahraga - Merdeka News
  List<String> listJudulOlahraga = [];
  String categoryOlahraga = "olahraga";
  Future<List<NewsModel>> getAllNewsMerdekaOlahraga(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOlahraga).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulOlahraga.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOlahragaMerdekaNews(){
    return listJudulOlahraga;
  }
  void setNullListJudulOlahragaMerdekaNews(){
    listJudulOlahraga = [];
  }

  // Teknologi - Merdeka News
  List<String> listJudulTeknologi = [];
  String categoryTeknologi = "teknologi";
  Future<List<NewsModel>> getAllNewsMerdekaTeknologi(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryTeknologi).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulTeknologi.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulTeknologiMerdekaNews(){
    return listJudulTeknologi;
  }
  void setNullListJudulTeknologiMerdekaNews(){
    listJudulTeknologi = [];
  }


  // Otomotif - Merdeka News
  List<String> listJudulOtomotif = [];
  String categoryOtomotif = "otomotif";
  Future<List<NewsModel>> getAllNewsMerdekaOtomotif(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOtomotif).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulOtomotif.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOtomotifMerdekaNews(){
    return listJudulOtomotif;
  }
  void setNullListJudulOtomotifMerdekaNews(){
    listJudulOtomotif = [];
  }


  // khas - Merdeka News
  List<String> listJudulKhas = [];
  String categoryKhas = "khas";
  Future<List<NewsModel>> getAllNewsMerdekaKhas(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryKhas).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulKhas.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulKhasMerdekaNews(){
    return listJudulKhas;
  }
  void setNullListJudulKhasMerdekaNews(){
    listJudulKhas = [];
  }


  // sehat - Merdeka News
  List<String> listJudulSehat = [];
  String categorySehat = "kesehatan";
  Future<List<NewsModel>> getAllNewsMerdekaSehat(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categorySehat).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulSehat.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulSehatMerdekaNews(){
    return listJudulSehat;
  }
  void setNullListJudulSehatMerdekaNews(){
    listJudulSehat = [];
  }


  // jateng - Merdeka News
  List<String> listJudulJateng = [];
  String categoryJateng = "jateng";
  Future<List<NewsModel>> getAllNewsMerdekaJateng(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryJateng).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulJateng.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulJatengMerdekaNews(){
    return listJudulJateng;
  }
  void setNullListJudulJatengMerdekaNews(){
    listJudulJateng = [];
  }


  saveNewsMerdeka(NewsModel newsModel)async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
    print('News ke ${count+=1} Berhasil dibuat');
  }

  }