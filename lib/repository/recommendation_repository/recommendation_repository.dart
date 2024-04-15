

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/models/recommendation_model.dart';

class RecommendationRepository extends GetxController{

  var count = 0;

  static RecommendationRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  insertRecommendation (RecommendationModel recommendationModel) async{
    await _db.collection("/Recommendation").add(recommendationModel.toJson())
        .catchError((error, stackTrice){
      // print(error.toString());
    });
    // print('Recommendation ke ${count+=1}Berhasil dibuat');
  }

  List<RecommendationModel> listRecomendModelUser = [];
  String isDataRecommendAvail = "";
  Future<List<RecommendationModel>> getAllRecomendationForUserTarget(String idPengguna) async{
    final snapshot = await _db.collection("/Recommendation").where("IdPengguna", isEqualTo: idPengguna).orderBy("RecommendationScore", descending: true).get();
    final recommendationData = snapshot.docs.map((e) => RecommendationModel.fromSnapshot(e)).toList();
    isDataRecommendAvail = "";
    for(int i=0; i<recommendationData.length; i++){
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

  Future<void> updateNilaiRecommend(Map<String, dynamic> json, String id) async{
    await _db.collection("/Recommendation").doc(id).update(json);
  }

  Future<void> updateViewsRecommendation (Map<String, dynamic> json, String id) async{
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