import 'dart:math';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skripsilocal/Utils/CategoryUtils.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/controller/recommendation_controller.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/models/rating_model.dart';
import 'package:skripsilocal/models/recommendation_model.dart';
import 'package:skripsilocal/pages/components/basicHeader.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/news/FilterExplore.dart';
import 'package:skripsilocal/pages/news/FilterNews.dart';
import 'package:skripsilocal/pages/news/afterSearchExplore.dart';
import 'package:flutter/services.dart';
import 'package:skripsilocal/pages/news/afterSearchNews.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/rating_repository/rating_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import '../../controller/history_controller.dart';
import '../../controller/profile_controller.dart';
import '../../controller/rating_controller.dart';
import '../../models/history_model.dart';
import '../../repository/recommendation_repository/recommendation_repository.dart';
import 'NewsDetail.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({Key? key}) : super(key: key);

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {

  final listCategoryController = Get.put(CategoryListParser());
  String ? selectedFilter;
  List<String> filters = ['Proses Terbaru', 'Terlama'];
  final detailSearch = TextEditingController();
  final userController = Get.put(ProfileController());
  final ratingController = Get.put(RatingController());
  final recommendationController = Get.put(RecommendationController());

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    //
    // List<List<String>> listIdUser = []; // List dari list idUser yang rating news yg sama dengan pengguna target
    // List<String> idNewsUser =[]; // List dari idUser yang pernah rating news yang sama dengan pengguna target- berurut
    // List<String> allIdUser =[]; // List dari semua idUser yang pernaha rating news yang sama dengan pengguna target - nggak berurut
    //
    //
    // // Id User Target
    // String idUser = userController.getidUser();
    //
    // await Future.delayed(Duration(milliseconds: 100));
    // //1.  Inquiry ke DB Rating berdasarkan idUser trget
    // List<String> listNewsRatingUserTarget = []; // List IdNews yang dirating pengguna target
    // List<int> listscoreRatingUserTarget = []; // List Score Rating pengguna target
    // ratingController.getAllRatingOnlyUserTarget(idUser);
    // await Future.delayed(Duration(milliseconds: 100));
    // listNewsRatingUserTarget = RatingRepository.instance.listIdNews;
    // await Future.delayed(Duration(milliseconds: 100));
    // listscoreRatingUserTarget = RatingRepository.instance.litScoreRatingUserTarget;
    //
    // await Future.delayed(Duration(milliseconds: 300));
    // // 2. Inquiry ke DB Rating, semua data user kecuali user target
    // List<RatingModel> listRatingUser = []; // List Rating semua pengguna kecuali pengguna target
    // ratingController.getAllRatingExceptUserTarget(idUser);
    // await Future.delayed(Duration(milliseconds: 300));
    // listRatingUser = RatingRepository.instance.listAllRatingModel;
    //
    // // 3. Cari data yang sama dan hiraukan duplikat.
    // List<String> listIdUserFromAllSameNews = [];
    // List<RatingModel> listRatingUserFromAllSameNews =[];
    // int tempCount = 0; // Flag untuk menghitung berapa banyak data idNews yang sama antara pengguna target dengan pengguna lain
    // for(int i=0; i<listNewsRatingUserTarget.length; i++){
    //   for(int j=0; j<listRatingUser.length; j++){
    //     if(listNewsRatingUserTarget[i] == listRatingUser[j]){
    //       listIdUserFromAllSameNews.add(listRatingUser[j].idPengguna);
    //       listRatingUserFromAllSameNews.add(listRatingUser[j]);
    //     }
    //   }
    // }
    //
    // // 4. Hitung duplikat
    // var mapCtrDuplicate = Map();
    // listIdUserFromAllSameNews.forEach((element) {
    //   if(!mapCtrDuplicate.containsKey(element)){
    //     mapCtrDuplicate[element] = 1;
    //   } else{
    //     mapCtrDuplicate[element] +=1;
    //   }
    // });
    //
    // // 5. Cek dari list user tadi, mana yg duplikatnya sama dengan total news yang udah dirating pengguna target
    // List<String> listIdUserFinal = [];
    // var listValue = mapCtrDuplicate.values.toList();
    // var listKeys = mapCtrDuplicate.keys.toList();
    // for(int i=0; i<listValue.length; i++){
    //   if(listValue[i] == listNewsRatingUserTarget.length){
    //     listIdUserFinal.add(listKeys[i]);
    //   }
    // }
    //
    // // 6. Cari nilai rating dari kumpulan user final
    // List<int> scoreRatingUser = [];
    // List<List<int>> listScoreRatingUser = [];
    //
    // for(int i=0; i<listIdUserFinal.length; i++){
    //   for(int j=0; j<listNewsRatingUserTarget.length; i++){
    //     scoreRatingUser = [];
    //     for(int k=0; k<listRatingUserFromAllSameNews.length; k++){
    //       if(listIdUserFinal[i] == listRatingUserFromAllSameNews[k].idPengguna &&
    //           listNewsRatingUserTarget[j] == listRatingUserFromAllSameNews[k].idNews){
    //         scoreRatingUser.add(listRatingUserFromAllSameNews[k].nilaiRating);
    //       }
    //     }
    //   }
    //   listScoreRatingUser.add(scoreRatingUser);
    // }
    //
    // // 7. Cari nilai kemiripan (Nilai euclidean distance)
    // // List Score Rating user target : listscoreRatingUserTarget
    // // List score dari list user yang rating news yang sama dengan user target : listScoreRatingUser
    // var nilaiEuclideanUser = [];
    // int tempTotal =0;
    // List<int> tempRatingUser = [];
    // for(int i=0; i<listScoreRatingUser.length; i++){
    //   tempRatingUser = listScoreRatingUser[i];
    //   tempTotal =0;
    //   for(int j=0; j<tempRatingUser.length; j++){
    //     int tempPangkat = (pow((tempRatingUser[j]-listscoreRatingUserTarget[j]), 2) as int?)!;
    //     tempTotal+=tempPangkat;
    //   }
    //   nilaiEuclideanUser.add(sqrt(tempTotal));
    // }
    //
    // print("Nilai euclidena yg ada : ${nilaiEuclideanUser.toString()}");
    //
    // // 8 -- Kalkulasi nilai euclidean ke semua list news yang pernah di rating user (kecuali news yg sama yang pernah di rating target user)
    // // for(int i=0; i<listIdUser.length; i++){
    // //
    // // }
    //
    //
    //
    //
    //
    // for(int i=0; i<listRatingUser.length; i++){
    //   idNewsUser =[];
    //   for(int j=0; j<listNewsRatingUserTarget.length; j++){
    //     if(listRatingUser[i].idNews == listNewsRatingUserTarget[j]){
    //       idNewsUser.add(listRatingUser[i].idPengguna);
    //       allIdUser.add(listRatingUser[i].idPengguna);
    //     }
    //   }
    //   listIdUser.add(idNewsUser);
    // }

    // UserRepository.instance.resetListScore();
    // await Future.delayed(Duration(seconds: 1));
    // await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    // await Future.delayed(Duration(seconds: 2));
    List<int> daftarScore = UserRepository.instance.getListScore();
    // print(daftarScore);
    // await Future.delayed(Duration(milliseconds: 500));
    // userCategory = listCategoryController.parseScoreToList(daftarScore);
    // print(userCategory);
    // print("Kategori yg dikirim :1 "+ userCategory.toString());
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final controller = Get.put(NewsController());
    final recommendController = Get.put(RecommendationController());
    final detailSearch = TextEditingController();
    // final controller1 = Get.put(CommentController());
    // final userController = Get.put(ProfileController());
    final historyController = Get.put(HistoryController());
    String idUser = userController.getidUser();
    // List<CommentModel>? test = controller1.getAllDataList();
    // print('Total data : ${test?.length}');

    return SafeArea(
      child: Scaffold(
        appBar: BasicHeader(),
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
                      hintText: 'Cari berita anda...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSubmitted: (value) async {
                      // UserRepository.instance.resetListScore();
                      await Future.delayed(Duration(milliseconds: 500));
                      await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
                      String inputSearh = detailSearch.text;
                      Get.to(() => NewsSearchPage(inputSearch: inputSearh));
                    },
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: FutureBuilder<List<RecommendationModel>>(
                        future: recommendController.getAllRecommendationFromUserTarget(idUser),
                        // future: controller.getAllNewsFavoritFilterTime(userCategory, "ASC"),
                        // future: controller.getAllNewsFavoritSearching(userCategory, "Yg mau di search"),
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
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          onTap: () async{
                                            // controller.getNewsData(snapshot.data![index].title);
                                            await Future.delayed(const Duration(milliseconds: 100));
                                            controller.updateViews(snapshot.data![index].id.toString());

                                            await Future.delayed(const Duration(milliseconds: 100));
                                            recommendationController.updateViewsRecommendation(snapshot.data![index].id.toString());

                                            if(AuthenticationRepository.instance.firebaseUser!=null){
                                              await Future.delayed(const Duration(milliseconds: 100));
                                              userController.updateUserScoreCategory(snapshot.data![index].category);
                                            }


                                            DateTime now = DateTime.now();
                                            String time = "";
                                            time = now.toString();
                                            // ISI DATA HISTORY
                                            // final history = HistoryModel(
                                            //     idNews: snapshot.data![index].id.toString(),
                                            //     idPengguna: idUser,
                                            //     title: snapshot.data![index].title,
                                            //     urlData: snapshot.data![index].urlNews,
                                            //     urlGambar: snapshot.data![index].urlImage,
                                            //     kategori: snapshot.data![index].category,
                                            //     publisher: snapshot.data![index].publisher,
                                            //     description: snapshot.data![index].description,
                                            //     waktu: time);
                                            //
                                            // await historyController.createHistory(history);

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
            Positioned(
              bottom: 10,
              left: (MediaQuery.of(context).size.width - 130) / 2,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                isExpanded: true,
                hint: Row(
                  children: [
                    Icon(
                      Icons.sort,
                      size: 20,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        selectedFilter != null ? selectedFilter! : 'Urutkan',
                        style: TextStyle(
                          color: selectedFilter != null ? Colors.black : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
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
                  // UserRepository.instance.resetListScore();
                  await Future.delayed(Duration(milliseconds: 500));
                  await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
                  setState(() {
                    selectedFilter = newValue;
                    print(selectedFilter);
                  });
                  if (selectedFilter == filters[0]) {

                    // TEST RECCOMEND
                    await Future.delayed(const Duration(seconds: 1));

                    // Id User Target
                    await Future.delayed(Duration(milliseconds: 50));
                    String idUser = userController.getidUser();
                    print("Nilai id User : ${idUser}");
                    await Future.delayed(Duration(milliseconds: 100));

                    //0 Inquiry ke DB Reccomend
                    List<RecommendationModel> listUserTargetRecommend = [];
                    List<RatingModel> listUserTargetRating = [];

                    await Future.delayed(Duration(seconds: 2));
                    recommendationController.getAllRecommendationFromUserTarget(idUser);
                    await Future.delayed(Duration(milliseconds: 100));
                    listUserTargetRecommend = RecommendationRepository.instance.listRecomendModelUser;

                    await Future.delayed(Duration(seconds: 2));
                    ratingController.getAllRatingOnlyUserTarget(idUser);
                    await Future.delayed(Duration(milliseconds: 100));
                    listUserTargetRating = RatingRepository.instance.listRatingModelUser;


                    //1.  Inquiry ke DB Rating berdasarkan idUser trget
                    List<String> listNewsRatingUserTarget = []; // List IdNews yang dirating pengguna target
                    List<int> listscoreRatingUserTarget = []; // List Score Rating pengguna target
                    ratingController.getAllRatingOnlyUserTarget(idUser);
                    await Future.delayed(Duration(milliseconds: 100));
                    listNewsRatingUserTarget = [];
                    await Future.delayed(Duration(milliseconds: 100));
                    listNewsRatingUserTarget = RatingRepository.instance.getListIdNewsUserTarget();
                    await Future.delayed(Duration(milliseconds: 100));
                    listscoreRatingUserTarget = [];
                    await Future.delayed(Duration(milliseconds: 200));
                    listscoreRatingUserTarget = RatingRepository.instance.getListScoreUserTarget();

                    var tempListDuplicateRecommend = [];
                    await Future.delayed(Duration(seconds: 1));
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


                    await Future.delayed(Duration(milliseconds: 300));
                    // 2. Inquiry ke DB Rating, semua data user kecuali user target
                    List<RatingModel> listRatingUser = []; // List Rating semua pengguna kecuali pengguna target
                    ratingController.getAllRatingExceptUserTarget(idUser);
                    await Future.delayed(Duration(milliseconds: 300));
                    listRatingUser = RatingRepository.instance.listAllRatingModel;

                    // 3. Cari data yang sama dan hiraukan duplikat.
                    List<String> listIdUserFromAllSameNews = [];
                    List<RatingModel> listRatingUserFromAllSameNews =[];
                    await Future.delayed(Duration(seconds: 1));
                    for(int i=0; i<listNewsRatingUserTarget.length; i++){
                      for(int j=0; j<listRatingUser.length; j++){
                        if(listNewsRatingUserTarget[i] == listRatingUser[j].idNews){
                          listIdUserFromAllSameNews.add(listRatingUser[j].idPengguna);
                          listRatingUserFromAllSameNews.add(listRatingUser[j]);
                        }
                      }
                    }

                    // 4. Hitung duplikat
                    var mapCtrDuplicate = Map();
                    listIdUserFromAllSameNews.forEach((element) {
                      if(!mapCtrDuplicate.containsKey(element)){
                        mapCtrDuplicate[element] = 1;
                      } else{
                        mapCtrDuplicate[element] +=1;
                      }
                    });

                    // 5. Cek dari list user tadi, mana yg duplikatnya sama dengan total news yang udah dirating pengguna target
                    List<String> listIdUserFinal = [];
                    await Future.delayed(Duration(seconds: 1));
                    var listValue = mapCtrDuplicate.values.toList();
                    var listKeys = mapCtrDuplicate.keys.toList();
                    for(int i=0; i<listValue.length; i++){
                      if(listValue[i] >= 3){
                        listIdUserFinal.add(listKeys[i]);
                      }
                    }
                    // 6. Cari nilai rating dari kumpulan user final
                    List<int> scoreRatingUser = [];
                    List<List<int>> listScoreRatingUser = [];
                    await Future.delayed(Duration(milliseconds: 500));
                    for(int i=0; i<listIdUserFinal.length; i++){
                      scoreRatingUser = [];
                      for(int j=0; j<listNewsRatingUserTarget.length; j++){
                        for(int k=0; k<listRatingUserFromAllSameNews.length; k++){
                          if(listIdUserFinal[i] == listRatingUserFromAllSameNews[k].idPengguna &&
                              listNewsRatingUserTarget[j] == listRatingUserFromAllSameNews[k].idNews){
                            scoreRatingUser.add(listRatingUserFromAllSameNews[k].nilaiRating);
                          }
                        }
                      }
                      listScoreRatingUser.add(scoreRatingUser);
                    }


                    // TODO : SEBAGAI PENGINGAT
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

                    // 7. Cari nilai kemiripan (Nilai euclidean distance)
                    // List Score Rating user target : listscoreRatingUserTarget
                    // List score dari list user yang rating news yang sama dengan user target : listScoreRatingUser
                    var nilaiEuclideanUser = [];
                    int tempTotal =0;
                    List<int> tempRatingUser = [];
                    for(int i=0; i<listScoreRatingUser.length; i++){
                      tempRatingUser = listScoreRatingUser[i];
                      tempTotal =0;
                      for(int j=0; j<tempRatingUser.length; j++){
                        int tempPangkat = (pow((tempRatingUser[j]-listscoreRatingUserTarget[j]), 2) as int?)!;
                        tempTotal+=tempPangkat;
                      }
                      nilaiEuclideanUser.add(sqrt(tempTotal));
                    }


                    // 8. Hitung nilai colaborative filtering
                    var nilaiColaborativeFiltering = [];
                    for(int i=0; i<nilaiEuclideanUser.length; i++){
                      nilaiColaborativeFiltering.add(1/(1+nilaiEuclideanUser[i]));
                    }

                    // 9. Simpan data ke db recommend
                    List<String> tempIdNews = [];
                    double tempNilaiRecommend=0;
                    tempIdNews = [];

                    // CARA 1
                    await Future.delayed(Duration(seconds: 5));
                    for(int j=0; j<listRatingUserFromDifferentNews.length; j++){
                      List<RatingModel> tempRatingUser = listRatingUserFromDifferentNews[j];
                      print("Ukuran 3 list id rating model : ${tempRatingUser.length}");
                      for(int i=0; i<tempRatingUser.length; i++){
                        if(listIdUserFinal[j] == tempRatingUser[i].idPengguna){
                          if(tempIdNews.contains(tempRatingUser[i].idNews)){
                            tempNilaiRecommend = nilaiColaborativeFiltering[j] * tempRatingUser[i].nilaiRating;
                            await Future.delayed(const Duration(milliseconds: 300));
                            recommendationController.getAllRecommendationByIdUserAndIdNews(idUser, tempRatingUser[i].idNews);
                            await Future.delayed(const Duration(milliseconds: 100));
                            String idRecommend = RecommendationRepository.instance.tempId;
                            print("Nilai id Rekomendasi yang di dapat : ${idRecommend}");
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
                                // publishedTime: tempRatingUser[i].publishedTime,
                                category: tempRatingUser[i].category,
                                recommendationScore: tempNilaiRecommend
                            );
                            recommendationController.createRecommendation(recommend);
                            tempIdNews.add(tempRatingUser[i].idNews);
                          }
                        }
                      }

                    }

                    print("Id News yg ada di db recommend : ${tempIdNews}");

                    Get.to(() => RecommendationPage());
                    // TEST REKOMEN


                  } else if (selectedFilter == filters[1]) {
                    Get.to(() => FilterNewsPage(inputFilter: "ASC"));
                  }
                  setState(() {
                    selectedFilter = null;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 60,
                  width: 130,
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
                  iconSize: 16,
                  iconEnabledColor: Colors.transparent,
                ),
                dropdownStyleData: DropdownStyleData(
                  offset: const Offset(0, 110),
                  isOverButton: true,
                  maxHeight: 200,
                  width: 130,
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
        bottomNavigationBar: const MyNavBar(index: 1),
      ),
    );
  }
}