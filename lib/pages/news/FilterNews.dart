import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/Utils/CategoryUtils.dart';
import 'package:skripsilocal/controller/comment_controller.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/models/comment_model.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/components/newsDetailHeader.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
import 'package:flutter/services.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';

import '../../controller/profile_controller.dart';
import 'NewsDetail.dart';

class FilterNewsPage extends StatefulWidget {
  final String inputFilter;
  const FilterNewsPage({
    Key? key,
    required this.inputFilter,
  }) : super(key: key);

  @override
  State<FilterNewsPage> createState() => _FilterNewsPageState();
}

class _FilterNewsPageState extends State<FilterNewsPage> {

  List<String> userCategory = [];
  final listCategoryController = Get.put(CategoryListParser());
  late String inputFilter;

  @override
  void initState() {
    super.initState();
    inputFilter = widget.inputFilter;
    fetchData();
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
                  text: 'Hasil pencarian ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                  children: <TextSpan>[
                    if (inputFilter == "DESC")
                      TextSpan(
                        text: "\"Terbaru\"",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    if (inputFilter == "ASC")
                      TextSpan(
                        text: "\"Terlama\"",
                        style: TextStyle(fontStyle: FontStyle.italic),
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
                    future: controller.getAllNewsFavoritFilterTime(userCategory, inputFilter),
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