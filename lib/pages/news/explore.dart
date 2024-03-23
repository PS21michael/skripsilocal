import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/controller/comment_controller.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/models/comment_model.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
import 'package:flutter/services.dart';

import 'NewsDetail.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String idBer = "";

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
              future: controller.getAllNews(),
              builder: (context, snapshot) {
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
        bottomNavigationBar: const MyNavBar(index: 0),
      ),
    );
  }
}