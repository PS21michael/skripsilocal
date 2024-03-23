import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/Utils/Helper/CategoryUtils.dart';
import 'package:skripsilocal/controller/comment_controller.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/models/comment_model.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
// import '../comment/dummyComment.dart';
import 'package:flutter/services.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';

import '../comment/NewsDetail.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // String idBer = "";
  List<String> userCategory = [];
  final listCategoryController = Get.put(CategoryListParser());

  @override
  void initState() {
    super.initState();
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
    final controller1 = Get.put(CommentController());
    List<CommentModel>? test = controller1.getAllDataList();
    print('Total data : ${test?.length}');

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: FutureBuilder<List<NewsModel>>(
              future: controller.getAllNewsFavorit(userCategory),
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
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                      color: Colors.black,
                                    )
                                ),
                                color: index.isOdd ? Colors.grey.shade200 : Colors.grey.shade400,
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
                                              style: TextStyle(
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
                                                    style: TextStyle(
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
                                  onTap: () {
                                    controller.getNewsData(snapshot.data![index].title!);
                                    FirebaseAuth.instance.currentUser?.reload();
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
        bottomNavigationBar: const MyNavBar(index: 1),
      ),
    );
  }
}