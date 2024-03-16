import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/Antara/Core/antara_news_repository.dart';

import '../../../../models/Berita/berita_model.dart';
import '../../../../models/news_model.dart';

class InquiryAntaraNewsEkonomi extends StatefulWidget {

  const InquiryAntaraNewsEkonomi({Key? key}) : super(key: key);


  @override
  State<InquiryAntaraNewsEkonomi> createState() => _InquiryAntaraNewsEkonomi();
}

class _InquiryAntaraNewsEkonomi extends State<InquiryAntaraNewsEkonomi> {


  int savedTime = 0;

  final newsRepo = Get.put(AntaraNewsRepository());

  final String author = "Ekonomi - ANTARA News";
  final String publisher = "ANTARA News";
  final String category = "Ekonomi";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/antara/ekonomi';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      int tempCtr = AntaraNewsRepository.instance.getDateSaved();
      await AntaraNewsRepository.instance.getAllNewsAntaraEkonomi(tempCtr);
      await AntaraNewsRepository.instance.getAllNewsAntaraEkonomi(tempCtr-1);
      await AntaraNewsRepository.instance.getAllNewsAntaraEkonomi(tempCtr-2);
      await AntaraNewsRepository.instance.getAllNewsAntaraEkonomi(tempCtr-3);
      List<String> listJudul = AntaraNewsRepository.instance.getListJudulEkonomiAntaraNews();
      for(int i=0; i<dataFetching!.data!.posts.length;i++){
        if(listJudul.contains(dataFetching!.data!.posts![i].title)){
          print('Data yang duplikat ada sebanyak ${i}');
          continue;
        } else {
          final news = NewsModel(
              publisher: publisher,
              author: author,
              title: dataFetching!.data!.posts![i].title.toString(),
              description: dataFetching!.data!.posts![i].description.toString(),
              urlImage: dataFetching!.data!.posts![i].thumbnail.toString(),
              urlNews: dataFetching!.data!.posts![i].link.toString(),
              publishedTime: dataFetching!.data!.posts![i].pubDate.toString(),
              category: category,
              like: 0,
              dislike: 0,
              saveDate: tempCtr);
          await newsRepo.saveNewsAntara(news);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  dataFetching!.data!.posts[index].thumbnail.toString(),

                  width: 100,
                ),

                Text(dataFetching!.data!.posts[index].title.toString()),

                Text("\$${dataFetching!.data!.posts[index].pubDate.toString()}"),
              ],
            ),
          );
        },
        itemCount: dataFetching!.data!.posts.length,
      ),
    );
  }
}
