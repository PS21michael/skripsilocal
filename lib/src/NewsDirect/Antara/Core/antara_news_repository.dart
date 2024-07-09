import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../models/news_model.dart';

class AntaraNewsRepository extends GetxController{

  var count = 0;

  static AntaraNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final String publisher = "ANTARA News";
  int countPeriod=0;

  int getCountPeriod(){
    return countPeriod;
  }
  void setCountPeriod(int time){
    countPeriod=time;
  }
  void setCountPeriodNull(){
    countPeriod = 0;
  }

  // Title List
  // POLITIK - Antara
  List<String> listJudulPolitik =[];
  String categoryPolitik = "Politik";
  Future<List<NewsModel>> getAllNewsAntaraPolitik(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryPolitik).where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulPolitik.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulPolitikAntaraNews(){
    return listJudulPolitik;
  }
  void setNullListJudulPolitikAntaraNews(){
    listJudulPolitik = [];
  }



  // HUKUM - Antara
  List<String> listJudulHukum =[];
  String categoryHukum = "Hukum";
  Future<List<NewsModel>> getAllNewsAntaraHukum(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryHukum).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulHukum.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulHukumAntaraNews(){
    return listJudulHukum;
  }
  void setNullListJudulHukumAntaraNews(){
    listJudulHukum = [];
  }




  // EKONOMI - Antara
  List<String> listJudulEkonomi =[];
  String categoryEkonomi ="Ekonomi";
  Future<List<NewsModel>> getAllNewsAntaraEkonomi(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryEkonomi).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulEkonomi.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulEkonomiAntaraNews(){
    return listJudulEkonomi;
  }
  void setNullListJudulEkonomiAntaraNews(){
    listJudulEkonomi = [];
  }




  // BOLA - Antara
  List<String> listJudulBola =[];
  String categoryBola = "Bola";
  Future<List<NewsModel>> getAllNewsAntaraBola(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryBola).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulBola.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulBolaAntaraNews(){
    return listJudulBola;
  }
  void setNullListJudulBolaAntaraNews(){
    listJudulBola = [];
  }


  // OLAHRAGA - Antara
  List<String> listJudulOlahraga =[];
  String categoryOlahraga = "Olahraga";
  Future<List<NewsModel>> getAllNewsAntaraOlahraga(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOlahraga).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulOlahraga.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOlahragaAntaraNews(){
    return listJudulOlahraga;
  }
  void setNullListJudulOlahragaAntaraNews(){
    listJudulOlahraga = [];
  }




  // HUMANIORA - Antara
  List<String> listJudulHumaniora =[];
  String categoryHumaniora = "Humaniora";
  Future<List<NewsModel>> getAllNewsAntaraHumaniora(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryHumaniora).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulHumaniora.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulHumanioraAntaraNews(){
    return listJudulHumaniora;
  }
  void setNullListJudulHumanioraAntaraNews(){
    listJudulHumaniora = [];
  }



  // LIFESTYLE - Antara
  List<String> listJudulLifeStyle =[];
  String categoryLifeStyle = "Lifestyle";
  Future<List<NewsModel>> getAllNewsAntaraLifeStyle(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryLifeStyle).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulLifeStyle.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulLifeStyleAntaraNews(){
    return listJudulLifeStyle;
  }
  void setNullListJudulLifeStyleAntaraNews(){
    listJudulLifeStyle = [];
  }




  // HIBURAN - Antara
  List<String> listJudulHiburan =[];
  String categoryHiburan = "Hiburan";
  Future<List<NewsModel>> getAllNewsAntaraHiburan(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryHiburan).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulHiburan.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulHiburanAntaraNews(){
    return listJudulHiburan;
  }
  void setNullListJudulHiburanAntaraNews(){
    listJudulHiburan = [];
  }


  // INTERNASIONAL/DUNIA - Antara
  List<String> listJudulInternasional =[];
  String categoryInternasional = "Internasional";
  Future<List<NewsModel>> getAllNewsAntaraInternasional(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryInternasional).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulInternasional.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulInternasionalAntaraNews(){
    return listJudulInternasional;
  }
  void setNullListJudulInternasionalAntaraNews(){
    listJudulInternasional = [];
  }


  // TEKNOLOGI - Antara
  List<String> listJudulTeknologi =[];
  String categoryTeknologi = "Teknologi";
  Future<List<NewsModel>> getAllNewsAntaraTeknologi(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryTeknologi).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulTeknologi.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulTeknologiAntaraNews(){
    return listJudulTeknologi;
  }
  void setNullListJudulTeknologiAntaraNews(){
    listJudulTeknologi = [];
  }



  // OTOMOTIF - Antara
  List<String> listJudulOtomotif =[];
  String categoryOtomotif = "Otomotif";
  Future<List<NewsModel>> getAllNewsAntaraOtomotif(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryOtomotif).
    where("Publisher", isEqualTo: publisher).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulOtomotif.add(newsData[i].title);
    }
    return newsData;
  }
  List<String> getListJudulOtomotifAntaraNews(){
    return listJudulOtomotif;
  }
  void setNullListJudulOtomotifAntaraNews(){
    listJudulOtomotif = [];
  }

  saveNewsAntara(NewsModel newsModel)async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
      // print(error.toString());
    });
    // print('News ke ${count+=1} Berhasil dibuat');
  }

}