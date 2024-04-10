

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/models/recommendation_model.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/recommendation_repository/recommendation_repository.dart';

class RecommendationController extends GetxController{

  static RecommendationController get instance => Get.find();

  Rx<RecommendationModel> recommendation = RecommendationModel.empty().obs;

  final _authRepo = Get.put(AuthenticationRepository());
  final _recommendationRepo = Get.put(RecommendationRepository());

  Future<void> createRecommendation(RecommendationModel recommendation) async{
    await _recommendationRepo.insertRecommendation(recommendation);
  }

  Future<List<RecommendationModel>> getAllRecommendationFromUserTarget(String idPengguna) async{
    return await _recommendationRepo.getAllRecomendationForUserTarget(idPengguna);
  }

  Future<void> updateNilaiRecommend(double nilaiRecommend, String id)async{
    Map<String, dynamic> json = {'RecommendationScore' : FieldValue.increment(nilaiRecommend)};
    await _recommendationRepo.updateNilaiRecommend(json, id);
  }

  Future<List<RecommendationModel>> getAllRecommendationByIdUserAndIdNews(String idPengguna, String idNews) async{
    return await _recommendationRepo.getAllRecomendationByUserIdAndNewsId(idPengguna, idNews);
  }

  Future<void> deleteRecommendation(String id) async{
    await _recommendationRepo.deleteSingleRecommendation(id);
  }

  Future<void> updateViewsRecommendation(String id)async{
    Map<String, dynamic> json = {'Views' : FieldValue.increment(1)};
    await _recommendationRepo.updateViewsRecommendation(json, id);
  }

}