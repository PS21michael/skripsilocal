import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/Tempo/core/tempo_news_repository.dart';
import 'package:skripsilocal/src/features/authentication/models/news_model.dart';

import '../../../features/authentication/models/Berita/berita_model.dart';

class InquiryTempoNewsGaya extends StatefulWidget {

  const InquiryTempoNewsGaya({Key? key}) : super(key: key);


  @override
  State<InquiryTempoNewsGaya> createState() => _InquiryTempoNewsGaya();
}

class _InquiryTempoNewsGaya extends State<InquiryTempoNewsGaya> {


  int savedTime = 0;

  final newsRepo = Get.put(TempoNewsRepository());

  final String author = "Tempo Gaya - Berita Gaya Hidup dan Trend Fashion Terkini";
  final String publisher = "Tempo News";
  final String category = "lifestyle";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/tempo/gaya';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      int tempCtr = TempoNewsRepository.instance.getDateSaved();
      await TempoNewsRepository.instance.getAllNewsTempoGaya(tempCtr);
      await TempoNewsRepository.instance.getAllNewsTempoGaya(tempCtr-1);
      await TempoNewsRepository.instance.getAllNewsTempoGaya(tempCtr-2);
      await TempoNewsRepository.instance.getAllNewsTempoGaya(tempCtr-3);
      List<String> listJudul = TempoNewsRepository.instance.getListJudulGayaTempoNews();
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
          await newsRepo.saveNewsTempo(news);
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
