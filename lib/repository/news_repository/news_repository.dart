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
  int viewsCount=0;
  String idNews="";

  String judul = "";
  String link = "";
  String linkGambar = "";
  String newsCategory="";

  List<String> listJudul = ["null"];
  int tanggalDisimpan=0;

  insertNews(NewsModel newsModel) async{
    await _db.collection("/News").add(newsModel.toJson())
        .catchError((error, stackTrice){
          // print(error.toString());
    });
    // print('News ke ${count+=1}Berhasil dibuat');
  }
  
  Future<NewsModel> getSingelNewsDetails (String title) async{
    final snapshot = await _db.collection("/News").where("Title", isEqualTo: title).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).single;
    // print('CheckPoint isi user ');
    publisher = newsData.publisher;
    title11 = newsData.title;
    author = newsData.author;
    url = newsData.urlNews;
    viewsCount = newsData.views;
    idNews = newsData.id!;
    linkGambar = newsData.urlImage;
    newsCategory = newsData.category;
    // print('Data terisi ');
    // print('salah satu data : ${title} ');
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


  int getViewsCount(){
    return viewsCount;
  }

  int getTanggalDisimpan(){
    return tanggalDisimpan;
  }

  void setTanggalDisimpan(int tanggal){
    tanggalDisimpan = tanggal;
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
    final snapshot = await _db.collection("/News").orderBy("PublishedTime", descending: true).orderBy("Views",descending: true).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    listJudul = [];
    for(int i=0; i<newsData.length;i++){
      listJudul.add(newsData[i].title);
    }
    return newsData;
  }

  Future<List<NewsModel>> getAllNews86() async{
    final snapshot = await _db.collection("/News").where("CountPeriod", isEqualTo: 86).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    return newsData;
  }

  // Rentang waktu
  Future<List<NewsModel>> getAllNewsBasedOnDate(String periode) async{
    if(periode == "DESC"){
      final snapshot = await _db.collection("/News").orderBy("PublishedTime", descending: true).orderBy("Views",descending: true).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    } else{
      final snapshot = await _db.collection("/News").orderBy("PublishedTime", descending: false).orderBy("Views",descending: true).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    }
  }

  // List Favorit + Rentang waktu
  Future<List<NewsModel>> getAllNewsBasedOnDateAndListFavorit(List<String> listFavorit, String periode) async{
    if(periode == "DESC"){
      final snapshot = await _db.collection("/News").where("Category", whereIn: listFavorit).orderBy("PublishedTime", descending: true).orderBy("Views",descending: true).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    } else{
      final snapshot = await _db.collection("/News").where("Category", whereIn: listFavorit).orderBy("PublishedTime", descending: false).orderBy("Views",descending: true).get();
      final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
      return newsData;
    }
  }

  // List Favorit
  Future<List<NewsModel>> getAllNewsFavorit(List<String> listFavorit) async{
    final snapshot = await _db.collection("/News").orderBy("PublishedTime", descending: true).orderBy("Views",descending: true)
        .where("Category", whereIn: listFavorit).get();
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
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: "Humaniora").where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudul.add(newsData[i].title);
      if(48 == newsData[i].countPeriod){
        // print("Data yang ke 48 : ${newsData[i].title}");
      }
    }
    for(int i=0; i<newsData.length;i++){
      listJudul.add(newsData[i].title);
      if(47 == newsData[i].countPeriod){
        // print("Data yang ke 47 : ${newsData[i].title}");
      }
    }
    for(int i=0; i<newsData.length;i++){
      listJudul.add(newsData[i].title);
      if(46 == newsData[i].countPeriod){
        // print("Data yang ke 46 : ${newsData[i].title}");
      }
    }

    return newsData;
  }



  Future<void> updateNewsRecord(NewsModel newsModel, String id) async{
    await _db.collection("/News").doc(id).update(newsModel.toJson()).catchError((error, stackTrice){
      // print(error.toString());
    });
  }

  Future<String> uploadImage (String path, XFile image) async{
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  }

  Future<void> tambahNilaiRating(int nilaiRating, String id) async{
    Map<String, dynamic> json = {'NilaiRating' : nilaiRating, 'JumlahPerating' : FieldValue.increment(1)};
    await _db.collection("/News").doc(id).update(json);
  }

  Future<void> updateNilaiRating(int nilaiRating, String id) async{
    Map<String, dynamic> json = {'NilaiRating' : nilaiRating};
    await _db.collection("/News").doc(id).update(json);
  }

  Future<void> updateDislikeRecord(int dislike, String id) async{
    Map<String, dynamic> json = {'Dislike' : dislike};
    await _db.collection("/News").doc(id).update(json).catchError((error, stacktrice){
      // print(error.toString());
    });
  }

  Future<void> updateLikeRecord(int like, String id) async{
    Map<String, dynamic> json = {'Like' : like};
    await _db.collection("/News").doc(id).update(json).catchError((error, stacktrice){
      // print(error.toString());
    });
  }

  List<String> listJudulPolitik =[];
  String categoryPolitik = "Politik";
  Future<List<NewsModel>> getAllNewsAntaraPolitik(int time) async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: categoryPolitik).where("CountPeriod", isEqualTo: time).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length; i++){
      listJudulPolitik.add(newsData[i].title);
    }
    return newsData;
  }

  Future<void> updateViewsNews(Map<String, dynamic> json, String id) async{
    await _db.collection("/News").doc(id).update(json);
  }

  // Delete singel news
  Future<void> deleteSingelNews(String id)async{
    await _db.collection("/News").doc(id).delete();
  }

  // Title  - Search
  // Future<List<NewsModel>> getSearchTitleNews(String id) async{
  //   final snapshot = await _db.collection("/News").orderBy("Title").startAt([id,]).endAt([id+'\uf8ff',]).get();
  //   final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
  //   return newsData;
  // }

  Future<List<NewsModel>> getSearchDescriptionNews(String id) async{
    final snapshot = await _db.collection("/News").orderBy("Description").startAt([id,]).endAt([id+'\uf8ff',]).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    return newsData;
  }

  Future<List<NewsModel>> getSearchTitleNews(String query) async {
    final snapshot = await _db.collection("/News").get();
    final lowercaseQuery = query.toLowerCase();
    final filteredNews = snapshot.docs.where((doc) =>
        doc["Title"].toLowerCase().contains(lowercaseQuery)
    ).toList();
    final newsData = filteredNews.map((e) => NewsModel.fromSnapshot(e)).toList();
    return newsData;
  }

  // News Favorit - Searching
  // Future<List<NewsModel>> getSearchTitleNewsFavorit(List<String> listFavorit, String id) async{
  //   final snapshot = await _db.collection("/News").where("Category", whereIn: listFavorit).orderBy("Title").startAt([id,]).endAt([id+'\uf8ff',]).get();
  //   final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
  //     return newsData;
  // }
  Future<List<NewsModel>> getSearchTitleNewsFavorit(List<String> listFavorit, String query) async {
    final snapshot = await _db.collection("/News")
        .where("Category", whereIn: listFavorit)
        .orderBy("Title")
        .get();
    final lowercaseQuery = query.toLowerCase();
    final filteredNews = snapshot.docs.where((doc) =>
        doc["Title"].toLowerCase().contains(lowercaseQuery)
    ).toList();

    final newsData = filteredNews.map((e) => NewsModel.fromSnapshot(e)).toList();
    return newsData;
  }

// Search Advanced
  late List<NewsModel> listNewsModelTemp;
  late NewsModel newsModel;

  Future<List<NewsModel>> getAllNewsSearchAdvanced(String keyWord) async{
    final snapshot = await _db.collection("/News").get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    listNewsModelTemp = [];
    for(int i=0; i<newsData.length;i++){
      if(newsData[i].title.contains(keyWord)){
        NewsModel newsModel = NewsModel(id: newsData[i].id,
            publisher: newsData[i].publisher,
            author: newsData[i].author,
            title: newsData[i].title,
            description: newsData[i].description,
            urlImage: newsData[i].urlImage,
            urlNews: newsData[i].urlNews,
            publishedTime: newsData[i].publishedTime,
            category: newsData[i].category,
            views: newsData[i].views,
            countPeriod: newsData[i].countPeriod,
            nilaiRating: newsData[i].nilaiRating,
            jumlahPerating: newsData[i].jumlahPerating
        );

        listNewsModelTemp.add(newsModel);
        continue;
      }
    }
    return newsData;
  }

  List<NewsModel> getAllSearchTempNewsModel(){
    return listNewsModelTemp;
  }

  void setAllSearchTempNewsModelNull(){
    listNewsModelTemp = [];
  }

}