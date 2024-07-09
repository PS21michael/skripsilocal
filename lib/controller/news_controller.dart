import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';

class NewsController extends GetxController{
  static NewsController get instance => Get.find();

  // final _authRepo = Get.put(AuthenticationRepository());
  final _newsRepo = Get.put(NewsRepository());

  // String title = "TKN Prabowo Yakin Mahfud Mundur Tak Goyang Kabinet Jokowi";


  getNewsData(String title1)async{
    return await _newsRepo.getSingelNewsDetails(title1);
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

  Future<void> updateViews(String id)async{
    Map<String, dynamic> json = {'Views' : FieldValue.increment(1)};
    await _newsRepo.updateViewsNews(json, id);
  }

// Title
  Future<List<NewsModel>> getAllSearchTitleNews(String id) async{
    return await _newsRepo.getSearchTitleNews(id);
  }

}