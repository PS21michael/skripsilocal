import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/Suara/core/suara_news_repository.dart';

import '../../../../models/berita_model.dart';
import '../../../../models/news_model.dart';

class InquirySuaraNewsBola extends StatefulWidget {

  const InquirySuaraNewsBola({Key? key}) : super(key: key);


  @override
  State<InquirySuaraNewsBola> createState() => _InquirySuaraBola();
}

class _InquirySuaraBola extends State<InquirySuaraNewsBola> {


  int savedTime = 0;

  final newsRepo = Get.put(SuaraNewsRepository());

  final String author = "Suara News | Berita Bola, Jadwal, Skor dan Liga Eropa";
  final String publisher = "Suara News";
  final String category = "Bola";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/suara/bola';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      await Future.delayed(Duration(milliseconds: 100));
      SuaraNewsRepository.instance.setNullListJudulBolaSuaraNews();
      await Future.delayed(Duration(milliseconds: 100));
      int tempCtr = SuaraNewsRepository.instance.getDateSaved();
      await SuaraNewsRepository.instance.getAllNewsSuaraBola(tempCtr);
      await SuaraNewsRepository.instance.getAllNewsSuaraBola(tempCtr-1);
      await SuaraNewsRepository.instance.getAllNewsSuaraBola(tempCtr-2);
      await SuaraNewsRepository.instance.getAllNewsSuaraBola(tempCtr-3);
      List<String> listJudul = SuaraNewsRepository.instance.getListJudulBolaSuaraNews();
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
