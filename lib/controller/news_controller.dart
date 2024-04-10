import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
// import '../../../repository/authentication_repository/authentication_repository.dart';

class NewsController extends GetxController{
  static NewsController get instance => Get.find();

  Rx<NewsModel> news = NewsModel.empty().obs;

  // final _authRepo = Get.put(AuthenticationRepository());
  final _newsRepo = Get.put(NewsRepository());

  String title = "TKN Prabowo Yakin Mahfud Mundur Tak Goyang Kabinet Jokowi";


  getNewsData(String title1)async{
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

  // Filter time => ASC/DESC (All News)
  Future<List<NewsModel>> getAllNewsFilterTime(String period) async{
    return await _newsRepo.getAllNewsBasedOnDate(period);
  }

  // Filter time => ASC/DESC (Favorit News)
  Future<List<NewsModel>> getAllNewsFavoritFilterTime(List<String> listFavorit, String period) async{
    return await _newsRepo.getAllNewsBasedOnDateAndListFavorit(listFavorit, period);
  }

  // Searching => (Favorit News)
  Future<List<NewsModel>> getAllNewsFavoritSearching(List<String> listFavorit, String id) async{
    return await _newsRepo.getSearchTitleNewsFavorit(listFavorit, id);
  }


  Future<List<NewsModel>> getAllNewsFavorit(List<String> listFavorit) async{
    return await _newsRepo.getAllNewsFavorit(listFavorit);
  }

  Future<void> createNews(NewsModel news) async{
    await _newsRepo.insertNews(news);
  }

  Future<void> updateViews(String id)async{
    Map<String, dynamic> json = {'Views' : FieldValue.increment(1)};
    await _newsRepo.updateViewsNews(json, id);
  }

  // Future<List<NewsModel>> getAllNewsAntaraHumaniora(int time) async{
  //   return await _newsRepo.getAllNewsANTARAHumaniora(time);
  // }

  // Future<void> updateFlagDislikeNews(int dislike, String id) async{
  //   await _newsRepo.updateDislikeRecord(dislike, id);
  // }
  //
  // Future<void> updateFlagLikeNews(int like, String id) async{
  //   await _newsRepo.updateLikeRecord(like, id);
  // }

// Advanced -- FF - Heavy Work
  List<NewsModel> getAllSearchAdvanced(String key) {
    _newsRepo.getAllNewsSearchAdvanced(key);
    return  _newsRepo.getAllSearchTempNewsModel();
  }

  void setAllSearchAdvancedNull(){
    _newsRepo.setAllSearchTempNewsModelNull();
  }

// Title
  Future<List<NewsModel>> getAllSearchTitleNews(String id) async{
    return await _newsRepo.getSearchTitleNews(id);
  }

// Description
  Future<List<NewsModel>> getAllSearchDescriptionNews(String id) async{
    return await _newsRepo.getSearchDescriptionNews(id);
  }



}