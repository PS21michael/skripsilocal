import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsilocal/models/bookmark_model.dart';

class BookmarkRepository extends GetxController{

  static BookmarkRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  insertBookmark(BookmarkModel bookmarkModel) async{
    await _db.collection("/Bookmark").add(bookmarkModel.toJson())
        .catchError((error, stackTrice){
      // print(error.toString());
    });
    // print('Bookmark ke ${count+=1}Berhasil dibuat');
  }

  Future<BookmarkModel> getSingelBookmarkDetails(String idPengguna) async{
    final snapshot = await _db.collection("/Bookmark").where("IdPengguna", isEqualTo: idPengguna).get();
    final bookmarkData = snapshot.docs.map((e) => BookmarkModel.fromSnapshot(e)).single;
    return bookmarkData;
  }

// AVoid Redundant
  List<String> listBookMarkTitle = [];
  String isDataExisst = "null";
  List<String> listIdBookmarkFromSingelIdUser = [];
  Future<List<BookmarkModel>> getAllBookmarksFromSingleUser(String idPengguna) async{
    final snapshot = await _db.collection("/Bookmark").where("IdPengguna", isEqualTo: idPengguna).get();
    final bookmarkData = snapshot.docs.map((e) => BookmarkModel.fromSnapshot(e)).toList();
    isDataExisst = "";
    if(bookmarkData.isEmpty){
      isDataExisst = "NO";
    } else{
      isDataExisst = "YES";
    }
    listIdBookmarkFromSingelIdUser = [];
    listBookMarkTitle = [];
    for(int i=0; i<bookmarkData.length; i++){
      listIdBookmarkFromSingelIdUser.add(bookmarkData[i].id.toString());
      // print("Id : " + bookmarkData[i].id.toString());
      listBookMarkTitle.add(bookmarkData[i].title);
    }
    // print("list bookmark yg ada : ${listIdBookmarkFromSingelIdUser.toString()}");
    return bookmarkData;
  }

  String isDataAvail(){
    return isDataExisst;
  }

  List<String> getListIdBookmarkFromSingelUser(){
    return listIdBookmarkFromSingelIdUser;
  }
  
  Future<void> deleteBookMark(String id) async {
    await _db.collection("/Bookmark").doc(id).delete();
  }

  String dataAvail = "";
  Future<List<BookmarkModel>> getAllBookmarksOne(userId, title) async{
    final snapshot = await _db.collection("/Bookmark").where("IdPengguna", isEqualTo: userId).where("Title", isEqualTo: title).get();
    final bookmarkData = snapshot.docs.map((e) => BookmarkModel.fromSnapshot(e)).toList();
    dataAvail = "";
    if(bookmarkData.isNotEmpty ){
      dataAvail = "YES";
    } else if(bookmarkData.isEmpty) {
      dataAvail = "NO";
    }
    return bookmarkData;
  }

  String getDataAvail(){
    return dataAvail;
  }
}