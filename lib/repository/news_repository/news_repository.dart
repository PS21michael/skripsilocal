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

  Future<NewsModel> getSingelNewsDetails (String title) async{
    final snapshot = await _db.collection("/News").where("Title", isEqualTo: title).get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).single;
    // print('CheckPoint isi user ');
    // print('Data terisi ');
    // print('salah satu data : ${title} ');
    return newsData;
  }

  Future<List<NewsModel>> getAllNews() async{
    final snapshot = await _db.collection("/News").orderBy("PublishedTime", descending: true).orderBy("Views",descending: true).get();
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

  Future<void> tambahNilaiRating(int nilaiRating, String id) async{
    Map<String, dynamic> json = {'NilaiRating' : FieldValue.increment(nilaiRating), 'JumlahPerating' : FieldValue.increment(1)};
    await _db.collection("/News").doc(id).update(json);
  }

  Future<void> updateNilaiRating(int nilaiRating, String id, String flag) async{
    if(flag == "MORE"){
      nilaiRating = nilaiRating * -1;
    }
    Map<String, dynamic> json = {'NilaiRating' : FieldValue.increment(nilaiRating)};
    await _db.collection("/News").doc(id).update(json);
  }

  Future<void> updateViewsNews(Map<String, dynamic> json, String id) async{
    await _db.collection("/News").doc(id).update(json);
  }

  // Title  - Search
  // Future<List<NewsModel>> getSearchTitleNews(String id) async{
  //   final snapshot = await _db.collection("/News").orderBy("Title").startAt([id,]).endAt([id+'\uf8ff',]).get();
  //   final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
  //   return newsData;
  // }

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

}