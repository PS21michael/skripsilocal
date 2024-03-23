import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsilocal/models/comment_model.dart';

class CommentRepository extends GetxController{
  
  var count = 0;
  var comment;

  List<String>? listEmail;
  String listtEmail="";

  List<CommentModel>? listCommentData;

  String idComment="";
  String idNews="";
  String pathFoto="";
  String emailPengguna="";
  String userNamePengguna="";
  String waktu="";
  String komen="";
  int like = 0;
  int dislike = 0;

  
  static CommentRepository get instance => Get.find();
  
  final _db = FirebaseFirestore.instance;
  
  insertComment(CommentModel commentModel) async{
    await _db.collection("/Comment").add(commentModel.toJson())
        .catchError((error, stackTrice){
          print(error.toString());
    });
    print('Comment ke ${count+=1}Berhasil dibuat');
  }


  Future<CommentModel> getSingelCommentDetails(String idNews) async{
    final snapshot = await _db.collection("/Comment").where("IdNews", isEqualTo: idNews).get();
    final commentData = snapshot.docs.map((e) => CommentModel.fromSnapshot(e)).single;

    return commentData;
  }

  Future<List<CommentModel>> getAllComment() async{
    print('ChekpointComment 1');
    final snapshot = await _db.collection("/Comment").get();
    final commentData = snapshot.docs.map((e) => CommentModel.fromSnapshot(e)).toList();
    print('ChekpointComment 2');
    return commentData;
  }

  // Future<List<CommentModel>> getAllCommentBasedOnIdNews(String idNews) async{
  //   final snapshot = await _db.collection("/Comment").where("IdNews", isEqualTo: idNews).get();
  //   final commentData = snapshot.docs.map((e) => CommentModel.fromSnapshot(e)).toList();
  //   return commentData;
  // }

  Stream<List<CommentModel>> getAllCommentBasedOnIdNews(String idNews) {
    return _db.collection("/Comment")
        .orderBy("Waktu",descending: false)
        .where("IdNews", isEqualTo: idNews)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => CommentModel.fromSnapshot(doc)).toList());
  }


  List<CommentModel>? getLstComment(){
    return listCommentData;
  }

  String emailPeng(){
    return emailPengguna;
  }

  Future<void> updateCommentRecord(CommentModel commentModel, String id) async{
    await _db.collection("/Comment").doc(id).update(commentModel.toJson()).catchError((error, stackTrice){
      print(error.toString());
    });
  }

  Future<String> uploadImage (String path, XFile image) async{
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  }


  
}
