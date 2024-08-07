import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skripsilocal/controller/bookmark_controller.dart';
import 'package:skripsilocal/controller/profile_controller.dart';
import 'package:skripsilocal/controller/rating_controller.dart';
import 'package:skripsilocal/models/bookmark_model.dart';
import 'package:skripsilocal/pages/components/newsDetailHeader.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/repository/bookmark_repository/bookmark_repository.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
import 'package:skripsilocal/repository/rating_repository/rating_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utils/timeSavedNews.dart';
import '../../controller/comment_controller.dart';
import '../../models/comment_model.dart';
import '../../models/rating_model.dart';
import '../../repository/authentication_repository/authentication_repository.dart';
import '../authentication/login_page.dart';

class NewsDetail extends StatefulWidget {

  // Untuk akses variabel param dari halaman lain
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
  final detailComment = TextEditingController();
  final dateTimecontroller = Get.put(PeriodSavedParser());
  final userController = Get.put(ProfileController());
  late String idNews;
  late String title;
  late String publisher;
  late String urlImage;
  late String urlNews;
  late String description;
  late String penulis;
  late String kategori;
  double _ratingValue = 5;

  // setiap iniState, setiap sekali widget dibuat, iniState akan dijalanin dulu baru build
  // setiap lempar parameter by widget
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
    _ratingValue = 5;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat temp = DateFormat('yyyy-MM-dd');
    String waktu = temp.format(now);
    final bookMarkController = Get.put(BookmarkController());
    final ratingController = Get.put(RatingController());
    final controller = Get.put(CommentController());
    String fotoUser = userController.getUserFoto();
    String emailUser = userController.getUserEmail();
    String userName = userController.getUserName();
    String idUser = userController.getidUser();
    // num tempValue = 0;
    // double _ratingValue = 1;

    return SafeArea(
      child: Scaffold(
        appBar: const DetailHeader(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 275,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                                style: const TextStyle(
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
                            const SizedBox(height: 5),
                            Text(
                              description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              publisher,
                              style: const TextStyle(
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const SizedBox(height: 5),
                            InkWell(
                              onTap: () async {

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                );

                                if(AuthenticationRepository.instance.firebaseUser==null){
                                  Navigator.pop(context);
                                  Get.to(() => const LoginPage());
                                } else {
                                  await Future.delayed(const Duration(seconds: 2));
                                  await bookMarkController.getAllBookmarkOne(idUser, title);
                                  await Future.delayed(const Duration(seconds: 1));
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
                                      publisher: publisher,
                                      description: description,
                                      author: penulis,
                                    );
                                    await bookMarkController.createBookMark(bookmark);
                                    // print("Data sudah pernah ada");
                                    Navigator.pop(context);
                                    showCustomSnackbar("Success", "Bookmark added successfully!", isError: false);
                                    BookmarkRepository.instance.getAllBookmarksFromSingleUser(idUser);
                                    String temp = "";
                                    temp = BookmarkRepository.instance.isDataAvail();
                                    // print("isDataAvail $temp");
                                  } else{
                                    // print("Data sudah pernah ada");
                                    Navigator.pop(context);
                                    showCustomSnackbar("Error", "Bookmark has been added!", isError: true);
                                  }
                                }
                              },

                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "+ Add Bookmark",
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
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Text(
                          "Please give the news rating :"
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Slider(
                          value: _ratingValue,
                          min: 0,
                          max: 10,
                          divisions: 10,
                          onChanged: (double value) {
                            setState(() {
                              _ratingValue = value.roundToDouble();

                            });
                          },
                          label: '$_ratingValue',
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send_sharp),
                        onPressed: () async {

                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                          print(_ratingValue);
                          DateTime now = DateTime.now();
                          String time = "";
                          time = now.toString();
                          double nilaiRatingInput = _ratingValue;
                          if(AuthenticationRepository.instance.firebaseUser == null){
                            Navigator.pop(context);
                            Get.snackbar(
                              'Information!',
                              'Please login first!',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.yellow,
                              borderRadius: 10.0,
                              messageText: const Text(
                                'Please login first!',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            );
                            Future.delayed(const Duration(seconds: 3));
                            Get.to(() => const LoginPage());
                          } else {
                            await Future.delayed(const Duration(seconds: 1));
                            await ratingController.getAllRatingByIdUserAndIdNews(idUser, idNews);
                            await Future.delayed(const Duration(milliseconds: 500));
                            String flagRatingAvail = RatingRepository.instance.isDataRatingAvail;
                            await Future.delayed(const Duration(milliseconds: 200));
                            int nilaiRatingUserFromDB = RatingRepository.instance.nilaiRatingUser;
                            await Future.delayed(const Duration(milliseconds: 100));
                            String idRatingDBUser = RatingRepository.instance.idRatingByUserIdAndNewsId;
                            if(flagRatingAvail == "NO"){
                              final rating = RatingModel(
                                idNews: idNews,
                                idPengguna: idUser,
                                nilaiRating: nilaiRatingInput.toInt(),
                                publisher: publisher,
                                author: penulis,
                                title: title,
                                description: description,
                                urlImage: urlImage,
                                urlNews: urlNews,
                                category: kategori,
                                timeRating: time,
                              );
                              await ratingController.createRating(rating);
                              await Future.delayed(const Duration(milliseconds: 100));
                              await NewsRepository.instance.tambahNilaiRating(nilaiRatingInput.toInt(), idNews);
                              Navigator.pop(context);
                              showCustomSnackbar("Success", "Rating added successfully!", isError: false);
                              RatingRepository.instance.getAllRatingsOnlyUserTarget(idUser);
                            }
                            else {
                              if(nilaiRatingUserFromDB != nilaiRatingInput) {
                                double newsRatingNewValue = (nilaiRatingUserFromDB-nilaiRatingInput);
                                await Future.delayed(const Duration(milliseconds: 50));
                                ratingController.updateRatingUsers(idRatingDBUser, nilaiRatingInput.toInt());
                                Navigator.pop(context);
                                showCustomSnackbar("Success", "Rating added successfully!", isError: false);
                                await Future.delayed(const Duration(milliseconds: 100));
                                String flag = "";
                                if(newsRatingNewValue<0){
                                  flag = "MORE";
                                } else {
                                  flag = "LESS";
                                }
                                await NewsRepository.instance.updateNilaiRating(newsRatingNewValue.toInt(), idNews, flag);
                              }
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
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
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
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
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data![index].komen,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data![index].waktu,
                                          style: const TextStyle(
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
                border: const Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: detailComment,
                        decoration: InputDecoration(
                          hintText: 'Input your comment',
                          hintStyle: const TextStyle(color: Colors.grey),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      color: Colors.black,
                      onPressed: () async {
                        await Future.delayed(const Duration(milliseconds: 100));
                        if(AuthenticationRepository.instance.firebaseUser==null){
                          Get.to(() => const LoginPage());
                        } else{
                          String usercomment = detailComment.text;
                          final comment = CommentModel(
                            idNews: idNews,
                            pathFoto: fotoUser,
                            emailPengguna: emailUser,
                            userNamePengguna: userName,
                            waktu: waktu,
                            komen: usercomment,
                          );
                          await controller.createComment(comment);
                          detailComment.clear();
                        }
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
