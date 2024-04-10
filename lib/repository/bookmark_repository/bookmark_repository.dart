import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsilocal/models/bookmark_model.dart';

class BookmarkRepository extends GetxController{

  var count = 0;
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
  
  Future<List<BookmarkModel>> getAllBookmarks() async{
    final snapshot = await _db.collection("/Bookmark").get();
    final bookmarkData = snapshot.docs.map((e) => BookmarkModel.fromSnapshot(e)).toList();
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

  List<String> getListTitleBookmark(){
    return listBookMarkTitle;
  }
  void setNullListTitleBookmark(){
    listBookMarkTitle = [];
  }

  List<String> getListIdBookmarkFromSingelUser(){
    return listIdBookmarkFromSingelIdUser;
  }
  
  Future<void> updateBookmarkRecord(BookmarkModel bookmarkModel, String id) async{
    await _db.collection("/Bookmark").doc(id).update(bookmarkModel.toJson()).catchError((error, stackTrice){
      // print(error.toString());
    });
  }

  Future<String> uploadImage (String path, XFile image) async{
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
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