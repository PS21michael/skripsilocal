import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/Utils/Helper/TimeSavedNews.dart';
import 'package:skripsilocal/pages/XXX-dummyComment1.dart';
import 'package:skripsilocal/src/features/authentication/controller/comment_controller.dart';
import 'package:skripsilocal/src/features/authentication/controller/like_dislike_news_controller.dart';
import 'package:skripsilocal/src/features/authentication/controller/profile_controller.dart';
import 'package:skripsilocal/src/features/authentication/models/news_model.dart';
import 'package:skripsilocal/src/features/authentication/models/user_model.dart';
import 'package:skripsilocal/src/repository/like_dislike_repository/like_dislike_news_repository.dart';

import '../src/features/authentication/controller/news_controller.dart';
import '../src/features/authentication/models/comment_model.dart';
import '../src/repository/news_repository/news_repository.dart';
import 'components/button.dart';
import 'dummyComment.dart';


class DummyNewsScreen extends StatefulWidget{

  const DummyNewsScreen ({Key? key}) : super (key: key);

  @override
  State<DummyNewsScreen> createState() => _DummyNewsScreenState();
}

class _DummyNewsScreenState extends State<DummyNewsScreen> {

  String idBer="";

  @override
  Widget build(BuildContext context){
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(NewsController());
    final controller1 = Get.put(CommentController());
    List<CommentModel>? test = controller1.getAllDataList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(LineAwesomeIcons.arrow_circle_left),),
        title: Text("News", style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon),),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<List<NewsModel>>(
            future : controller.getAllNews(),
            builder: (context, snapshot){
              // done means data completly fetch
              print('Checkpoint News: ${snapshot.connectionState}');
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
                                  Text(snapshot.data![index].category),
                                  Text(snapshot.data![index].publisher),
                                  Text("ID : ${snapshot.data![index].id!}"),
                                  Text("LIKE : ${snapshot.data![index].like}"),
                                  Text("DISLIKE : ${snapshot.data![index].dislike}"),
                                  SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: ClipRRect(borderRadius : BorderRadius.circular(100),child: Image.network(snapshot.data![index].urlImage)),
                                  ),
                                  theButton(
                                    text: 'Comment',
                                    onTap: () async {
                                      controller.getUserData(snapshot.data![index].title!);

                                      controller.getSingleNewsDetail(snapshot.data![index].title!);
                                      Get.to(()=>DummyNewsScreen());
                                      FirebaseAuth.instance.currentUser?.reload();
                                      controller.getSingleNewsDetail(snapshot.data![index].title!);
                                      print("Title yg udah di assign : {}"+ controller.getTitle());
                                      Get.to(()=>DummyCommentScreen());
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