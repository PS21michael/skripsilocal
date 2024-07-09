import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsilocal/models/comment_model.dart';

class CommentRepository extends GetxController{
  
  static CommentRepository get instance => Get.find();
  
  final _db = FirebaseFirestore.instance;
  
  insertComment(CommentModel commentModel) async{
    await _db.collection("/Comment").add(commentModel.toJson())
        .catchError((error, stackTrice){
          // print(error.toString());
    });
    // print('Comment ke ${count+=1}Berhasil dibuat');
  }

  Stream<List<CommentModel>> getAllCommentBasedOnIdNews(String idNews) {
    return _db.collection("/Comment")
        .orderBy("Waktu",descending: false)
        .where("IdNews", isEqualTo: idNews)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => CommentModel.fromSnapshot(doc)).toList());
  }

}
