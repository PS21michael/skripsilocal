import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/Suara/core/suara_news_repository.dart';

import '../../../../models/Berita/berita_model.dart';
import '../../../../models/news_model.dart';

class InquirySuaraNewsOtomotif extends StatefulWidget {

  const InquirySuaraNewsOtomotif({Key? key}) : super(key: key);


  @override
  State<InquirySuaraNewsOtomotif> createState() => _InquirySuaraOtomotif();
}

class _InquirySuaraOtomotif extends State<InquirySuaraNewsOtomotif> {


  int savedTime = 0;

  final newsRepo = Get.put(SuaraNewsRepository());

  final String author = "Suara News | Berita Otomotif Mobil Motor Terbaru";
  final String publisher = "Suara News";
  final String category = "otomotif";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/suara/otomotif';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      int tempCtr = SuaraNewsRepository.instance.getDateSaved();
      await SuaraNewsRepository.instance.getAllNewsSuaraOtomotif(tempCtr);
      await SuaraNewsRepository.instance.getAllNewsSuaraOtomotif(tempCtr-1);
      await SuaraNewsRepository.instance.getAllNewsSuaraOtomotif(tempCtr-2);
      await SuaraNewsRepository.instance.getAllNewsSuaraOtomotif(tempCtr-3);
      List<String> listJudul = SuaraNewsRepository.instance.getListJudulOtomotifSuaraNews();
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
