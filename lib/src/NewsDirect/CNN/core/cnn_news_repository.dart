import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/news_model.dart';


class CNNNewsRepository extends GetxController{

  var count = 0;

  static CNNNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final String publisher = "CNN Indonesia";

  // UTILS
  int dateSaved=0;
  int getDateSaved(){
    return dateSaved;
  }
  void setDateSaved(int time){
    dateSaved=time;
  }

  // Title List
  // NASIONAL - CNN
  List<String> listJudulNasional =[];
  String categoryNasional = "Nasional";
  Future<List<NewsModel>> getAllNewsCNNNasional(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryNasional).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulNasional.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNasionalCNNNews(){
    return listJudulNasional;
  }
  void setNullListJudulNasionalCNNNews(){
    listJudulNasional = [];
  }

  // INTERNASIONAL - CNN
  List<String> listJudulInternasional =[];
  String categoryInternasional = "Internasional";
  Future<List<NewsModel>> getAllNewsCNNInternasional(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryInternasional).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulInternasional.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulInternasionalCNNNews(){
    return listJudulInternasional;
  }
  void setNullListJudulInternasionalCNNNews(){
    listJudulInternasional = [];
  }

  // EKONOMI - CNN
  List<String> listJudulEkonomi =[];
  String categoryEkonomi = "Ekonomi";
  Future<List<NewsModel>> getAllNewsCNNEkonomi(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryEkonomi).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulEkonomi.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulEkonomiCNNNews(){
    return listJudulEkonomi;
  }
  void setNullListJudulEkonomiCNNNews(){
    listJudulEkonomi = [];
  }


  // OLAHRAGA - CNN
  List<String> listJudulOlahraga =[];
  String categoryOlahraga = "Olahraga";
  Future<List<NewsModel>> getAllNewsCNNOlahraga(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOlahraga).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    // newsData.add(snapshot.docs.map((e) => NewsModel.fromSnapshot(e)) as NewsModel);
    for(int i=0; i<newsData.length;i++){
      listJudulOlahraga.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOlahragaCNNNews(){
    return listJudulOlahraga;
  }
  void setNullListJudulOlahragaCNNNews(){
    listJudulOlahraga = [];
  }


  // TEKNOLOGI - CNN
  List<String> listJudulTeknologi =[];
  String categoryTeknologi = "Teknologi";
  Future<List<NewsModel>> getAllNewsCNNTeknologi(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryTeknologi).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulTeknologi.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulTeknologiCNNNews(){
    return listJudulTeknologi;
  }
  void setNullListJudulTeknologiCNNNews(){
    listJudulTeknologi = [];
  }


  // HIBURAN - CNN
  List<String> listJudulHiburan =[];
  String categoryHiburan = "Hiburan";
  Future<List<NewsModel>> getAllNewsCNNHiburan(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryHiburan).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudulHiburan.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulHiburanCNNNews(){
    return listJudulHiburan;
  }
  void setNullListJudulHiburanCNNNews(){
    listJudulHiburan = [];
  }

  saveNewsCNN(NewsModel newsModel)async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
    print('News ke ${count+=1} Berhasil dibuat');
  }



}