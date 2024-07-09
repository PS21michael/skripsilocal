import 'package:get/get.dart';
import 'package:skripsilocal/models/comment_model.dart';
import 'package:skripsilocal/repository/comment_repository/comment_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class CommentController extends GetxController{
  static CommentController get instance => Get.find();

  // final _authRepo     = Get.put(AuthenticationRepository());
  final _commentRepo  = Get.put(CommentRepository());

  Stream<List<CommentModel>> getAllCommentbasedOnIdNews(String idNews){
    return _commentRepo.getAllCommentBasedOnIdNews(idNews);
  }

  Future<void>createComment(CommentModel commentModel) async{
    await _commentRepo.insertComment(commentModel);
  }

}