import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/pages/components/InquiryHeader.dart';import 'package:skripsilocal/src/NewsDirect/Suara/core/suara_news_repository.dart';
import '../../../../models/berita_model.dart';

class InquirySuaraNewsHealth extends StatefulWidget {
  const InquirySuaraNewsHealth({Key? key}) : super(key: key);

  @override
  State<InquirySuaraNewsHealth> createState() => _InquirySuaraNewsHealthState();
}

class _InquirySuaraNewsHealthState extends State<InquirySuaraNewsHealth> {
  final newsRepo = Get.put(SuaraNewsRepository());
  final String author = "Suara News | Berita Kesehatan Terkini";
  final String publisher = "Suara News";
  final String category = "Kesehatan";
  late Future<BeritaModel?> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = _getData();
  }

  Future<BeritaModel?> _getData() async {
    try {
      String url = 'https://api-berita-indonesia.vercel.app/suara/health';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        showCustomSnackbar('Success', '${json.decode(res.body)['data']['posts'].length} berita berhasil disimpan!', isError: false);
        return BeritaModel.fromJson(json.decode(res.body));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return SafeArea(
      child: Scaffold(
        appBar: InquiryHeader(),
        body: FutureBuilder<BeritaModel?>(
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data != null) {
              return _buildNewsList(snapshot.data!);
            } else {
              return const Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildNewsList(BeritaModel data) {
    return ListView.builder(
      itemCount: data.data?.posts.length ?? 0,
      itemBuilder: (context, index) {
        var post = data.data!.posts[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: Colors.black),
            ),
            color: index.isOdd ? Colors.grey.shade300 : Colors.grey.shade500,
            child: ListTile(
              title: Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(post.thumbnail.toString(), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title.toString(),
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                publisher,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Icon(Icons.remove_red_eye, size: 20),
                        //     const SizedBox(width: 4),
                        //     Text("${post.pubDate.toString()}", style: const TextStyle(fontSize: 16)),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
