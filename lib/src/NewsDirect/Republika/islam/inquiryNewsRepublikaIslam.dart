import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/Republika/core/republika_news_repository.dart';

import '../../../../models/berita_model.dart';
import '../../../../models/news_model.dart';

class InquiryRepublikaNewsIslam extends StatefulWidget {

  const InquiryRepublikaNewsIslam({Key? key}) : super(key: key);


  @override
  State<InquiryRepublikaNewsIslam> createState() => _InquiryRepublikaNewsIslam();
}

class _InquiryRepublikaNewsIslam extends State<InquiryRepublikaNewsIslam> {


  int countPeriod = 0;

  final newsRepo = Get.put(RepublikaNewsRepository());

  final String author = "Republika Online - Islam Digest Feed";
  final String publisher = "Republika Online";
  final String category = "Islam";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/republika/islam';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      await Future.delayed(Duration(milliseconds: 100));
      RepublikaNewsRepository.instance.SetListJudulNewsRepublikaIslamNull();
      await Future.delayed(Duration(milliseconds: 100));
      int tempCtr = RepublikaNewsRepository.instance.getDateSaved();
      await RepublikaNewsRepository.instance.getAllNewsRepublikaIslam(tempCtr);
      await RepublikaNewsRepository.instance.getAllNewsRepublikaIslam(tempCtr-1);
      await RepublikaNewsRepository.instance.getAllNewsRepublikaIslam(tempCtr-2);
      await RepublikaNewsRepository.instance.getAllNewsRepublikaIslam(tempCtr-3);
      List<String> listJudul = RepublikaNewsRepository.instance.getListJudulNewsRepublikaIslam();
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
              countPeriod: tempCtr==0?RepublikaNewsRepository.instance.getDateSaved():tempCtr,
              nilaiRating: 0,
              jumlahPerating: 0);
          await newsRepo.saveNewsRepublika(news);
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
