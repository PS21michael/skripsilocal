import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/SindoNews/core/sindo_news_repository.dart';

import '../../../../models/berita_model.dart';
import '../../../../models/news_model.dart';

class InquirySindoNewsLifeStyle extends StatefulWidget {

  const InquirySindoNewsLifeStyle({Key? key}) : super(key: key);


  @override
  State<InquirySindoNewsLifeStyle> createState() => _InquirySindoNewsLifeStyle();
}

class _InquirySindoNewsLifeStyle extends State<InquirySindoNewsLifeStyle> {


  int savedTime = 0;

  final newsRepo = Get.put(SindoNewsRepository());

  final String author = "Berita Lifestyle, Musik, Film, Kesehatan, Travel Terkini dan Terbaru - SINDOnews";
  final String publisher = "SINDOnews";
  final String category = "Lifestyle";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/sindonews/lifestyle';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      int tempCtr = SindoNewsRepository.instance.getDateSaved();
      await SindoNewsRepository.instance.getAllNewsSindoLifeStyle(tempCtr);
      await SindoNewsRepository.instance.getAllNewsSindoLifeStyle(tempCtr-1);
      await SindoNewsRepository.instance.getAllNewsSindoLifeStyle(tempCtr-2);
      await SindoNewsRepository.instance.getAllNewsSindoLifeStyle(tempCtr-3);
      List<String> listJudul = SindoNewsRepository.instance.getListJudulLifeStyleSindoNews();
      for(int i=0; i<dataFetching!.data!.posts.length;i++){
        if(listJudul.contains(dataFetching!.data!.posts![i].title)){
          print('Data yang duplikat ada sebanyak ${i}');
          continue;
        }else{
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
