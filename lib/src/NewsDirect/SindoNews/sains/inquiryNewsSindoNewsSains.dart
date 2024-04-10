import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/SindoNews/core/sindo_news_repository.dart';

import '../../../../models/berita_model.dart';
import '../../../../models/news_model.dart';

class InquirySindoNewsSains extends StatefulWidget {

  const InquirySindoNewsSains({Key? key}) : super(key: key);


  @override
  State<InquirySindoNewsSains> createState() => _InquirySindoNewsSains();
}

class _InquirySindoNewsSains extends State<InquirySindoNewsSains> {


  int countPeriod = 0;

  final newsRepo = Get.put(SindoNewsRepository());

  final String author = "Berita Sains, Luar Angkasa, Penemuan, Ilmu Pengetahuan Terkini dan Terbaru - SINDOnews";
  final String publisher = "SINDOnews";
  final String category = "Sains";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/sindonews/sains';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      await Future.delayed(Duration(milliseconds: 100));
      SindoNewsRepository.instance.setNullListJudulSainsSindoNews();
      await Future.delayed(Duration(milliseconds: 100));
      int tempCtr = SindoNewsRepository.instance.getCountPeriod();
      await SindoNewsRepository.instance.getAllNewsSindoNewsSains(tempCtr);
      await SindoNewsRepository.instance.getAllNewsSindoNewsSains(tempCtr-1);
      await SindoNewsRepository.instance.getAllNewsSindoNewsSains(tempCtr-2);
      await SindoNewsRepository.instance.getAllNewsSindoNewsSains(tempCtr-3);
      List<String> listJudul = SindoNewsRepository.instance.getListJudulSainsSindoNews();
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
              countPeriod: tempCtr==0?SindoNewsRepository.instance.getCountPeriod():tempCtr,
              nilaiRating: 0,
              jumlahPerating: 0);
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
