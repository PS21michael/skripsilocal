import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/models/history_model.dart';

class HistoryRepository extends GetxController{

  static HistoryRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  
  insertHistory(HistoryModel historyModel) async{
    await _db.collection("/History").add(historyModel.toJson())
        .catchError((error, stackTrice){
      // print(error.toString());
    });
    // print('History ke ${count+=1}Berhasil dibuat');
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

}