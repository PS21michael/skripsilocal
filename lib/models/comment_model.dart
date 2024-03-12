
import 'package:cloud_firestore/cloud_firestore.dart';

var temp=0;

class CommentModel{
  final String? id;
  final String idNews;
  String pathFoto;
  final String emailPengguna;
  final String userNamePengguna;
  final String waktu;
  final String komen;
  final int like;
  final int dislike;

  CommentModel({
    this.id,
    required this.idNews,
    required this.pathFoto,
    required this.emailPengguna,
    required this.userNamePengguna,
    required this.waktu,
    required this.komen,
    required this.like,
    required this.dislike,
  });

  static CommentModel empty() => CommentModel(
      idNews: '',
      pathFoto: '',
      emailPengguna: '',
      userNamePengguna: '',
      waktu: '',
      komen: '',
      like: 0,
      dislike: 0,
  );

  // Json Parse To
  toJson(){
    return{
      "IdNews" : idNews,
      "PathFoto" : pathFoto,
      "EmailPengguna" : emailPengguna,
      "UserNamePengguna" : userNamePengguna,
      "Waktu" : waktu,
      "Komen" : komen,
      "Like" : like,
      "Dislike" : dislike,
    };
  }

  factory CommentModel.fromSnapshot (DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();
    return CommentModel(
        id: document.id,
        idNews: data?["IdNews"],
        pathFoto: data?["PathFoto"],
        emailPengguna: data?["EmailPengguna"],
        userNamePengguna: data?["UserNamePengguna"],
        waktu: data?["Waktu"],
        komen: data?["Komen"],
        like: data?["Like"],
        dislike: data?["Dislike"]
    );
  }

}