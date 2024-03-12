import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Utils/Helper/TimeSavedNews.dart';
import '../../controller/bookmark_controller.dart';
import '../../controller/comment_controller.dart';
import '../../controller/news_controller.dart';
import '../../controller/profile_controller.dart';
import '../../models/bookmark_model.dart';
import '../../models/comment_model.dart';
import '../../repository/bookmark_repository/bookmark_repository.dart';
import '../../repository/news_repository/news_repository.dart';
import '../components/button.dart';
import '../components/my_textfield.dart';
import '../dummyNews.dart';



class DummyCommentScreen extends StatefulWidget{

  const DummyCommentScreen ({Key? key}) : super (key: key);

  @override
  State<DummyCommentScreen> createState() => _DummyCommentScreenState();
}

class _DummyCommentScreenState extends State<DummyCommentScreen> {


  String title = NewsRepository.instance.getTitle();
  String idNews = NewsRepository.instance.getidNews();
  String publisher = NewsRepository.instance.getPublisher();
  String author = NewsRepository.instance.getAuthor();
  String url1 = NewsRepository.instance.getUrl();
  String newsPicture = NewsRepository.instance.getNewsPicture();
  String kategori = NewsRepository.instance.getNewsCategory();


  int dislikeCount = NewsRepository.instance.getDislikeCount();
  int likeCount = NewsRepository.instance.getlikeCount();

  int count=0;
  int count1=0;

  final fullnameController = TextEditingController();
  final provinsiController = TextEditingController();
  final emailController = TextEditingController();
  final DetailComment = TextEditingController();

  final dateTimecontroller = Get.put(TimeSavedParser());

  @override
  Widget build(BuildContext context){

    DateTime tets = DateTime.now();
    String montValue = dateTimecontroller.montParser(tets.month.toInt());
    String tanggalToday = tets.day.toString()+" "+montValue+" "+tets.year.toString();

    // final controller1 = Get.put(LikeDislikeNewsController());
    final controller2 = Get.put(NewsController());
    final userController = Get.put(ProfileController());

    final bookMarkController = Get.put(BookmarkController());

    String fotoUser = userController.getUserFoto();
    String emailUser = userController.getUserEmail();
    String userName = userController.getUserName();
    String idUser = userController.getidUser();
    // if(title ==""){
    //   FirebaseAuth.instance.currentUser?.reload();
    //   title = NewsRepository.instance.getTitle();
    //   Get.to(()=>DummyCommentScreen());
    // }
    print("title yang ada : "+controller2.getTitle());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(CommentController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(LineAwesomeIcons.arrow_circle_left),),
        title: Text("News Detail", style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon),),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<List<CommentModel>>(
            future : controller.getAllCommentbasedOnIdNews(idNews),
            // future : controller.getAllComment(),
            builder: (context, snapshot){
              // done means data completly fetch
              print('Checkpoint Comment: ${snapshot.connectionState}');

              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (c, index){
                        return Column(
                          children: [
                            ListTile(
                              iconColor: Colors.blue,
                              tileColor: Colors.blue.withOpacity(0.1),
                              leading: const Icon(LineAwesomeIcons.user_1),
                              // title: Text("Title : ${snapshot.data![index].userNamePengguna}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Fetch Comment
                                  Text(snapshot.data![index].emailPengguna),
                                  Text(snapshot.data![index].komen),
                                  // Fetch News
                                  Text("ID : ${snapshot.data![index].id!}"),
                                  Text("title : ${title}"),
                                  Text("author : ${author}"),
                                  Text("url : ${url1}"),
                                  SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: ClipRRect(borderRadius : BorderRadius.circular(100),child: Image.network(snapshot.data![index].pathFoto)),
                                  ),

                                ],
                              ),
                            ),
                            // Add Comment
                            const SizedBox(height: 20),

                            MyTextField(
                              controller: DetailComment,
                              hintText: 'Isi Comment',
                              obscureText: false,
                            ),
                            theButton(
                              text: 'Sent Comment',
                              onTap: () async {

                                int ctr = 0;
                                ctr+=1;
                                String dummyComment = "Sangat Keren dan menginspirasi"+ctr.toString();

                                final comment = CommentModel(
                                    idNews: idNews,
                                    pathFoto: fotoUser,
                                    emailPengguna: emailUser,
                                    userNamePengguna: userName,
                                    waktu: tets.toString(),
                                    komen: dummyComment,
                                    like: 0,
                                    dislike: 0);

                                await controller.createComment(comment);

                                // controller.cr
                                Get.to(()=>DummyNewsScreen());
                                FirebaseAuth.instance.currentUser?.reload();
                                Get.to(()=>DummyCommentScreen());
                              },
                            ),
                            const SizedBox(height: 10,),

                            theButton(
                              text: 'Reload',
                              onTap: () async {
                                Get.to(()=>DummyNewsScreen());
                                FirebaseAuth.instance.currentUser?.reload();
                                controller2.getUserData(title);
                                Get.to(()=>DummyCommentScreen());

                                // Get.to(()=>ProfileScreen());
                              },
                            ),

                            theButton(
                              text: 'Launch',
                              onTap: () async {
                                // const url = 'https://www.geeksforgeeks.org/';
                                String url = url1;
                                if (await canLaunch(url)) {
                                  await launch(url, forceWebView: true, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                                // Get.to(()=>ProfileScreen());
                              },
                            ),

                            theButton(
                              text: 'Save Bookmark',
                              onTap: () async {

                                await bookMarkController.getAllBookmarkfromSingleUser(idUser);
                                print("Title-nya " + title);
                                print("Data ada : " + BookmarkRepository.instance.isDataAvail());
                                if(BookmarkRepository.instance.isDataAvail() == "NO"){
                                  final bookmark = BookmarkModel(
                                      idNews: idNews,
                                      idPengguna: idUser,
                                      title: title,
                                      urlData: url1,
                                      urlGambar: newsPicture,
                                      kategori: kategori);

                                  await bookMarkController.createBookMark(bookmark);
                                } else{
                                  List<String> listTitleSave = BookmarkRepository.instance.getListTitleBookmark();
                                  for(int i=0; i<listTitleSave.length;i++){
                                    if(listTitleSave.contains(title)){
                                      print("Data sudah pernah ada");
                                    }
                                    else{
                                      final bookmark = BookmarkModel(
                                          idNews: idNews,
                                          idPengguna: idUser,
                                          title: title,
                                          urlData: url1,
                                          urlGambar: newsPicture,
                                          kategori: kategori);

                                      await bookMarkController.createBookMark(bookmark);
                                    }
                                  }
                                }


                                // controller.cr
                                Get.to(()=>DummyNewsScreen());
                                FirebaseAuth.instance.currentUser?.reload();
                                BookmarkRepository.instance.setNullListTitleBookmark();
                                Get.to(()=>DummyCommentScreen());
                              },
                            ),
                            const SizedBox(height: 10,),


                            /// Di Comment DULU - Testing LIKE
                            // theButton(
                            //   text: 'LIKE',
                            //   onTap: () async {
                            //     controller1.updateFlagLikeDislike("LIKE", "I9YDS8qHX2WIVjVvT8Lc");
                            //     print("checkpoint likedislike1");
                            //     controller2.getUserData(title);
                            //     print("checkpoint likedislike2");
                            //     count = dislikeCount;
                            //     print("NIlai dislike ${count}");
                            //     count1 = likeCount;
                            //     print("NIlai like ${count1}");
                            //     controller1.getSingleLikeDislikeNewsData("QPRPfHS9mtHe7S9bTWNm", idNews);
                            //     print("checkpoint likedislike2-1");
                            //     print("Nilai flag = ${LikeDislikeNewsRepository.instance.getFlag()}");
                            //   },
                            // ),


                            /// Di Comment DULU - Testing LIKE
                            // theButton(
                            //   text: 'Sent Data LIKE',
                            //   onTap: () async {
                            //     if("LIKE"==LikeDislikeNewsRepository.instance.getFlag()){
                            //       count1+=1;
                            //       count-=1;
                            //     }
                            //     print("NIlai dislike after ${count}");
                            //     print("NIlai like after ${count1}");
                            //     print("checkpoint likedislike2-2");
                            //     controller2.updateFlagDislikeNews(count, idNews);
                            //     print("checkpoint likedislike3");
                            //     controller2.updateFlagLikeNews(count1, idNews);
                            //     print("checkpoint likedislike4");
                            //     print("checkpoint likedislike === DONE");
                            //     // controller2.updateFlagLikeDislikeNews(dislike, id)
                            //     // Get.to(()=>ProfileScreen());
                            //     Get.to(()=>DummyNewsScreen());
                            //   },
                            // ),


                          ],
                        );
                      });

                } else if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else{
                  return const Center(child: Text("Something Went Wrong"),);
                }
              } else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },

          ),
        ),

      ),
    );
  }
}