import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/src/NewsDirect/CNBC/core/cnbc_news_repository.dart';
import 'package:skripsilocal/src/features/authentication/models/news_model.dart';

import '../../../features/authentication/models/Berita/berita_model.dart';

class InquiryCNBCNewsTech extends StatefulWidget {

  const InquiryCNBCNewsTech({Key? key}) : super(key: key);


  @override
  State<InquiryCNBCNewsTech> createState() => _InquiryCNBCNewsTech();
}

class _InquiryCNBCNewsTech extends State<InquiryCNBCNewsTech> {


  int savedTime = 0;

  final newsRepo = Get.put(CNBCNewsRepository());

  final String author = "Tech - Berita Terkini Tech, Startup, Bitcoin - CNBC Indonesia";
  final String publisher = "CNBC Indonesia";
  final String category = "teknologi";


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/cnbc/tech';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFetching = BeritaModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
      int tempCtr = CNBCNewsRepository.instance.getDateSaved();
      await CNBCNewsRepository.instance.getAllNewsCNBCTeknologi(tempCtr);
      await CNBCNewsRepository.instance.getAllNewsCNBCTeknologi(tempCtr-1);
      await CNBCNewsRepository.instance.getAllNewsCNBCTeknologi(tempCtr-2);
      await CNBCNewsRepository.instance.getAllNewsCNBCTeknologi(tempCtr-3);
      List<String> listJudul = CNBCNewsRepository.instance.getListJudulTeknologiCNBCNews();
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
