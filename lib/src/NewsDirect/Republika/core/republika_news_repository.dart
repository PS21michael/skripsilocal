
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/news_model.dart';


class RepublikaNewsRepository extends GetxController{

  var count = 0;

  static RepublikaNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final String publisher = "Republika Online";

  // UTILS
  int dateSaved=0;
  int getDateSaved(){
    return dateSaved;
  }
  void setDateSaved(int time){
    dateSaved=time;
  }


  // NEWS - Republika
  List<String> listJudulNews =[];
  String categoryNews = "News";
  Future<List<NewsModel>> getAllNewsRepublikaNews(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryNews).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulNews.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNewsRepublikaNews(){
    return listJudulNews;
  }
  void SetListJudulNewsRepublikaNewsNull(){
    listJudulNews = [];
  }




  // DAERAH - Republika
  List<String> listJudulDaerah =[];
  String categoryDaerah = "Daerah";
  Future<List<NewsModel>> getAllNewsRepublikaDaerah(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryDaerah).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulDaerah.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNewsRepublikaDaerah(){
    return listJudulDaerah;
  }
  void SetListJudulNewsRepublikaDaerahNull(){
    listJudulDaerah = [];
  }




  // KHAZANAH - Republika
  List<String> listJudulKhazanah =[];
  String categoryKhazanah = "Khazanah";
  Future<List<NewsModel>> getAllNewsRepublikaKhazanah(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryKhazanah).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulKhazanah.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNewsRepublikaKhazanah(){
    return listJudulKhazanah;
  }
  void SetListJudulNewsRepublikaKhazanahNull(){
    listJudulKhazanah = [];
  }




  // ISLAM - Republika
  List<String> listJudulIslam =[];
  String categoryIslam = "Islam";
  Future<List<NewsModel>> getAllNewsRepublikaIslam(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryIslam).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulIslam.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNewsRepublikaIslam(){
    return listJudulIslam;
  }
  void SetListJudulNewsRepublikaIslamNull(){
    listJudulIslam = [];
  }




  // INTERNASIONAL - Republika
  List<String> listJudulInternasional =[];
  String categoryInternasional = "Internasional";
  Future<List<NewsModel>> getAllNewsRepublikaInternasional(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryInternasional).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulInternasional.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNewsRepublikaInternasional(){
    return listJudulInternasional;
  }
  void SetListJudulNewsRepublikaInternasionalNull(){
    listJudulInternasional = [];
  }




  // BOLA - Republika
  List<String> listJudulBola =[];
  String categoryBola = "Bola";
  Future<List<NewsModel>> getAllNewsRepublikaBola(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryBola).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulBola.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNewsRepublikaBola(){
    return listJudulBola;
  }
  void SetListJudulNewsRepublikaBolaNull(){
    listJudulBola = [];
  }




  // LEISURE - Republika
  List<String> listJudulLeisure =[];
  String categoryLeisure = "Leisure";
  Future<List<NewsModel>> getAllNewsRepublikaLeisure(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryLeisure).
    where("Publisher", isEqualTo: publisher).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulLeisure.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulNewsRepublikaLeisure(){
    return listJudulLeisure;
  }
  void SetListJudulNewsRepublikaLeisureNull(){
    listJudulLeisure = [];
  }

  saveNewsRepublika(NewsModel newsModel)async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
    print('News ke ${count+=1} Berhasil dibuat');
  }


}