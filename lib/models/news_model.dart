
import 'package:cloud_firestore/cloud_firestore.dart';

var temp=0;

class NewsModel{
  final String? id;
  final String publisher;
  final String author;
  final String title;
  final String description;
  String urlImage;
  final String urlNews;
  final String publishedTime;
  final String category;
  final int views;
  final int countPeriod;
  final int nilaiRating;
  final int jumlahPerating;

  NewsModel({
    this.id,
    required this.publisher,
    required this.author,
    required this.title,
    required this.description,
    required this.urlImage,
    required this.urlNews,
    required this.publishedTime,
    required this.category,
    required this.views,
    required this.countPeriod,
    required this.nilaiRating,
    required this.jumlahPerating
  });

  static NewsModel empty() => NewsModel(
      publisher: '',
      author: '',
      title: '',
      description: '',
      urlImage: '',
      urlNews: '',
      publishedTime: '',
      category: '',
      views: 0,
      countPeriod: 0,
      nilaiRating: 0,
      jumlahPerating: 0,
  );

  // Json parse To
  toJson(){
    return {
      "Publisher" : publisher,
      "Author" : author,
      "Title" : title,
      "Description" : description,
      "UrlImage" : urlImage,
      "UrlNews" : urlNews,
      "PublishedTime" : publishedTime,
      "Category" : category,
      "Views" : views,
      "CountPeriod" : countPeriod,
      "NilaiRating" : 0,
      "JumlahPerating" : 0,
    };
  }

  factory NewsModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return NewsModel(
        id: document.id,
        publisher: data?["Publisher"],
        author: data?["Author"],
        title: data?["Title"],
        description: data?["Description"],
        urlImage: data?["UrlImage"],
        urlNews: data?["UrlNews"],
        publishedTime: data?["PublishedTime"],
        category: data?["Category"],
        views: data?["Views"],
        countPeriod: data?["CountPeriod"],
        nilaiRating: data?["NilaiRating"],
        jumlahPerating: data?["JumlahPerating"]
    );
  }
}