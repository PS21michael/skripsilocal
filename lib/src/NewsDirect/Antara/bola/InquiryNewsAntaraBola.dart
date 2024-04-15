import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/pages/components/InquiryHeader.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/src/NewsDirect/Antara/Core/antara_news_repository.dart';
import '../../../../models/berita_model.dart';
import '../../../../models/news_model.dart';

class InquiryAntaraNewsBola extends StatefulWidget {
  const InquiryAntaraNewsBola({Key? key}) : super(key: key);

  @override
  State<InquiryAntaraNewsBola> createState() => _InquiryAntaraNewsBolaState();
}

class _InquiryAntaraNewsBolaState extends State<InquiryAntaraNewsBola> {
  final newsRepo = Get.put(AntaraNewsRepository());
  final String author = "Sepakbola - ANTARA News";
  final String publisher = "ANTARA News";
  final String category = "Bola";
  late Future<BeritaModel?> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getData();
  }

  Future<BeritaModel?> getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/antara/bola';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        showCustomSnackbar('Success', '${json.decode(res.body)['data']['posts'].length} berita berhasil disimpan!', isError: false);
        return BeritaModel.fromJson(json.decode(res.body));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  void processData(BeritaModel data) async {
    await Future.delayed(const Duration(milliseconds: 100));
    AntaraNewsRepository.instance.setNullListJudulBolaAntaraNews();
    await Future.delayed(const Duration(milliseconds: 100));
    int tempCtr = AntaraNewsRepository.instance.getCountPeriod();
    await AntaraNewsRepository.instance.getAllNewsAntaraBola(tempCtr);
    await AntaraNewsRepository.instance.getAllNewsAntaraBola(tempCtr-1);
    await AntaraNewsRepository.instance.getAllNewsAntaraBola(tempCtr-2);
    await AntaraNewsRepository.instance.getAllNewsAntaraBola(tempCtr-3);
    List<String> listJudul = AntaraNewsRepository.instance.getListJudulBolaAntaraNews();
    for(int i=0; i<data.data!.posts.length;i++){
      if(listJudul.contains(data.data!.posts[i].title)){
        // print('Data yang duplikat ada sebanyak ${i}');
        continue;
      } else{
        final news = NewsModel(
          publisher: publisher,
          author: author,
          title: data.data!.posts[i].title.toString(),
          description: data.data!.posts[i].description.toString(),
          urlImage: data.data!.posts[i].thumbnail.toString(),
          urlNews: data.data!.posts[i].link.toString(),
          publishedTime: data.data!.posts[i].pubDate.toString(),
          category: category,
          views: 0,
          countPeriod: tempCtr==0?AntaraNewsRepository.instance.getCountPeriod():tempCtr,
          nilaiRating: 0,
          jumlahPerating: 0,
        );
        await newsRepo.saveNewsAntara(news);
      }
    }
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return SafeArea(
      child: Scaffold(
        appBar: const InquiryHeader(),
        body: FutureBuilder<BeritaModel?>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data != null) {
              processData(snapshot.data!);
              return buildNewsList(snapshot.data!);
            } else {
              return const Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }

  Widget buildNewsList(BeritaModel data) {
    return ListView.builder(
      itemCount: data.data?.posts.length ?? 0,
      itemBuilder: (context, index) {
        var post = data.data!.posts[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: Colors.black),
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
                        border: Border.all(width: 1.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(post.thumbnail.toString(), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title.toString(),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                publisher,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Icon(Icons.remove_red_eye, size: 20),
                        //     const SizedBox(width: 4),
                        //     Text("${post.pubDate.toString()}", style: const TextStyle(fontSize: 16)),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
