import 'package:get/get.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';

class NewsController extends GetxController{
  static NewsController get instance => Get.find();

  Rx<NewsModel> news = NewsModel.empty().obs;

  final _authRepo = Get.put(AuthenticationRepository());
  final _newsRepo = Get.put(NewsRepository());

  String title = "TKN Prabowo Yakin Mahfud Mundur Tak Goyang Kabinet Jokowi";


  getUserData(String title1)async{
    return await _newsRepo.getSingelNewsDetails(title1);
  }

  getSingleNewsDetail(String title) async{
    return await _newsRepo.getSingelNewsDetails(title);
  }

  String getTitle(){
    String titile = _newsRepo.getTitle();
    return titile;
  }

  Future<List<NewsModel>> getAllNews() async{
    return await _newsRepo.getAllNews();
  }

  Future<void> createNews(NewsModel news) async{
    await _newsRepo.insertNews(news);
  }

  Future<List<NewsModel>> getAllNewsAntaraHumaniora(int time) async{
    return await _newsRepo.getAllNewsANTARAHumaniora(time);
  }

  Future<void> updateFlagDislikeNews(int dislike, String id) async{
    await _newsRepo.updateDislikeRecord(dislike, id);
  }

  Future<void> updateFlagLikeNews(int like, String id) async{
    await _newsRepo.updateLikeRecord(like, id);
  }



}