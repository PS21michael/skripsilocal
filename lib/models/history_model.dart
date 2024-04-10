
import 'package:cloud_firestore/cloud_firestore.dart';

var temp = 0;

class HistoryModel{

  final String? id;
  final String idNews;
  final String idPengguna;
  final String title;
  final String urlData;
  final String urlGambar;
  final String kategori;
  final String publisher;
  final String description;
  final String waktu;
  final String author;

  HistoryModel({
    this.id,
    required this.idNews,
    required this.idPengguna,
    required this.title,
    required this.urlData,
    required this.urlGambar,
    required this.kategori,
    required this.publisher,
    required this.description,
    required this.waktu,
    required this.author,
  });

  static HistoryModel empty() => HistoryModel(
    idNews: '',
    idPengguna: '',
    title: '',
    urlData: '',
    urlGambar: '',
    kategori: '',
    publisher: '',
    description: '',
    waktu: '',
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
      "Waktu" : waktu,
      "Author" : author,
    };
  }


  factory HistoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return HistoryModel(
      id: document.id,
      idNews: data?["IdNews"],
      idPengguna: data?["IdPengguna"],
      title: data?["Title"],
      urlData: data?["UrlData"],
      urlGambar: data?["UrlGambar"],
      kategori: data?["Kategori"],
      publisher: data?["Publisher"],
      description: data?["Description"],
      waktu: data?["Waktu"],
      author: data?["Author"],
    );
  }

}