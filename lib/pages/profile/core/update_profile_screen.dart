import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/pages/profile/core/profile_creen.dart';
import 'package:skripsilocal/pages/profile/core/update_profile_new.dart';
import 'package:skripsilocal/pages/profile/profile_page.dart';
import 'package:skripsilocal/src/features/authentication/controller/profile_controller.dart';
import 'package:skripsilocal/src/features/authentication/models/user_model.dart';

import '../../components/button.dart';
import '../../components/my_textfield.dart';

class UpdateProfile extends StatefulWidget{

  const UpdateProfile ({Key? key}) : super (key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfile> {

  var ctr = 0;
  var tempString = "";

  final fullnameController = TextEditingController();
  final provinsiController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    var localtime = DateTime.timestamp();
    print('Waktu sekarang : $localtime');
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(LineAwesomeIcons.arrow_circle_left),),
        title: Text("Edit Profile", style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon),),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
            future : controller.getUserData(),
            builder: (context, snapshot){
              // done means data completly fetch
              print('Checkpoint 2: ${snapshot.connectionState}');

              if(snapshot.connectionState == ConnectionState.done){
                print('Pemanggilan ke ${ctr+=1}');
                if(snapshot.hasData){
                  UserModel userData = snapshot.data as UserModel;
                  tempString = userData.email;
                  final email = TextEditingController(text: userData.email);
                  final password = TextEditingController(text: userData.password);
                  final fullName = TextEditingController(text: userData.fullName);
                  final province = TextEditingController(text: userData.province);
                  final dateOfBirth = TextEditingController(text: userData.dateOfBirth);
                  final userName = TextEditingController(text: userData.userName);

                  print('Check User data ${userData.email}');
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(borderRadius : BorderRadius.circular(100),child: Image.network(userData.profilePicture)),
                          ),
                          const SizedBox(height: 40,),
                          theButton(
                            text: 'Update Profile Picture',
                            onTap: () async {
                              await controller.uploadProfilePicture();
                              Timer(const Duration(seconds: 5),() {
                                print("This code executes after 15 seconds");
                                // Get.to(()=>const ProfileScreen());
                                Get.to(()=>const ProfilePage());
                              });

                              // Get.to(()=>ProfileScreen());
                            },
                          ),

                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35, height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.yellow.withOpacity(0.1),
                              ),
                              child: const Icon(LineAwesomeIcons.camera, size : 20.0,color: Colors.black,),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Form(child: Column(
                        children: [
                          MyTextField(
                            controller: fullnameController,
                            hintText: userData.fullName,
                            obscureText: false,
                          ),
                          MyTextField(
                            controller: provinsiController,
                            hintText: userData.province,
                            obscureText: false,
                          ),
                          MyTextField(
                            controller: emailController,
                            hintText: userData.email,
                            obscureText: false,
                          ),
                          MyTextField(
                            controller: passwordController,
                            hintText: userData.password,
                            obscureText: false,
                          ),
                          const SizedBox(height: 30,),

                          SizedBox(width : double.infinity,
                            child: ElevatedButton(
                              onPressed: ()=> Get.to(()=>const UpdateProfile_New()), style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow, side: BorderSide.none,
                              shape: const StadiumBorder(),),
                              child: const Text("Edit Profile",
                                  style: TextStyle(color: Colors.black))
                              ,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          theButton(
                            text: 'Back',
                            onTap: (){
                              // controller.updateRecord(user);
                              Get.to(()=>const ProfilePage());
                              // if(_formkey.currentState!.validate()){
                              // print("Password given page level: ${controller.email.text.trim()}");
                              // print("Email given page level: ${controller.password.text.trim()}");
                              // SignInController.instance.loginUser(controller.email.text.trim(), controller.password.text.trim());
                              // SignInController.instance.googleSignIn();

                              // }
                            },
                          ),
                          const SizedBox(height: 20),

                          const Row(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: "Joined",
                                  style: TextStyle(fontSize: 12.0),
                                  children: [
                                    TextSpan(
                                      text: "1 Desember 2024",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),),
                    ],
                  );
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
              print('CheckPoint 456');
            },

          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:skripsilocal/pages/profile/core/widget/profile_menu.dart';
// import 'package:skripsilocal/src/features/authentication/controller/profile_controller.dart';
// import 'package:skripsilocal/src/features/authentication/models/user_model.dart';
//
// import '../../components/my_textfield.dart';
//
// class UpdateProfileScreen extends StatefulWidget{
//
//   const UpdateProfileScreen ({Key? key}) : super (key: key);
//
//   @override
//   State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
// }
//
// class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
//
//   var ctr = 0;
//
//   final fullnameController = TextEditingController();
//   final provinsiController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context){
//     var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     final controller = Get.put(ProfileController());
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(LineAwesomeIcons.arrow_circle_left),),
//         title: Text("Edit Profile", style: Theme.of(context).textTheme.headline4,),
//         actions: [
//           IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon),),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20.0),
//           child: FutureBuilder(
//             future : controller.getUserData(),
//             builder: (context, snapshot){
//               // done means data completly fetch
//               print('Checkpoint 2: '+ snapshot.connectionState.toString());
//
//               if(snapshot.connectionState == ConnectionState.done){
//                 print('Pemanggilan ke ${ctr+=1}');
//                 if(snapshot.hasData){
//                   UserModel userData = snapshot.data as UserModel;
//
//                   final email = TextEditingController(text: userData.email);
//                   final password = TextEditingController(text: userData.password);
//                   final fullName = TextEditingController(text: userData.fullName);
//                   final province = TextEditingController(text: userData.province);
//                   final dateOfBirth = TextEditingController(text: userData.dateOfBirth);
//                   final userName = TextEditingController(text: userData.userName);
//
//                   print('Check User data '+userData.email);
//                   return Column(
//                     children: [
//                       Stack(
//                         children: [
//                           SizedBox(
//                             width: 120,
//                             height: 120,
//                             child: ClipRRect(borderRadius : BorderRadius.circular(100),child: Image.network('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=400')),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             right: 0,
//                             child: Container(
//                               width: 35, height: 35,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(100),
//                                 color: Colors.yellow.withOpacity(0.1),
//                               ),
//                               child: const Icon(LineAwesomeIcons.camera, size : 20.0,color: Colors.black,),
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 10,),
//                       Form(child: Column(
//                         children: [
//                           MyTextField(
//                             controller: fullnameController,
//                             hintText: userData.fullName,
//                             obscureText: false,
//                           ),
//                           MyTextField(
//                             controller: provinsiController,
//                             hintText: userData.province,
//                             obscureText: false,
//                           ),
//                           MyTextField(
//                             controller: emailController,
//                             hintText: userData.email,
//                             obscureText: false,
//                           ),
//                           MyTextField(
//                             controller: passwordController,
//                             hintText: userData.password,
//                             obscureText: false,
//                           ),
//                           const SizedBox(height: 30,),
//
//                           SizedBox(width : double.infinity,
//                             child: ElevatedButton(
//                               onPressed: ()=> Get.to(()=>UpdateProfileScreen()),
//                               // onPressed: () async {
//                               //   final userData = UserModel(
//                               //       fullName: fullName.text.trim(),
//                               //       email: email.text.trim(),
//                               //       userName: userName.text.trim(),
//                               //       province: province.text.trim(),
//                               //       dateOfBirth: dateOfBirth.text.trim(),
//                               //       password: password.text.trim()
//                               //   );
//                               //
//                               //   await controller.updateRecord(userData);
//                               //
//                               // },
//                               child: const Text("Edit Profile",
//                                   style: TextStyle(color: Colors.black))
//                               , style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.yellow, side: BorderSide.none,
//                               shape: StadiumBorder(),),
//                             ),
//                           ),
//                           const SizedBox(height: 10,),
//                           Row(
//                             children: [
//                               Text.rich(
//                                 TextSpan(
//                                   text: "Joined",
//                                   style: TextStyle(fontSize: 12.0),
//                                   children: [
//                                     TextSpan(
//                                       text: "1 Desember 2024",
//                                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),),
//                     ],
//                   );
//                 } else if(snapshot.hasError){
//                   return Center(
//                     child: Text(snapshot.error.toString()),
//                   );
//                 } else{
//                   return const Center(child: Text("Something Went Wrong"),);
//                 }
//               } else{
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               };
//               print('CheckPoint 456');
//             },
//
//           ),
//         ),
//       ),
//     );
//   }
// }