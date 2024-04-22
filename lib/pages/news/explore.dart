import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/Utils/CategoryUtils.dart';
import 'package:skripsilocal/controller/history_controller.dart';
import 'package:intl/intl.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/controller/profile_controller.dart';
import 'package:skripsilocal/models/history_model.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/components/basicHeader.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/news/FilterExplore.dart';
import 'package:skripsilocal/pages/news/afterSearchExplore.dart';
import 'package:flutter/services.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';
import 'package:skripsilocal/repository/recommendation_repository/recommendation_repository.dart';
import '../../controller/rating_controller.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import '../../repository/authentication_repository/authentication_repository.dart';
import 'NewsDetail.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String idBer = "";
  String ? selectedFilter;
  List<String> filters = ['Latest', 'Oldest'];
  final controller = Get.put(NewsController());
  final ratingController = Get.put(RatingController());
  late Future<List<NewsModel>> _futureNewsList;
  List<String> userCategoryOver = [];
  final listCategoryController = Get.put(CategoryListParser());

  @override
  void initState() {
    super.initState();
    // _futureNewsList = controller.getAllNews();
  }

  Future<void> _refreshNewsList() async {
    setState(() {
      _futureNewsList = controller.getAllNews().then((newsList) {
        newsList.shuffle();
        return newsList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final detailSearch = TextEditingController();
    final userController = Get.put(ProfileController());
    String idUser = userController.getidUser();
    // final listCategoryController = Get.put(CategoryListParser());
    final historyController = Get.put(HistoryController());
    Future.delayed(const Duration(milliseconds: 500));
    String idPengguna = UserRepository.instance.getUserModelId();
    Future.delayed(const Duration(seconds: 1));
    BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);

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
                      hintText: 'Cari berita anda...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSubmitted: (value) {
                      String inputSearh = detailSearch.text;
                      Get.to(() => ExploreSearchPage(inputSearch: inputSearh));
                    },
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refreshNewsList,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: FutureBuilder<List<NewsModel>>(
                          future: Future.delayed(const Duration(seconds: 2), () async {
                            List<NewsModel> newsList = await controller.getAllNews();
                            newsList.shuffle();
                            return newsList;
                          }),
                          builder: (context, snapshot) {
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
                                              ),
                                            ),
                                            color: index.isOdd ? Colors.grey.shade300 : Colors.grey.shade500,
                                            child: ListTile(
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
                                                                  fontSize: 16,
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
                                              onTap: () async {
                                                controller.getNewsData(snapshot.data![index].title);
                                                await Future.delayed(const Duration(milliseconds: 100));
                                                controller.updateViews(snapshot.data![index].id.toString());
                                                if (AuthenticationRepository.instance.firebaseUser != null) {
                                                  await Future.delayed(const Duration(milliseconds: 100));
                                                  userController.updateUserScoreCategory(snapshot.data![index].category);
                                                }


                                                // TODO : Panggil method ini sebelum ke news Detail
                                                // Ambil data rataing by user id dan news id
                                                if(idUser.isNotEmpty){
                                                  await Future.delayed(const Duration(milliseconds: 100));
                                                  ratingController.getAllRatingByIdUserAndIdNews(idUser, snapshot.data![index].id.toString());
                                                }
                                                //
                                                // // Check Score over limit
                                                // userCategoryOver = [];
                                                // await Future.delayed(const Duration(milliseconds: 100));
                                                // String flagCategoryOver = userController.getFlagOverScore();
                                                // await Future.delayed(const Duration(milliseconds: 100));
                                                // List<int> indexOverScore = [];
                                                // indexOverScore = userController.getListIndexOverScoreCategory();
                                                //
                                                // // if(flagCategoryOver == "TRUE"){
                                                // //   userCategoryOver = listCategoryController.parseScoreOverToList(indexOverScore);
                                                // // }
                                                //
                                                // // Data yg over limit dikirim dalam bentuk list string
                                                //
                                                // // Ekspetasi dari FE :
                                                // // Kirim list kategori yang dipilih dan yang tidak dipilih
                                                //
                                                // String persetujuan = "";
                                                // List<String> listKategoriYgMauDiUpdate = [];
                                                // List<String> listKategoriYgTidakUpdate = userCategoryOver;
                                                //
                                                // // Kalau YES ==> Jadi Favorit, Score = 1000
                                                // // Kalau NO ==> Score kembali jadi 0.
                                                //
                                                // if(listKategoriYgMauDiUpdate.length !=0){
                                                //   await Future.delayed(const Duration(milliseconds: 50));
                                                //   for(int i=0; i<listKategoriYgMauDiUpdate.length; i++){
                                                //     await Future.delayed(const Duration(milliseconds: 100));
                                                //     userController.updateUserScoreOverLimitCategory(listKategoriYgMauDiUpdate[i].toString(), 1000);
                                                //   }
                                                // }
                                                //
                                                // if(listKategoriYgTidakUpdate.length !=0){
                                                //   await Future.delayed(const Duration(milliseconds: 50));
                                                //   for(int i=0; i<listKategoriYgTidakUpdate.length; i++){
                                                //     await Future.delayed(const Duration(milliseconds: 100));
                                                //     userController.updateUserScoreOverLimitCategory(listKategoriYgTidakUpdate[i].toString(), 0);
                                                //   }
                                                // }
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
                      const Icon(
                        Icons.sort,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          selectedFilter != null ? selectedFilter! : 'Urutkan',
                          style: TextStyle(
                            color: selectedFilter != null ? Colors.black : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
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
                    setState(() {
                      selectedFilter = newValue;
                      // print(selectedFilter);
                    });
                    if (selectedFilter == filters[0]) {
                      // Get.to(() => RecommendationPage());
                      Get.to(() => const FilterExplorePage(inputFilter: "DESC"));
                    } else if (selectedFilter == filters[1]) {
                      Get.to(() => const FilterExplorePage(inputFilter: "ASC"));
                    }
                    setState(() {
                      selectedFilter = null;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 60,
                    width: 150,
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
                    width: 150,
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
        bottomNavigationBar: const MyNavBar(initialIndex: 0),
      ),
    );
  }
}
