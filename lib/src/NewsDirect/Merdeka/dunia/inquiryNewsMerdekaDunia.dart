import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/pages/components/InquiryHeader.dart';
import 'package:skripsilocal/src/NewsDirect/Merdeka/core/merdeka_news_repository.dart';
import '../../../../models/berita_model.dart';

class InquiryMerdekaNewsDunia extends StatefulWidget {
  const InquiryMerdekaNewsDunia({Key? key}) : super(key: key);

  @override
  State<InquiryMerdekaNewsDunia> createState() => _InquiryMerdekaNewsDuniaState();
}

class _InquiryMerdekaNewsDuniaState extends State<InquiryMerdekaNewsDunia> {
  final newsRepo = Get.put(MerdekaNewsRepository());
  final String author = "Merdeka News | Internasional";
  final String publisher = "Merdeka News";
  final String category = "Internasional";
  late Future<BeritaModel?> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = getData();
  }

  Future<BeritaModel?> getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/merdeka/dunia';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        showCustomSnackbar('Success', '${json.decode(res.body)['data']['posts'].length} news saved successfully!', isError: false);
        return BeritaModel.fromJson(json.decode(res.body));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  void processData(BeritaModel data) async {
    await Future.delayed(const Duration(milliseconds: 100));
    MerdekaNewsRepository.instance.setNullListJudulDuniaMerdekaNews();
    await Future.delayed(const Duration(milliseconds: 100));
    int tempCtr = MerdekaNewsRepository.instance.getCountPeriod();
    await MerdekaNewsRepository.instance.getAllNewsMerdekaDunia(tempCtr);
    await MerdekaNewsRepository.instance.getAllNewsMerdekaDunia(tempCtr-1);
    await MerdekaNewsRepository.instance.getAllNewsMerdekaDunia(tempCtr-2);
    await MerdekaNewsRepository.instance.getAllNewsMerdekaDunia(tempCtr-3);
    List<String> listJudul = MerdekaNewsRepository.instance.getListJudulDuniaMerdekaNews();
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
          countPeriod: tempCtr==0?MerdekaNewsRepository.instance.getCountPeriod():tempCtr,
          nilaiRating: 0,
          jumlahPerating: 0,
        );
        await newsRepo.saveNewsMerdeka(news);
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
          future: _futureData,
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
