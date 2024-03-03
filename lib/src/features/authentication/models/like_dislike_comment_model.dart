
import 'package:cloud_firestore/cloud_firestore.dart';

var temp =0;

class LikeDislikeCommentModel{
  final String? id;
  final String idComment;
  final String idNews;
  final String idPengguna;
  final String flag;

  LikeDislikeCommentModel({
    this.id,
    required this.idComment,
    required this.idNews,
    required this.idPengguna,
    required this.flag
  });

  static LikeDislikeCommentModel empty () => LikeDislikeCommentModel(
      idComment: '',
      idNews: '',
      idPengguna: '',
      flag: ''
  );

  // Json Parser
  toJson(){
    return{
      "IdComment" : idComment,
      "IdNews" : idNews,
      "IdPengguna" : idPengguna,
      "Flag" : flag
    };
  }

  // Json Deparser
  factory LikeDislikeCommentModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data();

    return LikeDislikeCommentModel(
        id: document.id,
        idComment: data?["IdComment"],
        idNews: data?["IdNews"],
        idPengguna: data?["IdPengguna"],
        flag: data?["Flag"]
    );

  }

}