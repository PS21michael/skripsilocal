import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/models/recommendation_model.dart';

class RecommendationRepository extends GetxController{

  static RecommendationRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  insertRecommendation (RecommendationModel recommendationModel) async{
    await _db.collection("/Recommendation").add(recommendationModel.toJson())
        .catchError((error, stackTrice){
      print(error.toString());
    });
  }

  List<RecommendationModel> listRecomendModelUser = [];
  String isDataRecommendAvail = "";
  List<String> listIdRecommendFromSingelUserId = [];
  Future<List<RecommendationModel>> getAllRecomendationForUserTarget(String idPengguna) async{
    final snapshot = await _db.collection("/Recommendation").where("IdPengguna", isEqualTo: idPengguna).orderBy("RecommendationScore", descending: true).get();
    final recommendationData = snapshot.docs.map((e) => RecommendationModel.fromSnapshot(e)).toList();
    isDataRecommendAvail = "";
    listIdRecommendFromSingelUserId = [];
    for(int i=0; i<recommendationData.length; i++){
      listIdRecommendFromSingelUserId.add(recommendationData[i].id.toString());
      listRecomendModelUser.add(recommendationData[i]);
    }
    if(recommendationData.isEmpty){
      isDataRecommendAvail = "NO";
    } else {
      isDataRecommendAvail = "YES";
    }
    return recommendationData;
  }

  String isDataAvail(){
    return isDataRecommendAvail;
  }

  List<String> getListIdRecommendFromSingelUserId(){
    return listIdRecommendFromSingelUserId;
  }

  Future<void> updateNilaiRecommend(Map<String, dynamic> json, String id) async{
    await _db.collection("/Recommendation").doc(id).update(json);
  }

  String tempId="";
  Future<List<RecommendationModel>> getAllRecomendationByUserIdAndNewsId(String idUser, String idNews) async{
    final snapshot = await _db.collection("/Recommendation").where("IdPengguna", isEqualTo: idUser).where("IdNews", isEqualTo: idNews).get();
    final recommendationData = snapshot.docs.map((e) => RecommendationModel.fromSnapshot(e)).toList();
    for(int i=0; i<recommendationData.length; i++){
      tempId=recommendationData[i].id!;
    }
    return recommendationData;
  }

  // Delete single reccomendation
  Future<void> deleteSingleRecommendation(String id) async{
    await _db.collection("/Recommendation").doc(id).delete();
  }


}