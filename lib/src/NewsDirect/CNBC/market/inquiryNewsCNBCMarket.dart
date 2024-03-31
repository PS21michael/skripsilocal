import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/CNBC/core/cnbc_news_repository.dart';

import '../../../../models/berita_model.dart';
import '../../../../models/news_model.dart';

class InquiryCNBCNewsMarket extends StatefulWidget {

  const InquiryCNBCNewsMarket({Key? key}) : super(key: key);


  @override
  State<InquiryCNBCNewsMarket> createState() => _InquiryCNBCNewsMarket();
}

class _InquiryCNBCNewsMarket extends State<InquiryCNBCNewsMarket> {


  int savedTime = 0;

  final newsRepo = Get.put(CNBCNewsRepository());

  final String author = "Market - Berita Terkini Market, Saham, Reksadana - CNBC Indonesia";
  final String publisher = "CNBC Indonesia";
  final String category = "Market";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/cnbc/market';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      await Future.delayed(Duration(milliseconds: 100));
      CNBCNewsRepository.instance.setNullListJudulMarketCNBCNews();
      await Future.delayed(Duration(milliseconds: 100));
      int tempCtr = CNBCNewsRepository.instance.getDateSaved();
      await CNBCNewsRepository.instance.getAllNewsCNBCMarket(tempCtr);
      await CNBCNewsRepository.instance.getAllNewsCNBCMarket(tempCtr-1);
      await CNBCNewsRepository.instance.getAllNewsCNBCMarket(tempCtr-2);
      await CNBCNewsRepository.instance.getAllNewsCNBCMarket(tempCtr-3);
      List<String> listJudul = CNBCNewsRepository.instance.getListJudulMarketCNBCNews();
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
              saveDate: tempCtr==0?CNBCNewsRepository.instance.getDateSaved():tempCtr);
          await newsRepo.saveNewsCNBC(news);
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
