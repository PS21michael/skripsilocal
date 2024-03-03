
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

var temp =0;

class LikeDislikeNewsModel{
  final String? id;
  final String idNews;
  final String idPengguna;
  final String flag;

  LikeDislikeNewsModel({
    this.id,
    required this.idNews,
    required this.idPengguna,
    required this.flag
  });

  static LikeDislikeNewsModel empty () => LikeDislikeNewsModel(
      idNews: '',
      idPengguna: '',
      flag: ''
  );

  // Json Parser
  toJson(){
    return{
      "IdNews" : idNews,
      "IdPengguna" : idPengguna,
      "Flag" : flag
    };
  }

  // Json Deparser
  factory LikeDislikeNewsModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();

    return LikeDislikeNewsModel(
        id: document.id,
        idNews: data?["IdNews"],
        idPengguna: data?["IdPengguna"],
        flag: data?["Flag"]
    );
  }


}