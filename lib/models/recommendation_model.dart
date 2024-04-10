
import 'package:cloud_firestore/cloud_firestore.dart';

var temp=0;

class RecommendationModel{
  final String? id;
  final String idNews;
  final String idPengguna;
  final String publisher;
  final String author;
  final String title;
  final String description;
  String urlImage;
  final String urlNews;
  final String publishedTime;
  final String category;
  final double recommendationScore;

  RecommendationModel({
    this.id,
    required this.idNews,
    required this.idPengguna,
    required this.publisher,
    required this.author,
    required this.title,
    required this.description,
    required this.urlImage,
    required this.urlNews,
    required this.publishedTime,
    required this.category,
    required this.recommendationScore,
  });

  static RecommendationModel empty() => RecommendationModel(
      idNews: '',
      idPengguna: '',
      publisher: '',
      author: '',
      title: '',
      description: '',
      urlImage: '',
      urlNews: '',
      publishedTime: '',
      category: '',
      recommendationScore: 0.0
  );

  // Parser
  toJson(){
    return {
      "IdNews" : idNews,
      "IdPengguna" : idPengguna,
      "Publisher" : publisher,
      "Author" : author,
      "Title" : title,
      "Description" : description,
      "UrlImage" : urlImage,
      "UrlNews" : urlNews,
      "PublishedTime" : publishedTime,
      "Category" : category,
      "RecommendationScore" : recommendationScore,
    };
  }

  factory RecommendationModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return RecommendationModel(
        id: document.id,
        idNews: data?["IdNews"],
        idPengguna: data?["IdPengguna"],
        publisher: data?["Publisher"],
        author: data?["Author"],
        title: data?["Title"],
        description: data?["Description"],
        urlImage: data?["UrlImage"],
        urlNews: data?["UrlNews"],
        publishedTime: data?["PublishedTime"],
        category: data?["Category"],
        recommendationScore: data?["RecommendationScore"]
    );

  }

}