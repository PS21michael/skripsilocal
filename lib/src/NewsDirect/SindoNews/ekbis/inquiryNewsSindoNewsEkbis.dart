import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/SindoNews/core/sindo_news_repository.dart';

import '../../../../models/Berita/berita_model.dart';
import '../../../../models/news_model.dart';

class InquirySindoNewsEkbis extends StatefulWidget {

  const InquirySindoNewsEkbis({Key? key}) : super(key: key);


  @override
  State<InquirySindoNewsEkbis> createState() => _InquirySindoNewsEkbis();
}

class _InquirySindoNewsEkbis extends State<InquirySindoNewsEkbis> {


  int savedTime = 0;

  final newsRepo = Get.put(SindoNewsRepository());

  final String author = "Berita Ekonomi dan Bisnis Terkini dan Terbaru - SINDOnews";
  final String publisher = "SINDOnews";
  final String category = "ekbis";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/sindonews/ekbis';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      int tempCtr = SindoNewsRepository.instance.getDateSaved();
      await SindoNewsRepository.instance.getAllNewsSindoNewsEkbis(tempCtr);
      await SindoNewsRepository.instance.getAllNewsSindoNewsEkbis(tempCtr-1);
      await SindoNewsRepository.instance.getAllNewsSindoNewsEkbis(tempCtr-2);
      await SindoNewsRepository.instance.getAllNewsSindoNewsEkbis(tempCtr-3);
      List<String> listJudul = SindoNewsRepository.instance.getListJudulEkbisSindoNews();
      for(int i=0; i<dataFetching!.data!.posts.length;i++){
        if(listJudul.contains(dataFetching!.data!.posts![i].title)){
          print('Data yang duplikat ada sebanyak ${i}');
          continue;
        }else {
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
          await newsRepo.saveNewsSindoNews(news);
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