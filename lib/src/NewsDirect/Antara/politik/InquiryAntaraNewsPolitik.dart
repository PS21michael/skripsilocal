import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/Antara/Core/antara_news_repository.dart';

import '../../../../models/berita_model.dart';
import '../../../../models/news_model.dart';

class InquiryAntaraNewsPolitik extends StatefulWidget {

  const InquiryAntaraNewsPolitik({Key? key}) : super(key: key);


  @override
  State<InquiryAntaraNewsPolitik> createState() => _InquiryAntaraNewsPolitik();
}

class _InquiryAntaraNewsPolitik extends State<InquiryAntaraNewsPolitik> {


  int savedTime = 0;

  final newsRepo = Get.put(AntaraNewsRepository());

  final String author = "Politik - ANTARA News";
  final String publisher = "ANTARA News";
  final String category = "Politik";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/antara/politik';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      int tempCtr = AntaraNewsRepository.instance.getDateSaved();
      await Future.delayed(Duration(milliseconds: 100));
      AntaraNewsRepository.instance.setNullListJudulPolitikAntaraNews();
      await Future.delayed(Duration(milliseconds: 100));
      await AntaraNewsRepository.instance.getAllNewsAntaraPolitik(tempCtr);
      await AntaraNewsRepository.instance.getAllNewsAntaraPolitik(tempCtr-1);
      await AntaraNewsRepository.instance.getAllNewsAntaraPolitik(tempCtr-2);
      await AntaraNewsRepository.instance.getAllNewsAntaraPolitik(tempCtr-3);
      List<String> listJudul = AntaraNewsRepository.instance.getListJudulPolitikAntaraNews();

      for(int i=0; i<dataFetching!.data!.posts.length;i++){
        if(listJudul.contains(dataFetching!.data!.posts![i].title)){
          print('Data yang duplikat ada sebanyak ${i+1}');
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
                saveDate: tempCtr==0?AntaraNewsRepository.instance.getDateSaved():tempCtr);
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
