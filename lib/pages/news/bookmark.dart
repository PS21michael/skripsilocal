import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skripsilocal/controller/history_controller.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/controller/profile_controller.dart';
import 'package:skripsilocal/models/history_model.dart';
import 'package:skripsilocal/pages/components/basicHeader.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/news/NewsDetail.dart';
import 'package:skripsilocal/pages/news/explore.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import '../../controller/bookmark_controller.dart';
import '../../models/bookmark_model.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final controller = Get.put(BookmarkController());
  final controller1 = Get.put(NewsController());
  final userController = Get.put(ProfileController());
  final historyController = Get.put(HistoryController());
  final bookMarkController = Get.put(BookmarkController());
  // final userController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    String idPengguna = UserRepository.instance.getUserModelId();
    // String idUser = userController.getidUser();
    Future.delayed(const Duration(seconds: 1));
    BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    String temp = BookmarkRepository.instance.isDataAvail();
    Future.delayed(const Duration(seconds: 1));
    // print("isDataAvail $temp");
    // String idPengguna = UserRepository.instance.getUserModelId();
    HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);
    // String temp1 = "";
    // temp1 = HistoryRepository.instance.isDataAvail();

    return SafeArea(
      child: Scaffold(
        appBar: const BasicHeader(),
        body: temp == "YES" ? buildListWidget(idPengguna) : buildNoDataWidget(),
        bottomNavigationBar: const MyNavBar(index: 2),
      ),
    );
  }

  Widget buildListWidget(String idPengguna) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'Bookmark anda : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),

              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: FutureBuilder<List<BookmarkModel>>(
                    future: controller.getAllBookmarkfromSingleUser(idPengguna),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final item = snapshot.data![index];
                              return Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.startToEnd,
                                background: Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: Container(
                                    // padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Delete Bookmark',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onDismissed: (direction) {
                                  String id = snapshot.data![index].id.toString();
                                  controller.deleteBookmark(id);
                                },
                                child: Column(
                                  children: [
                                    Material(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                          side: const BorderSide(
                                            color: Colors.black,
                                          )),
                                      color: index.isOdd
                                          ? Colors.grey.shade300
                                          : Colors.grey.shade500,
                                      child: ListTile(
                                        title: Row(
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              height: 80,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  border: Border.all(
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  child: Image.network(
                                                    item.urlGambar,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.title,
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
                                                          item.publisher,
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight.normal,
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
                                        onTap: () async {
                                          controller1.getNewsData(snapshot.data![index].title);
                                          await Future.delayed(const Duration(milliseconds: 100));
                                          controller1.updateViews(snapshot.data![index].id.toString());
                                          if(AuthenticationRepository.instance.firebaseUser!=null){
                                            await Future.delayed(const Duration(milliseconds: 100));
                                            userController.updateUserScoreCategory(snapshot.data![index].kategori);
                                          }
                                          DateTime now = DateTime.now();
                                          String formattedDate = DateFormat('dd-MM-yyyy').format(now);
                                          final history = HistoryModel(
                                            idNews: snapshot.data![index].id.toString(),
                                            idPengguna: idPengguna,
                                            title: snapshot.data![index].title,
                                            urlData: snapshot.data![index].urlData,
                                            urlGambar: snapshot.data![index].urlGambar,
                                            kategori: snapshot.data![index].kategori,
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
                                            urlImage: snapshot.data![index].urlGambar,
                                            urlNews: snapshot.data![index].urlData,
                                            description: snapshot.data![index].description,
                                            penulis: snapshot.data![index].publisher,
                                            kategori: snapshot.data![index].kategori,
                                          ));
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              );
                            },
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
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Konfirmasi"),
                      content: const Text(
                        "Apakah Anda yakin ingin menghapus semua data ini?",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                ).then((value) async {
                  if (value == true) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    await Future.delayed(const Duration(milliseconds: 500));
                    bookMarkController.getAllBookmarkfromSingleUser(idPengguna);
                    await Future.delayed(const Duration(milliseconds: 1000));
                    List<String> listIdBookmark = BookmarkRepository.instance.getListIdBookmarkFromSingelUser();
                    await Future.delayed(const Duration(milliseconds: 500));
                    // print("list bookmark yg ada di db: ${listIdBookmark.toString()}");
                    for(int i=0; i<listIdBookmark.length; i++){
                      await Future.delayed(const Duration(milliseconds: 50));
                      // print("data bookmark ke ${i+1} dengan id ${listIdBookmark[i]} berhail di hapus");
                      bookMarkController.deleteBookmark(listIdBookmark[i]);
                    }
                  }
                  Get.to(() => const ExplorePage());
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const SizedBox(
                width: 110,
                height: 50,
                child: Center(
                  child: Text(
                    'Delete Semua',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNoDataWidget() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Belum ada yang disimpan nih...",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
