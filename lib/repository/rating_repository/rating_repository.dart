
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/models/rating_model.dart';

class RatingRepository extends GetxController{

  var count = 0;

  static RatingRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  insertRating(RatingModel ratingModel) async{
    await _db.collection("/Rating").add(ratingModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
    print('Rating ke ${count+=1}Berhasil dibuat');
  }


  Future<List<RatingModel>> getAllRatings() async{
    final snapshot = await _db.collection("/Rating").get();
    final ratingData = snapshot.docs.map((e) => RatingModel.fromSnapshot(e)).toList();

    return ratingData;
  }

  List<RatingModel> listAllRatingModel = [];
  Future<List<RatingModel>> getAllRatingsExceptUserTarget(String idUser) async{
    final snapshot = await _db.collection("/Rating").where("IdPengguna", isNotEqualTo: idUser).get();
    final ratingData = snapshot.docs.map((e) => RatingModel.fromSnapshot(e)).toList();

    listAllRatingModel = [];
    for(int i=0; i<ratingData.length; i++){
      listAllRatingModel.add(ratingData[i]);
    }

    return ratingData;
  }

  // Untuk cek user udah pernah isi rating atau belum
  String isDataRatingAvail = "";
  String tempId="";
  int nilaiRatingUser = 0;
  String idRatingByUserIdAndNewsId = "";
  Future<List<RatingModel>> getAllRatingsByUserIdAndNewsId(String idUser, String idNews) async{
    final snapshot = await _db.collection("/Rating").where("IdPengguna", isEqualTo: idUser).where("IdNews", isEqualTo: idNews).get();
    final ratingData = snapshot.docs.map((e) => RatingModel.fromSnapshot(e)).toList();
    if(ratingData.isEmpty ){
      isDataRatingAvail = "NO";
    } else {
      isDataRatingAvail = "YES";
    }
    for(int i=0; i<ratingData.length; i++){
      nilaiRatingUser = ratingData[i].nilaiRating;
      tempId=ratingData[i].id!;
      idRatingByUserIdAndNewsId = ratingData[i].id!;
    }
    return ratingData;
  }

  List<String> listIdNews = [];
  List<int> litScoreRatingUserTarget = [];
  List<RatingModel> listRatingModelUser = [];
  List<String> listIdRatingFromSingelUserId = [];
  Future<List<RatingModel>> getAllRatingsOnlyUserTarget(String idUser) async{
    final snapshot = await _db.collection("/Rating").where("IdPengguna", isEqualTo: idUser).get();
    final ratingData = snapshot.docs.map((e) => RatingModel.fromSnapshot(e)).toList();
    listIdNews = [];
    litScoreRatingUserTarget = [];
    listIdRatingFromSingelUserId = [];
    for(int i=0; i<ratingData.length; i++){
      listIdRatingFromSingelUserId.add(ratingData[i].id.toString());
      listIdNews.add(ratingData[i].idNews);
      litScoreRatingUserTarget.add(ratingData[i].nilaiRating);
    }

    return ratingData;
  }

  List<String> getListIdRatingFromSingelUserId(){
    return listIdRatingFromSingelUserId;
  }

  List<String> getListIdNewsUserTarget(){
    return listIdNews;
  }

  List<int> getListScoreUserTarget(){
    return litScoreRatingUserTarget;
  }

  Future<void> updateRatingUsers(Map<String, dynamic> json, String id) async{
    await _db.collection("/Rating").doc(id).update(json);
  }

  Future<void> deleteRating(String id) async{
    await _db.collection("/Rating").doc(id).delete();
  }



}