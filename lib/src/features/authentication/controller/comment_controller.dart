
import 'package:get/get.dart';
import 'package:skripsilocal/src/features/authentication/models/comment_model.dart';
import 'package:skripsilocal/src/repository/comment_repository/comment_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class CommentController extends GetxController{
  static CommentController get instance => Get.find();

  Rx<CommentModel> comment = CommentModel.empty().obs;

  final _authRepo     = Get.put(AuthenticationRepository());
  final _commentRepo  = Get.put(CommentRepository());

  getCommentData(String idNews) async{
    return await _commentRepo.getSingelCommentDetails(idNews);
  }

  Future<List<CommentModel>> getAllComment() async{
    return await _commentRepo.getAllComment();
  }

  Future<List<CommentModel>> getAllCommentbasedOnIdNews(String idNews) async{
    return await _commentRepo.getAllCommentBasedOnIdNews(idNews);
  }

  List<CommentModel>? getAllDataList(){
    getAllComment();
    return _commentRepo.getLstComment();
  }

  Future<void>createComment(CommentModel commentModel) async{
    print('Comment Akan Dibuat');
    await _commentRepo.insertComment(commentModel);
  }

  launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

}