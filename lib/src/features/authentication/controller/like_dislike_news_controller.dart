
import 'package:get/get.dart';
import 'package:skripsilocal/src/features/authentication/models/like_dislike_news_model.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/src/repository/like_dislike_repository/like_dislike_news_repository.dart';

class LikeDislikeNewsController extends GetxController{

  static LikeDislikeNewsController get instance => Get.find();

  Rx<LikeDislikeNewsModel> likeDislikeNews = LikeDislikeNewsModel.empty().obs;

  final _authRepo = Get.put(AuthenticationRepository());
  final _likeDislikeNewsRepo = Get.put(LikeDislikeNewsRepository());

  // 1. Create likeDislikeNews Data
  Future<void> createLikeDislikeNews(LikeDislikeNewsModel likeDislikeNewsModel) async{
    await _likeDislikeNewsRepo.insertLikeDislikeNewsData(likeDislikeNewsModel);
  }

  // 2. Fetching singel likeDislikeNews record
  getSingleLikeDislikeNewsData(String idPengguna, String idNews) async{
    return await _likeDislikeNewsRepo.getSingleLikeDislikeNewsDetails(idPengguna, idNews);
  }

  // 3. Fetching all like dislike news from id news
  Future<List<LikeDislikeNewsModel>> getAllLikeDislikeNews(String idNews) async{
    return await _likeDislikeNewsRepo.getAllLikeDislikeNews(idNews);
  }

  // 4. Update flag LIKE or DISLIKE from idData
  updateFlagLikeDislike(String flag, String id) async{
    await _likeDislikeNewsRepo.updateLikeDislikeRecord(flag, id);
  }

  // 5. Delete Data likeDislikeNews from idData
  deleteDataLikeDislikeNews(String id) async{
    await _likeDislikeNewsRepo.deleteSingleLikeDislikeNewsRecord(id);
  }


}