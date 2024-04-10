import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/models/history_model.dart';

class HistoryRepository extends GetxController{

  var count = 0;
  static HistoryRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  
  insertHistory(HistoryModel historyModel) async{
    await _db.collection("/History").add(historyModel.toJson())
        .catchError((error, stackTrice){
      // print(error.toString());
    });
    // print('History ke ${count+=1}Berhasil dibuat');
  }

  Future<List<HistoryModel>> getAllHistoryDetailsFromIdUserOrderByTime(String idPengguna, String periode)async{
    if(periode == "DESC"){
      final snapshot = await _db.collection("/History").where("IdPengguna", isEqualTo: idPengguna).orderBy("Waktu", descending: true).get();
      final historyData = snapshot.docs.map((e) => HistoryModel.fromSnapshot(e)).toList();
      return historyData;
    } else{
      final snapshot = await _db.collection("/History").where("IdPengguna", isEqualTo: idPengguna).orderBy("Waktu", descending: false).get();
      final historyData = snapshot.docs.map((e) => HistoryModel.fromSnapshot(e)).toList();
      return historyData;
    }
  }

  String isDataExist = "";
  List<String> listIdHistoryFromSingelIdUser = [];
  Future<List<HistoryModel>> getAllHistoryDetailsFromIdUser(String idPengguna)async{
    final snapshot = await _db.collection("/History").where("IdPengguna", isEqualTo: idPengguna).get();
    final historyData = snapshot.docs.map((e) => HistoryModel.fromSnapshot(e)).toList();
    isDataExist = "";
    if(historyData.isEmpty){
      isDataExist = "NO";
    } else{
      isDataExist = "YES";
    }
    listIdHistoryFromSingelIdUser = [];
    for(int i=0; i<historyData.length; i++){
      listIdHistoryFromSingelIdUser.add(historyData[i].id.toString());
    }
    return historyData;
  }

  String isDataAvail(){
    return isDataExist;
  }

  List<String> getListIdHistoryFromSingelUser(){
    return listIdHistoryFromSingelIdUser;
  }

  Future<void> deleteHistory(String id) async{

    await _db.collection("History").doc(id).delete();
  }

  Future<List<HistoryModel>> getAllHistoryFromUserdIdAndNewsId(userId, newsId) async{
    final snapshot = await _db.collection("History").where("IdPengguna", isEqualTo: userId).where("IdNews", isEqualTo: newsId).get();
    final historyData = snapshot.docs.map((e) => HistoryModel.fromSnapshot(e)).toList();
    return historyData;
  }

  Future<List<HistoryModel>> getAllHistoryFromIdNews(newsId) async{
    final snapshot = await _db.collection("History").where("IdNews", isEqualTo: newsId).get();
    final historyData = snapshot.docs.map((e) => HistoryModel.fromSnapshot(e)).toList();
    return historyData;
  }

}