import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skripsilocal/controller/comment_controller.dart';
import 'package:skripsilocal/controller/history_controller.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/models/comment_model.dart';
import 'package:skripsilocal/models/history_model.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/components/newsDetailHeader.dart';
import 'package:skripsilocal/pages/news/news.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
import 'package:flutter/services.dart';
import 'package:skripsilocal/repository/recommendation_repository/recommendation_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';

import '../../controller/profile_controller.dart';
import 'NewsDetail.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  final controller = Get.put(HistoryController());
  final historyController = Get.put(HistoryController());
  final controller1 = Get.put(NewsController());
  final userController = Get.put(ProfileController());
  List<String> userCategory = [];
  late String inputSearch;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    String idPengguna = UserRepository.instance.getUserModelId();
    HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);
    String temp = HistoryRepository.instance.isDataAvail();
    // final userController = Get.put(ProfileController());
    // String idUser = userController.getidUser();
    // final historyController = Get.put(HistoryController());
    // print("isDataAvail $temp");
    Future.delayed(const Duration(seconds: 1));
    BookmarkRepository.instance.getAllBookmarksFromSingleUser(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    RecommendationRepository.instance.getAllRecomendationForUserTarget(idPengguna);
    Future.delayed(const Duration(seconds: 1));
    HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);


    return SafeArea(
      child: Scaffold(
        appBar: DetailHeader(),
        body: HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna) == "YES" ? buildHistory(idPengguna) : buildNoData(),
      ),
    );
  }

  Widget buildHistory(String idPengguna) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'Riwayat anda : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: FutureBuilder<List<HistoryModel>>(
                    future: controller.getAllHistoryFromSingleUser(idPengguna),
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
                                Dismissible(
                                  key: UniqueKey(),
                                  direction: DismissDirection.startToEnd,
                                  background: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                    child: Container(
                                      // padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(15.0),
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
                                            'Delete Riwayat',
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
                                    controller.deleteHistory(id);
                                  },
                                  child: Column(
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
                                                    "Diakses pada : ${snapshot.data![index].waktu}",
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          snapshot.data![index].title,
                                                          style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                    ],
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
                                          controller1.getNewsData(snapshot.data![index].title);
                                          await Future.delayed(const Duration(milliseconds: 100));
                                          controller1.updateViews(snapshot.data![index].id.toString());
                                          await Future.delayed(const Duration(milliseconds: 100));
                                          userController.updateUserScoreCategory(snapshot.data![index].kategori);
                                          if (AuthenticationRepository.instance.firebaseUser != null){
                                            DateTime now = DateTime.now();
                                            String formattedDate = DateFormat('dd-MM-yyyy').format(now);
                                            final history = HistoryModel(
                                              idNews: snapshot.data![index].id.toString(),
                                              idPengguna: idPengguna,
                                              title: snapshot.data![index].title,
                                              urlData: snapshot.data![index].urlGambar,
                                              urlGambar: snapshot.data![index].urlData,
                                              kategori: snapshot.data![index].kategori,
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
                                            urlImage: snapshot.data![index].urlGambar,
                                            urlNews: snapshot.data![index].urlData,
                                            description: snapshot.data![index].description,
                                            kategori: snapshot.data![index].kategori,
                                            penulis: snapshot.data![index].author,
                                          ));
                                        },
                                      ),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
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
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Konfirmasi"),
                      content: Text(
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
                          child: Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text("Yes"),
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
                    await Future.delayed(Duration(milliseconds: 500));
                    historyController.getAllHistoryFromSingleUser(idPengguna);
                    await Future.delayed(Duration(milliseconds: 800));
                    List<String> listIdHistory = HistoryRepository.instance.getListIdHistoryFromSingelUser();
                    await Future.delayed(Duration(milliseconds: 500));
                    print("list history yg ada di db: ${listIdHistory.toString()}");
                    for(int i=0; i<listIdHistory.length; i++){
                      await Future.delayed(Duration(milliseconds: 50));
                      print("data history ke ${i+1} dengan id ${listIdHistory[i]} berhasil di hapus");
                      historyController.deleteHistory(listIdHistory[i]);
                    }
                  }
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: SizedBox(
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
      ]
    );
  }

  Widget buildNoData() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Belum ada history nih...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}