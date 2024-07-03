import 'package:cloud_firestore/cloud_firestore.dart';

var temp=0;

class BookmarkModel{
  final String? id;
  final String idNews;
  final String idPengguna;
  final String title;
  final String urlData;
  final String urlGambar;
  final String kategori;
  final String publisher;
  final String description;
  final String author;

  BookmarkModel({
    this.id,
    required this.idNews,
    required this.idPengguna,
    required this.title,
    required this.urlData,
    required this.urlGambar,
    required this.kategori,
    required this.publisher,
    required this.description,
    required this.author,
  });

  static BookmarkModel empty() => BookmarkModel(
    idNews: '',
    idPengguna: '',
    title: '',
    urlData: '',
    urlGambar: '',
    kategori: '',
    publisher: '',
    description: '',
    author: '',
  );

  toJson(){
    return{
      "IdNews" : idNews,
      "IdPengguna" : idPengguna,
      "Title" : title,
      "UrlData" : urlData,
      "UrlGambar" : urlGambar,
      "Kategori" : kategori,
      "Publisher" : publisher,
      "Description" : description,
      "Author" : author,
    };
  }

  factory BookmarkModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return BookmarkModel(
      id: document.id,
      idNews: data?["IdNews"],
      idPengguna: data?["IdPengguna"],
      title: data?["Title"],
      urlData: data?["UrlData"],
      urlGambar: data?["UrlGambar"],
      kategori: data?["Kategori"],
      publisher: data?["Publisher"],
      description: data?["Description"],
      author: data?["Author"],
    );
  }

}