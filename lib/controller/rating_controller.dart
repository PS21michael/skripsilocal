
import 'package:get/get.dart';
import 'package:skripsilocal/models/rating_model.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/rating_repository/rating_repository.dart';

class RatingController extends GetxController{

  static RatingController get instance => Get.find();

  Rx<RatingModel> rating = RatingModel.empty().obs;

  final _authRepo = Get.put(AuthenticationRepository());
  final _ratingRepo = Get.put(RatingRepository());

  Future<List<RatingModel>> getAllRating() async{
    return await _ratingRepo.getAllRatings();
  }

  Future<List<RatingModel>> getAllRatingExceptUserTarget(String idPengguna) async{
    return await _ratingRepo.getAllRatingsExceptUserTarget(idPengguna);
  }

  Future<List<RatingModel>> getAllRatingOnlyUserTarget(String idPengguna) async{
    return await _ratingRepo.getAllRatingsOnlyUserTarget(idPengguna);
  }

  Future<void> createRating(RatingModel rating) async{
    await _ratingRepo.insertRating(rating);
  }

  Future<List<RatingModel>> getAllRatingByIdUserAndIdNews(String idPengguna, String idNews) async{
    return await _ratingRepo.getAllRatingsByUserIdAndNewsId(idPengguna, idNews);
  }

  Future<void> updateRatingUsers(String id, int nilaiRatingBaru) async{
    Map<String, dynamic> json = {'NilaiRating' : nilaiRatingBaru};
    await _ratingRepo.updateRatingUsers(json, id);
  }

  Future<void> deleteRating(String id) async{
    await _ratingRepo.deleteRating(id);
  }


}