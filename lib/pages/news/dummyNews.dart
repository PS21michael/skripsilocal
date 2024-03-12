import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/controller/comment_controller.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/models/comment_model.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
import '../comment/dummyComment.dart';

class DummyNewsScreen extends StatefulWidget {
  const DummyNewsScreen({Key? key}) : super(key: key);

  @override
  State<DummyNewsScreen> createState() => _DummyNewsScreenState();
}

class _DummyNewsScreenState extends State<DummyNewsScreen> {
  final fullnameController = TextEditingController();
  final provinsiController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String idBer = "";

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsController());
    final controller1 = Get.put(CommentController());
    List<CommentModel>? test = controller1.getAllDataList();
    print('Total data : ${test?.length}');

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: FutureBuilder<List<NewsModel>>(
            future: controller.getAllNewsAntaraHumaniora(),
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
                                          borderRadius: BorderRadius.circular(10), // Atur sesuai keinginan Anda
                                          border: Border.all(
                                            width: 1.0,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8), // Atur sesuai keinginan Anda
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
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.bookmark_border_rounded, // You can replace this with your love icon
                                                    // color: Colors.white, // Customize the color as needed
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  controller.getUserData(snapshot.data![index].title!);
                                  FirebaseAuth.instance.currentUser?.reload();
                                  Get.to(() => DummyCommentScreen());
                                },
                              ),

                            ),
                            const SizedBox(height: 20),
                            // theButton(
                            //   text: 'Comment',
                            //   onTap: () async {
                            //     controller.getUserData(snapshot.data![index].title!);
                            //     Get.to(() => DummyNewsScreen());
                            //     FirebaseAuth.instance.currentUser?.reload();
                            //     Get.to(() => DummyCommentScreen());
                            //   },
                            // ),
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
    );
  }
}