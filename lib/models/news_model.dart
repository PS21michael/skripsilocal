
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
  final int saveDate;

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
    required this.saveDate
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
      saveDate: 0
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
      "SaveDate" : saveDate,
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
        saveDate: data?["SaveDate"]
    );
  }
}