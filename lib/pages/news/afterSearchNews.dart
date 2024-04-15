import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skripsilocal/Utils/CategoryUtils.dart';
import 'package:skripsilocal/Utils/CategoryUtils.dart';
import 'package:skripsilocal/controller/comment_controller.dart';
import 'package:skripsilocal/controller/history_controller.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/models/comment_model.dart';
import 'package:skripsilocal/models/history_model.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/components/newsDetailHeader.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
import 'package:flutter/services.dart';
import 'package:skripsilocal/repository/recommendation_repository/recommendation_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';

import '../../controller/profile_controller.dart';
import 'NewsDetail.dart';

class NewsSearchPage extends StatefulWidget {
  final String inputSearch;
  const NewsSearchPage({
    Key? key,
    required this.inputSearch,
  }) : super(key: key);

  @override
  State<NewsSearchPage> createState() => _NewsSearchPageState();
}

class _NewsSearchPageState extends State<NewsSearchPage> {

  List<String> userCategory = [];
  late String inputSearch;
  final listCategoryController = Get.put(CategoryListParser());

  @override
  void initState() {
    super.initState();
    fetchData();
    inputSearch = widget.inputSearch;
  }

  Future<void> fetchData() async {
    // UserRepository.instance.resetListScore();
    // await Future.delayed(Duration(seconds: 1));
    // await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    // await Future.delayed(Duration(seconds: 2));
    List<int> daftarScore = UserRepository.instance.getListScore();
    // print(daftarScore);
    // await Future.delayed(Duration(milliseconds: 500));
    userCategory = listCategoryController.parseScoreToList(daftarScore);
    // print(userCategory);
    // print("Kategori yg dikirim :1 "+ userCategory.toString());
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final controller = Get.put(NewsController());
    // final controller1 = Get.put(CommentController());
    final userController = Get.put(ProfileController());
    // final userController = Get.put(ProfileController());
    String idUser = userController.getidUser();
    final historyController = Get.put(HistoryController());
    Future.delayed(const Duration(seconds: 1));
    BookmarkRepository.instance.getAllBookmarksFromSingleUser(idUser);
    Future.delayed(const Duration(seconds: 1));
    RecommendationRepository.instance.getAllRecomendationForUserTarget(idUser);
    Future.delayed(const Duration(seconds: 1));
    HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idUser);

    // List<CommentModel>? test = controller1.getAllDataList();
    // print('Total data : ${test?.length}');

    return SafeArea(
      child: Scaffold(
        appBar: DetailHeader(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: RichText(
                text: TextSpan(
                  text: 'Hasil pencarian dari ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "\"$inputSearch\"",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: FutureBuilder<List<NewsModel>>(
                    future: controller.getAllNewsFavoritSearching(userCategory, inputSearch),
                    builder: (context, snapshot) {
                      print(userCategory);
                      print('Checkpoint News1: ${snapshot.connectionState}');
                      print('Ini list judul yang didapat : ${NewsRepository.instance.getlistTitle()}');
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
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.remove_red_eye,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        "${snapshot.data![index].views.toString()}",
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.normal,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Icon(
                                                        Icons.star,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        "${(snapshot.data![index].nilaiRating / snapshot.data![index].jumlahPerating).isNaN ? '0' : (snapshot.data![index].nilaiRating / snapshot.data![index].jumlahPerating).toStringAsFixed(2)}",
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.normal,
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
                                          if (AuthenticationRepository.instance.firebaseUser != null){
                                            DateTime now = DateTime.now();
                                            String formattedDate = DateFormat('dd-MM-yyyy').format(now);
                                            final history = HistoryModel(
                                              idNews: snapshot.data![index].id.toString(),
                                              idPengguna: idUser,
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
                                          }
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
        ),
      ),
    );
  }
}