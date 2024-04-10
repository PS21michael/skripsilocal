import 'package:get/get.dart';
import 'package:skripsilocal/models/history_model.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
// import '../repository/authentication_repository/authentication_repository.dart';

class HistoryController extends GetxController{

  static HistoryController get instance => Get.find();

  Rx<HistoryModel> history = HistoryModel.empty().obs;

  // final _authRepo = Get.put(AuthenticationRepository());
  final _historyRepo = Get.put(HistoryRepository());

  Future<List<HistoryModel>> getAllHistoryFromSingleUser(String idPengguna)async{
    return await _historyRepo.getAllHistoryDetailsFromIdUser(idPengguna);
  }

  Future<List<HistoryModel>> getAllHistoryFromSingleUserOrderByTime(String idPengguna, String period)async{
    return await _historyRepo.getAllHistoryDetailsFromIdUserOrderByTime(idPengguna, period);
  }

  Future<List<HistoryModel>> getAllHistoryFromIdNews(String newsId) async{
    return await _historyRepo.getAllHistoryFromIdNews(newsId);
  }

  Future<List<HistoryModel>> getAllHistoryFromUserIdAndIdNews(String idPengguna, String newsId) async{
    return await _historyRepo.getAllHistoryFromUserdIdAndNewsId(idPengguna, newsId);
  }

  Future<void> createHistory(HistoryModel historyModel)async{
    // print("History akan Dibuat");
    await _historyRepo.insertHistory(historyModel);
  }

  Future<void> deleteHistory(String id)async{
    await _historyRepo.deleteHistory(id);
  }





}