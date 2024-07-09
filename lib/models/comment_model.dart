import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel{
  final String? id;
  final String idNews;
  String pathFoto;
  final String emailPengguna;
  final String userNamePengguna;
  final String waktu;
  final String komen;

  CommentModel({
    this.id,
    required this.idNews,
    required this.pathFoto,
    required this.emailPengguna,
    required this.userNamePengguna,
    required this.waktu,
    required this.komen,
  });

  toJson(){
    return{
      "IdNews" : idNews,
      "PathFoto" : pathFoto,
      "EmailPengguna" : emailPengguna,
      "UserNamePengguna" : userNamePengguna,
      "Waktu" : waktu,
      "Komen" : komen,
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
    );
  }

}