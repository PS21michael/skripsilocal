
import 'package:cloud_firestore/cloud_firestore.dart';

var temp=0;

class RatingModel{
  final String? id;
  final String idNews;
  final String idPengguna;
  final int nilaiRating;
  final String timeRating;
  final String publisher;
  final String author;
  final String title;
  final String description;
  String urlImage;
  final String urlNews;
  final String category;

  RatingModel({
    this.id,
    required this.idNews,
    required this.idPengguna,
    required this.nilaiRating,
    required this.timeRating,
    required this.publisher,
    required this.author,
    required this.title,
    required this.description,
    required this.urlImage,
    required this.urlNews,
    required this.category,
  });

  static RatingModel empty() => RatingModel(
      idNews: '',
      idPengguna: '',
      nilaiRating: 0,
      timeRating: '',
      publisher: '',
      author: '',
      title: '',
      description: '',
      urlImage: '',
      urlNews: '',
      category: '',
  );

  // Parser
  toJson(){
    return{
      "IdNews" : idNews,
      "IdPengguna" : idPengguna,
      "NilaiRating" : nilaiRating,
      "TimeRating" : timeRating,
      "Publisher" : publisher,
      "Author" : author,
      "Title" : title,
      "Description" : description,
      "UrlImage" : urlImage,
      "UrlNews" : urlNews,
      "Category" : category,
    };
  }

  factory RatingModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return RatingModel(
        id: document.id,
        idNews: data?["IdNews"],
        idPengguna: data?["IdPengguna"],
        nilaiRating: data?["NilaiRating"],
        timeRating: data?["TimeRating"],
        publisher: data?["Publisher"],
        author: data?["Author"],
        title: data?["Title"],
        description: data?["Description"],
        urlImage: data?["UrlImage"],
        urlNews: data?["UrlNews"],
        category: data?["Category"],
    );
  }

}