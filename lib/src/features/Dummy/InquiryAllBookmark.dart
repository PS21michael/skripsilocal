import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/comment/dummyComment.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/bookmark_controller.dart';
import '../../../models/bookmark_model.dart';
import '../../../pages/components/button.dart';

class DummyBookmarkScreen extends StatefulWidget{

  const DummyBookmarkScreen ({Key? key}) : super (key: key);

  @override
  State<DummyBookmarkScreen> createState() => _DummyBookmarkScreen();
}

class _DummyBookmarkScreen extends State<DummyBookmarkScreen> {

  @override
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final controller = Get.put(BookmarkController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: FutureBuilder<List<BookmarkModel>>(
              future: controller.getAllBookmark(),
              builder: (context, snapshot) {
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
                                              snapshot.data![index].urlGambar,
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
                                                // Row(
                                                //   children: [
                                                //     Icon(
                                                //       Icons.bookmark_border_rounded,
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () async {
                                    String url = snapshot.data![index].urlData;
                                    if (await canLaunch(url)) {
                                    await launch(url, forceWebView: true, enableJavaScript: true);
                                    } else {
                                    throw 'Could not launch $url';
                                    }
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
        bottomNavigationBar: const MyNavBar(index: 2),
      ),
    );
  }
}