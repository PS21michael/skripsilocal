import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
<<<<<<< HEAD
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

=======
import 'package:skripsilocal/controller/comment_controller.dart';
import 'package:skripsilocal/models/comment_model.dart';
import 'package:skripsilocal/repository/news_repository/news_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/button.dart';
import '../news/dummyNews.dart';
>>>>>>> eab78cf13d271290eb618b5432cabb21df0a6976


class DummyCommentScreen extends StatefulWidget{

  const DummyCommentScreen ({Key? key}) : super (key: key);

  @override
  State<DummyCommentScreen> createState() => _DummyCommentScreenState();
}

class _DummyCommentScreenState extends State<DummyCommentScreen> {


  String title = NewsRepository.instance.getTitle();
<<<<<<< HEAD
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
=======
  String publisher = NewsRepository.instance.getPublisher();
  String author = NewsRepository.instance.getAuthor();
  String url1 = NewsRepository.instance.getUrl();
>>>>>>> eab78cf13d271290eb618b5432cabb21df0a6976

  final fullnameController = TextEditingController();
  final provinsiController = TextEditingController();
  final emailController = TextEditingController();
<<<<<<< HEAD
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
=======
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    if(title ==""){
      FirebaseAuth.instance.currentUser?.reload();
      title = NewsRepository.instance.getTitle();
    }
>>>>>>> eab78cf13d271290eb618b5432cabb21df0a6976
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(CommentController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(LineAwesomeIcons.arrow_circle_left),),
<<<<<<< HEAD
        title: Text("News Detail", style: Theme.of(context).textTheme.headlineMedium,),
=======
        title: Text("News", style: Theme.of(context).textTheme.headlineMedium,),
>>>>>>> eab78cf13d271290eb618b5432cabb21df0a6976
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon),),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<List<CommentModel>>(
<<<<<<< HEAD
            future : controller.getAllCommentbasedOnIdNews(idNews),
            // future : controller.getAllComment(),
            builder: (context, snapshot){
              // done means data completly fetch
              print('Checkpoint Comment: ${snapshot.connectionState}');

              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
=======
            future : controller.getAllComment(),
            builder: (context, snapshot){
              // done means data completly fetch
              print('Checkpoint Comment1: ${snapshot.connectionState}');

              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  // UserModel userData = snapshot.data as UserModel;
                  // print('Check User data '+userData.email);
>>>>>>> eab78cf13d271290eb618b5432cabb21df0a6976
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
<<<<<<< HEAD
                              // title: Text("Title : ${snapshot.data![index].userNamePengguna}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Fetch Comment
                                  Text(snapshot.data![index].emailPengguna),
                                  Text(snapshot.data![index].komen),
                                  // Fetch News
=======
                              title: Text("Title : ${snapshot.data![index].userNamePengguna}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index].emailPengguna),
                                  Text(snapshot.data![index].komen),
>>>>>>> eab78cf13d271290eb618b5432cabb21df0a6976
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
<<<<<<< HEAD
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
=======
>>>>>>> eab78cf13d271290eb618b5432cabb21df0a6976
                            const SizedBox(height: 10,),

                            theButton(
                              text: 'Reload',
                              onTap: () async {
                                Get.to(()=>DummyNewsScreen());
                                FirebaseAuth.instance.currentUser?.reload();
<<<<<<< HEAD
                                controller2.getUserData(title);
=======
>>>>>>> eab78cf13d271290eb618b5432cabb21df0a6976
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

<<<<<<< HEAD
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
=======
>>>>>>> eab78cf13d271290eb618b5432cabb21df0a6976


                          ],
                        );
                      });

<<<<<<< HEAD
=======
                  // return Column(
                  //   children: [
                  //     Stack(
                  //       children: [
                  //         SizedBox(
                  //           width: 120,
                  //           height: 120,
                  //           child: ClipRRect(borderRadius : BorderRadius.circular(100),child: Image.network('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=400')),
                  //         ),
                  //         Positioned(
                  //           bottom: 0,
                  //           right: 0,
                  //           child: Container(
                  //             width: 35, height: 35,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(100),
                  //               color: Colors.yellow.withOpacity(0.1),
                  //             ),
                  //             child: const Icon(LineAwesomeIcons.camera, size : 20.0,color: Colors.black,),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //     const SizedBox(height: 10,),
                  //     Form(child: Column(
                  //       children: [
                  //         MyTextField(
                  //           controller: fullnameController,
                  //           hintText: userData.fullName,
                  //           obscureText: false,
                  //         ),
                  //         MyTextField(
                  //           controller: provinsiController,
                  //           hintText: userData.province,
                  //           obscureText: false,
                  //         ),
                  //         MyTextField(
                  //           controller: emailController,
                  //           hintText: userData.email,
                  //           obscureText: false,
                  //         ),
                  //         MyTextField(
                  //           controller: passwordController,
                  //           hintText: userData.password,
                  //           obscureText: false,
                  //         ),
                  //         const SizedBox(height: 30,),
                  //         SizedBox(width : double.infinity,
                  //           child: ElevatedButton(
                  //             onPressed: ()=> Get.to(()=>ManageUserScreen()),
                  //             child: const Text("Edit Profile",
                  //                 style: TextStyle(color: Colors.black))
                  //             , style: ElevatedButton.styleFrom(
                  //             backgroundColor: Colors.yellow, side: BorderSide.none,
                  //             shape: StadiumBorder(),),
                  //           ),
                  //         ),
                  //         const SizedBox(height: 10,),
                  //         Row(
                  //           children: [
                  //             Text.rich(
                  //               TextSpan(
                  //                 text: "Joined",
                  //                 style: TextStyle(fontSize: 12.0),
                  //                 children: [
                  //                   TextSpan(
                  //                     text: "1 Desember 2024",
                  //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),),
                  //   ],
                  // );
>>>>>>> eab78cf13d271290eb618b5432cabb21df0a6976
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