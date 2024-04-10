import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/controller/comment_controller.dart';
import 'package:skripsilocal/controller/history_controller.dart';
import 'package:skripsilocal/controller/news_controller.dart';
import 'package:skripsilocal/models/comment_model.dart';
import 'package:skripsilocal/models/history_model.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/components/newsDetailHeader.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
import 'package:flutter/services.dart';
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
    print("isDataAvail $temp");

    return SafeArea(
      child: Scaffold(
        appBar: DetailHeader(),
        body: temp == "YES" ? buildHistory(idPengguna) : buildNoData(),
      ),
    );
  }

  Widget buildHistory(String idPengguna) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
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