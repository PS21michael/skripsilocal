import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/Utils/Helper/TimeSavedNews.dart';
import 'package:skripsilocal/pages/dummyComment1.dart';
import 'package:skripsilocal/src/features/authentication/controller/bookmark_controller.dart';
import 'package:skripsilocal/src/features/authentication/controller/comment_controller.dart';
import 'package:skripsilocal/src/features/authentication/controller/like_dislike_news_controller.dart';
import 'package:skripsilocal/src/features/authentication/controller/profile_controller.dart';
import 'package:skripsilocal/src/features/authentication/models/bookmark_model.dart';
import 'package:skripsilocal/src/features/authentication/models/news_model.dart';
import 'package:skripsilocal/src/features/authentication/models/user_model.dart';
import 'package:skripsilocal/src/repository/like_dislike_repository/like_dislike_news_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../pages/components/button.dart';


class DummyBookmarkScreen extends StatefulWidget{

  const DummyBookmarkScreen ({Key? key}) : super (key: key);

  @override
  State<DummyBookmarkScreen> createState() => _DummyBookmarkScreen();
}

class _DummyBookmarkScreen extends State<DummyBookmarkScreen> {

  @override
  Widget build(BuildContext context){
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(BookmarkController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(LineAwesomeIcons.arrow_circle_left),),
        title: Text("BookMark", style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon),),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<List<BookmarkModel>>(
            future : controller.getAllBookmark(),
            builder: (context, snapshot){
              // done means data completly fetch
              print('Checkpoint BookMark: ${snapshot.connectionState}');
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
                              title: Text("Title : ${snapshot.data![index].title}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("ID News: ${snapshot.data![index].idNews!}"),
                                  Text("ID Pengguna: ${snapshot.data![index].idPengguna!}"),
                                  Text("Title : ${snapshot.data![index].title}"),
                                  Text("Url News : ${snapshot.data![index].urlData}"),
                                  Text("Url Gambar : ${snapshot.data![index].urlGambar}"),
                                  SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: ClipRRect(borderRadius : BorderRadius.circular(100),child: Image.network(snapshot.data![index].urlGambar)),
                                  ),
                                  theButton(
                                    text: 'Launch',
                                    onTap: () async {
                                      // const url = 'https://www.geeksforgeeks.org/';
                                      String url = snapshot.data![index].urlData;
                                      if (await canLaunch(url)) {
                                        await launch(url, forceWebView: true, enableJavaScript: true);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                      // Get.to(()=>ProfileScreen());
                                    },
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            // theButton(
                            //   text: 'Comment',
                            //   onTap: () async {
                            //     controller.getUserData(snapshot.data![index].title!);
                            //
                            //     Get.to(()=>DummyNewsScreen());
                            //     FirebaseAuth.instance.currentUser?.reload();
                            //     Get.to(()=>DummyCommentScreen());
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