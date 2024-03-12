
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
  final int like;
  final int dislike;
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
    required this.like,
    required this.dislike,
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
      like: 0,
      dislike: 0,
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
      "Like" : like,
      "Dislike" : dislike,
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
        like: data?["Like"],
        dislike: data?["Dislike"],
        saveDate: data?["SaveDate"]
    );
  }
}