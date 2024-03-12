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

  String judul = "";
  String link = "";
  String linkGambar = "";

  // PENTING
  List<String> listJudul = ["null"];

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
    print('Data terisi ');
    print('salah satu data : ${title} ');
    return newsData;
  }

  List<String> getlistTitle(){
    return listJudul;
  }

  String getTitle(){
    return title11;
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

  // PENTING
  Future<List<NewsModel>> getAllNewsANTARAHumaniora() async{
    final snapshot = await _db.collection("/News").where("Category", isEqualTo: "humaniora").get();
    final newsData = snapshot.docs.map((e) => NewsModel.fromSnapshot(e)).toList();
    for(int i=0; i<newsData.length;i++){
      listJudul.add(newsData[i].title);
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
  
}