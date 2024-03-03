
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/features/authentication/models/like_dislike_news_model.dart';

class LikeDislikeNewsRepository extends GetxController{

  var count = 0;

  static LikeDislikeNewsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // testing only
  String flag="";

  // 1. Insert Like Dislike
  insertLikeDislikeNewsData(LikeDislikeNewsModel likeDislikeNewsModel) async{
    await _db.collection("/LikeDislikeNews").add(likeDislikeNewsModel.toJson())
        .catchError((error, stackTrice){
          print(error.toString());
    });
    print('LikeDislikeNews ke ${count+=1}Berhasil dibuat');
  }

  // 2. Fetching single record Like Dislike with iduser && idNews
  Future<LikeDislikeNewsModel> getSingleLikeDislikeNewsDetails(String idPengguna, String idNews) async{
    final snapshot = await _db.collection("/LikeDislikeNews").where("IdPengguna", isEqualTo: idPengguna).where("IdNews", isEqualTo: idNews).get();
    final likeDislikeNewsData = snapshot.docs.map((e) => LikeDislikeNewsModel.fromSnapshot(e)).single;
    // testing only
    flag = likeDislikeNewsData.flag;
    print("Data berhasil di assign");
    print("Nilai flag dari repo : ${flag}");
    return likeDislikeNewsData;

  }

  // testing only
  String getFlag(){
    return flag;
  }

  // 3. Fetching All record Like Dislike with idNews
  Future<List<LikeDislikeNewsModel>> getAllLikeDislikeNews(String idNews) async{
    final snapshot = await _db.collection("/LikeDislikeNews").where("IdNews", isEqualTo: idNews).get();
    final allLikeDislikeNewsData = snapshot.docs.map((e) => LikeDislikeNewsModel.fromSnapshot(e)).toList();
    return allLikeDislikeNewsData;
  }

  // 4. Update flag LIKE to DISLIKE or DISLIKE to LIKE with idlikeDislikeNews
  Future<void> updateLikeDislikeRecord(String flag, String id) async{
    Map<String, dynamic> json = {'Flag' : flag};
    await _db.collection("/LikeDislikeNews").doc(id).update(json).catchError((error, stacktrice){
        print(error.toString());
      });
  }

  // 5. Delete all value in singel idLikeDislikeNews
  Future<void> deleteSingleLikeDislikeNewsRecord(String id) async{
    await _db.collection("/LikeDislikeNews").doc(id).delete();
  }




}