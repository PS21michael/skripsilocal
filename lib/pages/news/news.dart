import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skripsilocal/Utils/CategoryUtils.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/controller/rating_controller.dart';
import 'package:skripsilocal/controller/recommendation_controller.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/models/rating_model.dart';
import 'package:skripsilocal/models/recommendation_model.dart';
import 'package:skripsilocal/pages/components/basicHeader.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/news/FilterNews.dart';
import 'package:skripsilocal/pages/news/FilterRecommendation.dart';
import 'package:flutter/services.dart';
import 'package:skripsilocal/pages/news/afterSearchNews.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:skripsilocal/repository/rating_repository/rating_repository.dart';
import 'package:skripsilocal/repository/recommendation_repository/recommendation_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import '../../controller/history_controller.dart';
import '../../controller/profile_controller.dart';
import '../../models/history_model.dart';
import 'NewsDetail.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<String> userCategory = [];
  final listCategoryController = Get.put(CategoryListParser());
  final ratingController = Get.put(RatingController());
  final recommendationController = Get.put(RecommendationController());
  String ? selectedFilter;
  List<String> filters = ['Recommendation', 'Latest', 'Oldest'];
  final detailSearch = TextEditingController();
  late Future<List<NewsModel>> _futureNewsList;
  final controller = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> _refreshNewsList() async {
    setState(() {
      _futureNewsList = controller.getAllNewsFavorit(userCategory).then((newsList) {
        newsList.shuffle();
        return newsList;
      });
    });
  }

  Future<void> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    await Future.delayed(const Duration(seconds: 2));
    List<int> daftarScore = UserRepository.instance.getListScore();
    userCategory = listCategoryController.parseScoreToList(daftarScore);
    // print(userCategory);
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final controller = Get.put(NewsController());
    final detailSearch = TextEditingController();
    final historyController = Get.put(HistoryController());
    final userController = Get.put(ProfileController());
    String idUser = userController.getidUser();
    String idPengguna = UserRepository.instance.getUserModelId();
    HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);
    List<int> daftarScore = UserRepository.instance.getListScore();
    userCategory = listCategoryController.parseScoreToList(daftarScore);

    return SafeArea(
      child: Scaffold(
        appBar: const BasicHeader(),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    controller: detailSearch,
                    decoration: InputDecoration(
                      hintText: 'Search your news...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSubmitted: (value) async {
                      await Future.delayed(const Duration(milliseconds: 500));
                      await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
                      String inputSearh = detailSearch.text;
                      Get.to(() => NewsSearchPage(inputSearch: inputSearh));
                    },
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refreshNewsList,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: FutureBuilder<List<NewsModel>>(
                          future: Future.delayed(const Duration(seconds: 2), () async {
                            List<NewsModel> newsList = await controller.getAllNewsFavorit(userCategory);
                            newsList.shuffle();
                            return newsList;
                          }),
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
                                                          maxLines: 2,
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
                                                            const Icon(
                                                              Icons.remove_red_eye,
                                                              size: 20,
                                                            ),
                                                            const SizedBox(width: 4),
                                                            Text(
                                                              snapshot.data![index].views.toString(),
                                                              style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                            ),
                                                            const SizedBox(width: 8),
                                                            const Icon(
                                                              Icons.star,
                                                              size: 20,
                                                            ),
                                                            const SizedBox(width: 4),
                                                            Text(
                                                              (snapshot.data![index].nilaiRating / snapshot.data![index].jumlahPerating).isNaN ? '0' : (snapshot.data![index].nilaiRating / snapshot.data![index].jumlahPerating).toStringAsFixed(2),
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
                                                if(AuthenticationRepository.instance.firebaseUser!=null){
                                                  await Future.delayed(const Duration(milliseconds: 100));
                                                  userController.updateUserScoreCategory(snapshot.data![index].category);
                                                }
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
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: (MediaQuery.of(context).size.width - 180) / 2,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      const Icon(
                        Icons.sort,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          selectedFilter != null ? selectedFilter! : 'Sort',
                          style: TextStyle(
                            color: selectedFilter != null ? Colors.black : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                value: selectedFilter,
                items: filters.map((String filter) {
                  return DropdownMenuItem<String>(
                    value: filter,
                    child: Text(filter),
                  );
                }).toList(),
                onChanged: (String? newValue) async {
                  await Future.delayed(const Duration(milliseconds: 500));
                  await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
                  setState(() {
                    selectedFilter = newValue;
                    // print(selectedFilter);
                  });
                  if (selectedFilter == filters[0]) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    recommendationController.getAllRecommendationFromUserTarget(idPengguna);
                    ratingController.getAllRatingOnlyUserTarget(idPengguna);
                    ratingController.getAllRatingExceptUserTarget(idPengguna);
                    await Future.delayed(const Duration(seconds: 1));

                    // TEST REKOMEN
                    await Future.delayed(const Duration(milliseconds: 50));
                    String idUser = userController.getidUser();
                    // print("Nilai id User : ${idUser}");
                    await Future.delayed(const Duration(milliseconds: 100));

                    //0 Inquiry ke DB Reccomend
                    List<RecommendationModel> listUserTargetRecommend = [];
                    List<RatingModel> listUserTargetRating = [];
                    await Future.delayed(const Duration(seconds: 2));
                    recommendationController.getAllRecommendationFromUserTarget(idUser);
                    await Future.delayed(const Duration(milliseconds: 100));
                    listUserTargetRecommend = RecommendationRepository.instance.listRecomendModelUser;
                    await Future.delayed(const Duration(seconds: 2));
                    ratingController.getAllRatingOnlyUserTarget(idUser);
                    await Future.delayed(const Duration(milliseconds: 100));
                    listUserTargetRating = RatingRepository.instance.listRatingModelUser;

                    //1.  Inquiry ke DB Rating berdasarkan idUser trget
                    List<String> listNewsRatingUserTarget = []; // List IdNews yang dirating pengguna target
                    List<int> listscoreRatingUserTarget = []; // List Score Rating pengguna target
                    ratingController.getAllRatingOnlyUserTarget(idUser);
                    await Future.delayed(const Duration(milliseconds: 100));
                    listNewsRatingUserTarget = [];
                    await Future.delayed(const Duration(milliseconds: 100));
                    listNewsRatingUserTarget = RatingRepository.instance.getListIdNewsUserTarget();
                    await Future.delayed(const Duration(milliseconds: 100));
                    listscoreRatingUserTarget = [];
                    await Future.delayed(const Duration(milliseconds: 200));
                    listscoreRatingUserTarget = RatingRepository.instance.getListScoreUserTarget();
                    // print("List Id idnews User : ${listNewsRatingUserTarget}");
                    // print("List Score rating User : ${listscoreRatingUserTarget}");

                    var tempListDuplicateRecommend = [];
                    await Future.delayed(const Duration(seconds: 1));
                    for(int i=0; i<listUserTargetRecommend.length; i++){
                      if(listNewsRatingUserTarget.contains(listUserTargetRecommend[i].idNews)){
                        recommendationController.deleteRecommendation(listUserTargetRecommend[i].id.toString());
                      }
                      if(tempListDuplicateRecommend.contains(listUserTargetRecommend[i].idNews)){
                        recommendationController.deleteRecommendation(listUserTargetRecommend[i].id.toString());
                      } else {
                        tempListDuplicateRecommend.add(listUserTargetRecommend[i].idNews);
                      }
                    }
                    await Future.delayed(const Duration(milliseconds: 300));

                    // 2. Inquiry ke DB Rating, semua data user kecuali user target
                    List<RatingModel> listRatingUser = []; // List Rating semua pengguna kecuali pengguna target
                    ratingController.getAllRatingExceptUserTarget(idUser);
                    await Future.delayed(const Duration(milliseconds: 300));
                    listRatingUser = RatingRepository.instance.listAllRatingModel;
                    // print("All data rating User : ${listRatingUser[0].title}");
                    // print("Ukuran data list rating model : ${listRatingUser.length}");
                    // print("Ukuran data list id news target : ${listNewsRatingUserTarget.length}");

                    // 3. Cari data yang sama dan hiraukan duplikat.
                    List<String> listIdUserFromAllSameNews = [];
                    List<RatingModel> listRatingUserFromAllSameNews =[];
                    await Future.delayed(const Duration(seconds: 1));
                    for(int i=0; i<listNewsRatingUserTarget.length; i++){
                      for(int j=0; j<listRatingUser.length; j++){
                        if(listNewsRatingUserTarget[i] == listRatingUser[j].idNews){
                          listIdUserFromAllSameNews.add(listRatingUser[j].idPengguna);
                          listRatingUserFromAllSameNews.add(listRatingUser[j]);
                        }
                      }
                    }
                    // print("Ukuran data list rating model after : ${listRatingUserFromAllSameNews.length}");
                    // print("Ukuran data list id news target after : ${listIdUserFromAllSameNews.length}");
                    // print("list Id semua : ${listIdUserFromAllSameNews}");

                    // 4. Hitung duplikat
                    var mapCtrDuplicate = {};
                    for (var element in listIdUserFromAllSameNews) {
                      if(!mapCtrDuplicate.containsKey(element)){
                        mapCtrDuplicate[element] = 1;
                      } else{
                        mapCtrDuplicate[element] +=1;
                      }
                    }

                    // 5. Cek dari list user tadi, mana yg duplikatnya sama dengan total news yang udah dirating pengguna target
                    List<String> listIdUserFinal = [];
                    await Future.delayed(const Duration(seconds: 1));
                    var listValue = mapCtrDuplicate.values.toList(); //berapa kali sama
                    var listKeys = mapCtrDuplicate.keys.toList(); // apa yang sama
                    for(int i=0; i<listValue.length; i++){
                      if(listValue[i] >= 1){
                        listIdUserFinal.add(listKeys[i]);
                      }
                    }
                    // print("Nilai id user final : ${listIdUserFinal}");

                    // 6. Cari nilai rating dari kumpulan user final
                    List<int> scoreRatingUser = [];
                    List<List<int>> listScoreRatingUser = [];
                    await Future.delayed(const Duration(milliseconds: 500));
                    for(int i=0; i<listIdUserFinal.length; i++){
                      scoreRatingUser = [];
                      for(int j=0; j<listNewsRatingUserTarget.length; j++){
                        for(int k=0; k<listRatingUserFromAllSameNews.length; k++){
                          if(listIdUserFinal[i] == listRatingUserFromAllSameNews[k].idPengguna && listNewsRatingUserTarget[j] == listRatingUserFromAllSameNews[k].idNews){
                            scoreRatingUser.add(listRatingUserFromAllSameNews[k].nilaiRating);
                            // print("Nilai score saat iterasi ke : ${scoreRatingUser}");
                          }
                        }
                      }
                      // print("Nilai score per user : ${scoreRatingUser}");
                      listScoreRatingUser.add(scoreRatingUser);
                      // print("Nilai score semua user : ${listScoreRatingUser}");
                    }

                    List<RatingModel> ratingUserFromDifferentNews =[]; // List Rating user lain dengan id berita yang beda dengan rating user target
                    List<List<RatingModel>> listRatingUserFromDifferentNews = [];

                    for(int i=0; i<listIdUserFinal.length; i++){
                      ratingUserFromDifferentNews =[];
                      for(int j=0; j<listRatingUser.length; j++){
                        if(listIdUserFinal[i] == listRatingUser[j].idPengguna){
                          if(listNewsRatingUserTarget.contains(listRatingUser[j].idNews)){
                            continue;
                          } else {
                            ratingUserFromDifferentNews.add(listRatingUser[j]);
                          }
                        }

                      }
                      listRatingUserFromDifferentNews.add(ratingUserFromDifferentNews);
                    }
                    // print("Nilai news yg beda : ${ratingUserFromDifferentNews.length}");
                    // print("Nilai list news yg beda : ${listRatingUserFromDifferentNews.length}");

                    // 7. Cari nilai kemiripan (Nilai euclidean distance)
                    // List Score Rating user target : listscoreRatingUserTarget
                    // List score dari list user yang rating news yang sama dengan user target : listScoreRatingUser
                    var nilaiEuclideanUser = [];
                    int tempTotal =0;
                    List<int> tempRatingUser = [];
                    // print("Nilai score user target : ${listscoreRatingUserTarget}");
                    for(int i=0; i<listScoreRatingUser.length; i++){
                      tempRatingUser = listScoreRatingUser[i];
                      tempTotal =0;
                      for(int j=0; j<tempRatingUser.length; j++){
                        int tempPangkat = (pow((tempRatingUser[j]-listscoreRatingUserTarget[j]), 2) as int?)!;
                        tempTotal+=tempPangkat;
                      }
                      nilaiEuclideanUser.add(sqrt(tempTotal));
                    }
                    // print("Nilai euclidena yg ada : ${nilaiEuclideanUser.toString()}");

                    // 8. Hitung nilai colaborative filtering
                    var nilaiColaborativeFiltering = [];
                    for(int i=0; i<nilaiEuclideanUser.length; i++){
                      nilaiColaborativeFiltering.add(1/(1+nilaiEuclideanUser[i]));
                    }
                    // print("Nilai Colaborative filtering yg ada : ${nilaiColaborativeFiltering.toString()}");

                    // 9. Simpan data ke db recommend
                    List<String> tempIdNews = [];
                    double tempNilaiRecommend=0;
                    tempIdNews = [];

                    // print("Isi list user : ${listIdUserFinal}");
                    // for(int i=0; i<ratingUserFromDifferentNews.length; i++){
                    //   print("Isi list rating model : ${ratingUserFromDifferentNews[i].idNews}");
                    // }
                    // print("Ukuran 1 list id user finall : ${listIdUserFinal.length}");
                    // print("Ukuran 2 list id rating model : ${listRatingUserFromDifferentNews.length}");
                    // CARA 1
                    await Future.delayed(const Duration(seconds: 5));
                    for(int j=0; j<listRatingUserFromDifferentNews.length; j++){
                      List<RatingModel> tempRatingUser = listRatingUserFromDifferentNews[j];
                      // print("Ukuran 3 list id rating model : ${tempRatingUser.length}");
                      for(int i=0; i<tempRatingUser.length; i++){
                        if(listIdUserFinal[j] == tempRatingUser[i].idPengguna){
                          if(tempIdNews.contains(tempRatingUser[i].idNews)){
                            tempNilaiRecommend = nilaiColaborativeFiltering[j] * tempRatingUser[i].nilaiRating;
                            await Future.delayed(const Duration(milliseconds: 300));
                            recommendationController.getAllRecommendationByIdUserAndIdNews(idUser, tempRatingUser[i].idNews);
                            await Future.delayed(const Duration(milliseconds: 100));
                            String idRecommend = RecommendationRepository.instance.tempId;
                            // print("Nilai id Rekomendasi yang di dapat : ${idRecommend}");
                            recommendationController.updateNilaiRecommend(tempNilaiRecommend, idRecommend);
                          } else {
                            await Future.delayed(const Duration(milliseconds: 100));
                            tempNilaiRecommend = nilaiColaborativeFiltering[j] * tempRatingUser[i].nilaiRating;
                            final recommend = RecommendationModel(
                                idNews: tempRatingUser[i].idNews,
                                idPengguna: idUser,
                                publisher: tempRatingUser[i].publisher,
                                author: tempRatingUser[i].author,
                                title: tempRatingUser[i].title,
                                description: tempRatingUser[i].description,
                                urlImage: tempRatingUser[i].urlImage,
                                urlNews: tempRatingUser[i].urlNews,
                                category: tempRatingUser[i].category,
                                recommendationScore: tempNilaiRecommend
                            );
                            recommendationController.createRecommendation(recommend);
                            tempIdNews.add(tempRatingUser[i].idNews);
                          }
                        }
                      }
                    }
                    await Future.delayed(const Duration(milliseconds: 300));
                    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
                    // String temp = RecommendationRepository.instance.isDataAvail();
                    // print("isDataAvail $temp");
                    await Future.delayed(const Duration(milliseconds: 300));
                    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
                    // temp = RecommendationRepository.instance.isDataAvail();
                    Get.to(() => const FilterRecommendationPage());
                  } else if (selectedFilter == filters[1]) {
                    Get.to(() => const FilterNewsPage(inputFilter: "DESC"));
                  } else if (selectedFilter == filters[2]) {
                    Get.to(() => const FilterNewsPage(inputFilter: "ASC"));
                  }
                  setState(() {
                    selectedFilter = null;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 60,
                  width: 180,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: Colors.white,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 18,
                  iconEnabledColor: Colors.transparent,
                ),
                dropdownStyleData: DropdownStyleData(
                  offset: const Offset(0, 160),
                  isOverButton: true,
                  maxHeight: 200,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            ),
          ],
        ),
        bottomNavigationBar: const MyNavBar(initialIndex: 1),
      ),
    );
  }
}