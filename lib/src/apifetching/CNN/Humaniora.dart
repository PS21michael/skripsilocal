import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/models/Berita/berita_model.dart';
import 'package:skripsilocal/models/news_model.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';

class Humaniora extends StatefulWidget {
  const Humaniora({Key? key}) : super(key: key);

  @override
  State<Humaniora> createState() => _HumanioraState();
}

class _HumanioraState extends State<Humaniora> {

  final newsRepo = Get.put(NewsRepository());

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  BeritaModel ? dataFetching;

  // UnUse
  Future<BeritaModel> getRecords() async {
    http.Response? response;
    var url = "https://newsapi.org/v2/everything?from=2023-12-26&apiKey=25d148800e254d3db2d40d52820c9963&q=Pemilu&sortBy=publishedAt";
    try {
      response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return BeritaModel.fromJson(jsonDecode(response.body)[0]);
      }
    } catch (Exception) {
      print(Exception);
      print("Error occured");
    }
    return BeritaModel.fromJson(jsonDecode(response!.body)[0]);
  }

  _getData() async {
    try {
      String url2 = 'https://api-berita-indonesia.vercel.app/antara/humaniora';
      http.Response res2 = await http.get(Uri.parse(url2));
      print('Data yg dibalikin ${res2}');
      if (res2.statusCode == 200) {
        // dataFromAPI = DataModel.fromJson(json.decode(res.body));
        // dataFromAPI1 = NewsModel.fromJson(json.decode(res1.body));
        dataFetching = BeritaModel.fromJson(json.decode(res2.body));

        _isLoading = false;
        setState(() {});
      }
      await NewsRepository.instance.getAllNewsANTARAHumaniora();
      List<String> listJudul = NewsRepository.instance.getlistTitle();
      for(int i=0; i<dataFetching!.data!.posts.length;i++){
        if(listJudul.contains(dataFetching!.data!.posts![i].title)){
              print('Data yang duplikat ada sebanyak ${i}');
              continue;
        }
        // for(int j=1; j<listJudul.length;j++){
        //   if(dataFetching!.data!.posts![i].title == listJudul[j]){
        //     print('Data yang duplikat ada sebanyak ${i}');
        //     continue;
        //   }
        // }
        final news = NewsModel(
            publisher: "ANTARA News",
            author: "Humaniora - ANTARA News",
            title: dataFetching!.data!.posts![i].title.toString(),
            description: dataFetching!.data!.posts![i].description.toString(),
            urlImage: dataFetching!.data!.posts![i].thumbnail.toString(),
            urlNews: dataFetching!.data!.posts![i].link.toString(),
            publishedTime: dataFetching!.data!.posts![i].pubDate.toString(),
            category: "humaniora",
            like: 0,
            dislike: 0);
        await newsRepo.insertNews(news);
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
