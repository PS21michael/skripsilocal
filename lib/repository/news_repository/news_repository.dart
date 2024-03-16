import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsilocal/models/news_model.dart';

class NewsRepository extends GetxController{
  
  var count = 0;
  
  static NewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  String title11="";
  String publisher="";
  String author="";
  String url="";
  int dislikeCount=0;
  int likeCount=0;
  String idNews="";

  String judul = "";
  String link = "";
  String linkGambar = "";
  String newsCategory="";

  // PENTING
  List<String> listJudul = ["null"];

  int TanggalDisimpan=0;

  insertNews(NewsModel newsModel) async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
          print(error.toString());
    });
    print('News ke ${count+=1}Berhasil dibuat');
  }
  
  Future<NewsModel> getSingelNewsDetails (String title) async{
    final snapshot = await _db.collection("/News").where("Title", isEqualTo: title).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).single;
    print('CheckPoint isi user ');
    publisher = newsData.publisher;
    title11 = newsData.title;
    author = newsData.author;
    url = newsData.urlNews;
    dislikeCount = newsData.dislike;
    likeCount = newsData.like;
    idNews = newsData.id!;
    linkGambar = newsData.urlImage!;
    newsCategory = newsData.category!;
    print('Data terisi ');
    print('salah satu data : ${title} ');
    print('salah satu data1 : ${likeCount} ');
    print('salah satu data2 : ${dislikeCount} ');
    return newsData;
  }

  List<String> getlistTitle(){
    return listJudul;
  }

  String getTitle(){
    return title11;
  }

  String getidNews(){
    return idNews;
  }

  String getNewsPicture(){
    return linkGambar;
  }

  String getNewsCategory(){
    return newsCategory;
  }

  int getDislikeCount(){
    return dislikeCount;
  }

  int getlikeCount(){
    return likeCount;
  }

  int getTanggalDisimpan(){
    return TanggalDisimpan;
  }

  void setTanggalDisimpan(int tanggal){
    TanggalDisimpan = tanggal;
  }

  String getPublisher(){
    return publisher;
  }

  String getUrl(){
    return url;
  }

  String getAuthor(){
    return author;
  }


  Future<List<NewsModel>> getAllNews() async{
    final snapshot = await _db.collection("/News").get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudul.add(newsData[i].title);
    }
    return newsData;
  }

  // Rentang waktu
  Future<List<NewsModel>> getAllNewsBasedOnDate(String periode) async{
    if(periode == "DESC"){
      final snapshot = await _db.collection("/News").orderBy("PublishedTime", descending: true).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    } else{
      final snapshot = await _db.collection("/News").orderBy("PublishedTime", descending: false).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    }
  }

  // List Favorit + Rentang waktu
  Future<List<NewsModel>> getAllNewsBasedOnDateAndListFavorit(List<String> listFavorit, String periode) async{
    if(periode == "DESC"){
      final snapshot = await _db.collection("/News").where("Category", whereIn: listFavorit).orderBy("PublishedTime", descending: true).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    } else{
      final snapshot = await _db.collection("/News").where("Category", whereIn: listFavorit).orderBy("PublishedTime", descending: false).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    }
  }

  // List Favorit
  Future<List<NewsModel>> getAllNewsFavorit(List<String> listFavorit) async{
    final snapshot = await _db.collection("/News").where("Category", whereIn: listFavorit).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();

    return newsData;
  }

  // Publisher
  Future<List<NewsModel>> getAllNewsOnChosenPublisher(String publisher) async{
    final snapshot = await _db.collection("/News").where("Publisher", isEqualTo: publisher).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();

    return newsData;
  }


  // Kategori
  Future<List<NewsModel>> getAllNewsOnChosenCategory(String category) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: category).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();

    return newsData;
  }

  // Kategori + Rentang Waktu
  Future<List<NewsModel>> getAllNewsOnChosenCategoryAndDate(String category, String periode) async{
    if(periode == "DESC"){
      final snapshot = await _db.collection("/News").where("Category", isEqualTo: category).orderBy("PublishedTime", descending: true).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    } else{
      final snapshot = await _db.collection("/News").where("Category", isEqualTo: category).orderBy("PublishedTime", descending: false).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    }
  }


  // Publisher + Rentang Waktu
  Future<List<NewsModel>> getAllNewsOnChosenPublisherAndDate(String publisher, String periode) async{
    if(periode == "DESC"){
      final snapshot = await _db.collection("/News").where("Publisher", isEqualTo: publisher).orderBy("PublishedTime", descending: true).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    } else{
      final snapshot = await _db.collection("/News").where("Publisher", isEqualTo: publisher).orderBy("PublishedTime", descending: false).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    }
  }



  // PENTING
  Future<List<NewsModel>> getAllNewsANTARAHumaniora(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: "Humaniora").where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudul.add(newsData[i].title);
      if(48 == newsData[i].saveDate){
        print("Data yang ke 48 : ${newsData[i].title}");
      }
    }
    for(int i=0; i<newsData.length;i++){
      listJudul.add(newsData[i].title);
      if(47 == newsData[i].saveDate){
        print("Data yang ke 47 : ${newsData[i].title}");
      }
    }
    for(int i=0; i<newsData.length;i++){
      listJudul.add(newsData[i].title);
      if(46 == newsData[i].saveDate){
        print("Data yang ke 46 : ${newsData[i].title}");
      }
    }

    return newsData;
  }



  Future<void> updateNewsRecord(NewsModel newsModel, String id) async{
    await _db.collection("/News").doc(id).update(newsModel.toJson()).catchError((error, stackTrice){
      print(error.toString());
    });
  }

  Future<String> uploadImage (String path, XFile image) async{
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  }

  Future<void> updateDislikeRecord(int dislike, String id) async{
    Map<String, dynamic> json = {'Dislike' : dislike};
    await _db.collection("/News").doc(id).update(json).catchError((error, stacktrice){
      print(error.toString());
    });
  }

  Future<void> updateLikeRecord(int like, String id) async{
    Map<String, dynamic> json = {'Like' : like};
    await _db.collection("/News").doc(id).update(json).catchError((error, stacktrice){
      print(error.toString());
    });
  }

  List<String> listJudulPolitik =[];
  String categoryPolitik = "Politik";
  Future<List<NewsModel>> getAllNewsAntaraPolitik(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryPolitik).where("SaveDate", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulPolitik.add(newsData[i].title);
    }
    return newsData;
  }


}