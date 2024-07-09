import 'package:get/get.dart';
import 'package:skripsilocal/models/history_model.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';

class HistoryController extends GetxController{

  static HistoryController get instance => Get.find();

  // final _authRepo = Get.put(AuthenticationRepository());
  final _historyRepo = Get.put(HistoryRepository());

  Future<List<HistoryModel>> getAllHistoryFromSingleUser(String idPengguna)async{
    return await _historyRepo.getAllHistoryDetailsFromIdUser(idPengguna);
  }

  Future<void> createHistory(HistoryModel historyModel)async{
    // print("History akan Dibuat");
    await _historyRepo.insertHistory(historyModel);
  }

  Future<void> deleteHistory(String id)async{
    await _historyRepo.deleteHistory(id);
  }





}