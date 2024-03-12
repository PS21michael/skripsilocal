import 'package:get/get.dart';
import 'package:skripsilocal/models/comment_model.dart';
import 'package:skripsilocal/repository/comment_repository/comment_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';

class CommentController extends GetxController{
  static CommentController get instance => Get.find();

  Rx<CommentModel> comment = CommentModel.empty().obs;

  final _authRepo     = Get.put(AuthenticationRepository());
  final _commentRepo  = Get.put(CommentRepository());

  String idNews = "5NGzmetvv9TbT1lMadwC";

  getCommentData() async{
    return await _commentRepo.getSingelCommentDetails(idNews);
  }

  Future<List<CommentModel>> getAllComment() async{
    return await _commentRepo.getAllComment();
  }

  List<CommentModel>? getAllDataList(){
    getAllComment();
    return _commentRepo.getLstComment();
  }

  launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

}