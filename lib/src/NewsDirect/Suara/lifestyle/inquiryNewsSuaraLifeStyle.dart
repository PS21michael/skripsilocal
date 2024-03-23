import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/Suara/core/suara_news_repository.dart';

import '../../../../models/berita_model.dart';
import '../../../../models/news_model.dart';

class InquirySuaraNewsLifeStyle extends StatefulWidget {

  const InquirySuaraNewsLifeStyle({Key? key}) : super(key: key);


  @override
  State<InquirySuaraNewsLifeStyle> createState() => _InquirySuaraLifeStyle();
}

class _InquirySuaraLifeStyle extends State<InquirySuaraNewsLifeStyle> {


  int savedTime = 0;

  final newsRepo = Get.put(SuaraNewsRepository());

  final String author = "Suara News | Gaya Hidup Terkini";
  final String publisher = "Suara News";
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
      String url = 'https://api-berita-indonesia.vercel.app/suara/lifestyle';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      await Future.delayed(Duration(milliseconds: 300));
      int tempCtr = SuaraNewsRepository.instance.getDateSaved();
      await SuaraNewsRepository.instance.getAllNewsSuaraLifeStyle(tempCtr);
      await SuaraNewsRepository.instance.getAllNewsSuaraLifeStyle(tempCtr-1);
      await SuaraNewsRepository.instance.getAllNewsSuaraLifeStyle(tempCtr-2);
      await SuaraNewsRepository.instance.getAllNewsSuaraLifeStyle(tempCtr-3);
      List<String> listJudul = SuaraNewsRepository.instance.getListJudulLifeStyleSuaraNews();
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
              views: 0,
              saveDate: tempCtr==0?SuaraNewsRepository.instance.getDateSaved():tempCtr);
          await newsRepo.saveNewsSuara(news);
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
