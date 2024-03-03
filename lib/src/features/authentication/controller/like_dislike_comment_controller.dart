
import 'package:get/get.dart';
import 'package:skripsilocal/src/features/authentication/models/like_dislike_comment_model.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/src/repository/like_dislike_repository/like_dislike_comment_repository.dart';

class LikeDislikeCommentController extends GetxController{

  static LikeDislikeCommentController get instance => Get.find();

  Rx<LikeDislikeCommentModel> likeDislikeComment = LikeDislikeCommentModel.empty().obs;

  final _authRepo = Get.put(AuthenticationRepository());
  final _likeDislikeCommentRepo = Get.put(LikeDislikeCommentRepository());

  // 1. Create likeDislikeComment Data
  Future<void> createLikeDislikeComment(LikeDislikeCommentModel likeDislikeCommentModel) async{
    await _likeDislikeCommentRepo.insertLikeDislikeCommentData(likeDislikeCommentModel);
  }

  // 2. Fetching Single likeDislikeComment record
  getSingleLikeDislikeCommentData(String idPengguna, String idComment) async{
    return await _likeDislikeCommentRepo.getSingelLikeDislikeCommentDetails(idPengguna, idComment);
  }

  // 3. Fetching all like dislike news from id comment
  Future<List<LikeDislikeCommentModel>> getAllLikeDislikeComment(idComment) async{
    return await _likeDislikeCommentRepo.getAllLikeDislikeComment(idComment);
  }

  // 4. Update flag LIKE or DISLIKE from idData
  updateFlagLikeDislike(String flag, String id) async{
    await _likeDislikeCommentRepo.updateLikeDislikeRecord(flag, id);
  }

  // 5. Delete Data likeDislikeNews from idData
  deleteDataLikeDislikeComment(String id) async{
    await _likeDislikeCommentRepo.deleteSingleLikeDislikeCommentRecord(id);
  }


}