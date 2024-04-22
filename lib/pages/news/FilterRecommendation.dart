import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skripsilocal/Utils/CategoryUtils.dart';
import 'package:skripsilocal/controller/history_controller.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/controller/rating_controller.dart';
import 'package:skripsilocal/controller/recommendation_controller.dart';
import 'package:skripsilocal/models/history_model.dart';
import 'package:skripsilocal/models/recommendation_model.dart';
import 'package:skripsilocal/pages/components/recommendDetailHeader.dart';
import 'package:skripsilocal/pages/news/news.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:flutter/services.dart';
import 'package:skripsilocal/repository/recommendation_repository/recommendation_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import '../../controller/profile_controller.dart';
import 'NewsDetail.dart';

class FilterRecommendationPage extends StatefulWidget {
  const FilterRecommendationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterRecommendationPage> createState() => _FilterRecommendationPageState();
}

class _FilterRecommendationPageState extends State<FilterRecommendationPage> {

  final listCategoryController = Get.put(CategoryListParser());
  String ? selectedFilter;
  final detailSearch = TextEditingController();
  final userController = Get.put(ProfileController());
  final ratingController = Get.put(RatingController());
  final recommendationController = Get.put(RecommendationController());
  final historyController = Get.put(HistoryController());
  final controller = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    String idPengguna = UserRepository.instance.getUserModelId();
    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    // String temp = RecommendationRepository.instance.isDataRecommendAvail;
    // RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    // RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    // RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    // fetchData();
  }

  // Future<void> fetchData() async {
  //   // UserRepository.instance.resetListScore();
  //   // await Future.delayed(Duration(seconds: 1));
  //   // await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
  //   // await Future.delayed(Duration(seconds: 2));
  //   List<int> daftarScore = UserRepository.instance.getListScore();
  //   // print(daftarScore);
  //   // await Future.delayed(Duration(milliseconds: 500));
  //   userCategory = listCategoryController.parseScoreToList(daftarScore);
  //   // print(userCategory);
  //   // print("Kategori yg dikirim :1 "+ userCategory.toString());
  // }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // String idPengguna = UserRepository.instance.getUserModelId();
    // String idUser = userController.getidUser();
    String idPengguna = UserRepository.instance.getUserModelId();
    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    String temp = RecommendationRepository.instance.isDataRecommendAvail;
    // print("isDataAvail $temp");
    // String idPengguna = UserRepository.instance.getUserModelId();
    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    // HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);
    temp = RecommendationRepository.instance.isDataRecommendAvail;
    // String idPengguna = UserRepository.instance.getUserModelId();
    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    temp = RecommendationRepository.instance.isDataRecommendAvail;
    // final controller = Get.put(NewsController());
    // final recommendController = Get.put(RecommendationController());
    // final detailSearch = TextEditingController();
    // final controller1 = Get.put(CommentController());
    // final userController = Get.put(ProfileController());
    // String idUser = userController.getidUser();
    // List<CommentModel>? test = controller1.getAllDataList();
    // print('Total data : ${test?.length}');
    Future.delayed(const Duration(seconds: 1));
    BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);


    return WillPopScope(
      onWillPop: () async {
        Get.off(()=> const NewsPage());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: const RecommendHeader(),
          body: temp == "YES" ? buildListWidget(idPengguna) : buildNoData(),
        ),
      ),
    );

  }

  Widget buildListWidget(String idPengguna) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
          child: Text(
            'Our recommendation :',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: FutureBuilder<List<RecommendationModel>>(
                future: recommendationController.getAllRecommendationFromUserTarget(idPengguna),
                builder: (context, snapshot) {
                  // print(userCategory);
                  // print('Checkpoint News1: ${snapshot.connectionState}');
                  // print('Ini list judul yang didapat : ${NewsRepository.instance.getlistTitle()}');
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (var index = 0; index < snapshot.data!.length; index++)
                            Column(
                              children: [
                                Material(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: const BorderSide(
                                        color: Colors.black,
                                      )
                                  ),
                                  color: index.isOdd ? Colors.grey.shade300 : Colors.grey.shade500,child: ListTile(
                                  title: Row(
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 1.0,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.network(
                                              snapshot.data![index].urlImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].title,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    snapshot.data![index].publisher,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () async{
                                    controller.getNewsData(snapshot.data![index].title);
                                    await Future.delayed(const Duration(milliseconds: 100));
                                    controller.updateViews(snapshot.data![index].id.toString());
                                    await Future.delayed(const Duration(milliseconds: 100));
                                    userController.updateUserScoreCategory(snapshot.data![index].category);
                                    DateTime now = DateTime.now();
                                    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
                                    final history = HistoryModel(
                                      idNews: snapshot.data![index].id.toString(),
                                      idPengguna: idPengguna,
                                      title: snapshot.data![index].title,
                                      urlData: snapshot.data![index].urlNews,
                                      urlGambar: snapshot.data![index].urlImage,
                                      kategori: snapshot.data![index].category,
                                      publisher: snapshot.data![index].publisher,
                                      description: snapshot.data![index].description,
                                      author: snapshot.data![index].author,
                                      waktu: formattedDate,
                                    );
                                    await historyController.createHistory(history);
                                    Get.to(() => NewsDetail(
                                      id: snapshot.data![index].id.toString(),
                                      title: snapshot.data![index].title,
                                      publisher: snapshot.data![index].publisher,
                                      urlImage: snapshot.data![index].urlImage,
                                      urlNews: snapshot.data![index].urlNews,
                                      description: snapshot.data![index].description,
                                      penulis: snapshot.data![index].author,
                                      kategori: snapshot.data![index].category,
                                    ));
                                  },
                                ),

                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: Text("Something Went Wrong"),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNoData() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please rating the news, so we can give you recommendation!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

}