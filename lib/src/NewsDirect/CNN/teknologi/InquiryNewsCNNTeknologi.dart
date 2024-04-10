import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/CNN/core/cnn_news_repository.dart';

import '../../../../models/berita_model.dart';
import '../../../../models/news_model.dart';

class InquiryCNNNewsTeknologi extends StatefulWidget {

  const InquiryCNNNewsTeknologi({Key? key}) : super(key: key);


  @override
  State<InquiryCNNNewsTeknologi> createState() => _InquiryCNNNewsTeknologi();
}

class _InquiryCNNNewsTeknologi extends State<InquiryCNNNewsTeknologi> {


  int countPeriod = 0;

  final newsRepo = Get.put(CNNNewsRepository());

  final String author = "CNN Indonesia | Berita Terkini Teknologi";
  final String publisher = "CNN Indonesia";
  final String category = "Teknologi";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/cnn/teknologi';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      await Future.delayed(Duration(milliseconds: 100));
      CNNNewsRepository.instance.setNullListJudulTeknologiCNNNews();
      await Future.delayed(Duration(milliseconds: 100));
      int tempCtr = CNNNewsRepository.instance.getCountPeriod();
      await CNNNewsRepository.instance.getAllNewsCNNTeknologi(tempCtr);
      await CNNNewsRepository.instance.getAllNewsCNNTeknologi(tempCtr-1);
      await CNNNewsRepository.instance.getAllNewsCNNTeknologi(tempCtr-2);
      await CNNNewsRepository.instance.getAllNewsCNNTeknologi(tempCtr-3);
      List<String> listJudul = CNNNewsRepository.instance.getListJudulTeknologiCNNNews();
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
              countPeriod: tempCtr==0?CNNNewsRepository.instance.getCountPeriod():tempCtr,
              nilaiRating: 0,
              jumlahPerating: 0);
          await newsRepo.saveNewsCNN(news);
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
