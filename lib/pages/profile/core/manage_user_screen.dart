import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/pages/profile/core/widget/profile_menu.dart';
import 'package:skripsilocal/src/features/authentication/controller/profile_controller.dart';
import 'package:skripsilocal/src/features/authentication/models/user_model.dart';

import '../../components/my_textfield.dart';

class ManageUserScreen extends StatefulWidget{

  const ManageUserScreen ({Key? key}) : super (key: key);

  @override
  State<ManageUserScreen> createState() => _ManageUserScreenState();
}

class _ManageUserScreenState extends State<ManageUserScreen> {

  final fullnameController = TextEditingController();
  final provinsiController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(LineAwesomeIcons.arrow_circle_left),),
        title: Text("Edit Profile", style: Theme.of(context).textTheme.headline4,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon),),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<List<UserModel>>(
            future : controller.getAllUser(),
            builder: (context, snapshot){
              // done means data completly fetch
              print('Checkpoint 2: '+ snapshot.connectionState.toString());

              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  // UserModel userData = snapshot.data as UserModel;
                  // print('Check User data '+userData.email);
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
                            title: Text("Name : ${snapshot.data![index].fullName}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].province),
                                Text(snapshot.data![index].email),
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: ClipRRect(borderRadius : BorderRadius.circular(100),child: Image.network(snapshot.data![index].profilePicture)),
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
                        ],
                      );
                      });
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
                } else if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else{
                  return const Center(child: Text("Something Went Wrong"),);
                }
              } else{
                return Center(
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