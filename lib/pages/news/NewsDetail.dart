import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skripsilocal/controller/bookmark_controller.dart';
import 'package:skripsilocal/controller/profile_controller.dart';
import 'package:skripsilocal/models/bookmark_model.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utils/TimeSavedNews.dart';
import '../../controller/comment_controller.dart';
import '../../models/comment_model.dart';

class NewsDetail extends StatefulWidget {
  final String id;
  final String title;
  final String publisher;
  final String urlImage;
  final String urlNews;
  final String description;
  final String penulis;
  final String kategori;

  const NewsDetail({
    Key? key,
    required this.id,
    required this.title,
    required this.publisher,
    required this.urlImage,
    required this.urlNews,
    required this.description,
    required this.penulis,
    required this.kategori
  }) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  // String url1 = NewsRepository.instance.getUrl();
  // String newsPicture = NewsRepository.instance.getNewsPicture();
  // String kategori = NewsRepository.instance.getNewsCategory();
  final DetailComment = TextEditingController();
  final dateTimecontroller = Get.put(TimeSavedParser());
  final userController = Get.put(ProfileController());

  late String idNews;
  late String title;
  late String publisher;
  late String urlImage;
  late String urlNews;
  late String description;
  late String penulis;
  late String kategori;

  @override
  void initState() {
    super.initState();
    idNews = widget.id;
    title = widget.title;
    publisher = widget.publisher;
    urlImage = widget.urlImage;
    urlNews = widget.urlNews;
    description = widget.description;
    penulis = widget.penulis;
    kategori = widget.kategori;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat temp = DateFormat('yyyy-MM-dd');
    String waktu = temp.format(now);
    final bookMarkController = Get.put(BookmarkController());
    final controller = Get.put(CommentController());
    String fotoUser = userController.getUserFoto();
    String emailUser = userController.getUserEmail();
    String userName = userController.getUserName();
    String idUser = userController.getidUser();

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                        ),
                      ),
                      child: ClipRRect(
                        child: Image.network(
                          urlImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          onTap: () async {
                            String url = urlNews;
                            if (await canLaunch(url)) {
                              await launch(url, forceWebView: true, enableJavaScript: true);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                        SizedBox(height: 5),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "$publisher",
                          style: TextStyle(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () async {
                            await Future.delayed(Duration(seconds: 2));
                            await bookMarkController.getAllBookmarkOne(idUser, title);
                            await Future.delayed(Duration(seconds: 1));
                            String temp = BookmarkRepository.instance.getDataAvail();
                            // print("Title-nya " + title);
                            // print("Data ada : " + BookmarkRepository.instance.isDataAvail());
                            print(BookmarkRepository.instance.getDataAvail());
                            if(temp == "NO"){
                              final bookmark = BookmarkModel(
                                  idNews: idNews,
                                  idPengguna: idUser,
                                  title: title,
                                  urlData: urlNews,
                                  urlGambar: urlImage,
                                  kategori: kategori,
                                  publisher: penulis,
                              );
                              await bookMarkController.createBookMark(bookmark);
                              print("Data sudah pernah ada");
                              showCustomSnackbar("Success", "Berita sudah pernah ditambahkan!", isError: false);
                            } else{
                              // await Future.delayed(Duration(seconds: 2));
                              // List<String> listTitleSave = BookmarkRepository.instance.getListTitleBookmark();
                              // for(int i=0; i<listTitleSave.length;i++){
                              //   if(listTitleSave.contains(title)){
                                  print("Data sudah pernah ada");
                                  showCustomSnackbar("Error", "Berita sudah pernah ditambahkan!", isError: true);
                                // }
                                // print(listTitleSave)
                                // else{
                                //   final bookmark = BookmarkModel(
                                //       idNews: idNews,
                                //       idPengguna: idUser,
                                //       title: title,
                                //       urlData: urlNews,
                                //       urlGambar: urlImage,
                                //       kategori: kategori,
                                //       publisher: penulis,
                                //   );
                                //   await bookMarkController.createBookMark(bookmark);
                                // }
                              // }
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "+ Tambah Bookmark",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: StreamBuilder<List<CommentModel>>(
                  stream: controller.getAllCommentbasedOnIdNews(idNews),
                  builder: (context, snapshot) {
                    print('Checkpoint Comment: ${snapshot.connectionState}');
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        snapshot.data![index].pathFoto,
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].userNamePengguna,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data![index].komen,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data![index].waktu,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: DetailComment,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Komentar',
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      color: Colors.black,
                      onPressed: () async {
                        String usercomment = DetailComment.text;
                        final comment = CommentModel(
                            idNews: idNews,
                            pathFoto: fotoUser,
                            emailPengguna: emailUser,
                            userNamePengguna: userName,
                            waktu: waktu,
                            komen: usercomment,);
                        await controller.createComment(comment);
                        DetailComment.clear();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

}
