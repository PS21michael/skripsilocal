import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/profile/core/manage_user_screen.dart';
import 'package:skripsilocal/pages/profile/core/update_profile_screen.dart';
import 'package:skripsilocal/pages/profile/core/widget/profile_menu.dart';
import 'package:skripsilocal/src/features/authentication/controller/profile_controller.dart';

import '../../../src/features/authentication/models/user_model.dart';
import '../../../src/repository/authentication_repository/authentication_repository.dart';
import '../../components/button.dart';

class ProfileScreen extends StatelessWidget{

  const ProfileScreen ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    final controller = Get.put(ProfileController());

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(LineAwesomeIcons.arrow_circle_left),),
        title: Text("Profile", style: Theme.of(context).textTheme.headline4,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon),),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Obx(() {
                    var i;
                    print('Nilai i yang akan di print : ${i}');
                    // The method working but keep looping with no end
                    // if(i==0 || i=="" || i==null){
                    //   FirebaseAuth.instance.currentUser?.reload();
                    //   i="1";
                    //   FirebaseAuth.instance.currentUser?.reload();
                    // }
                    print('Nilai i yang akan di print setelahnya : ${i}');
                    controller.getUserData();
                    final networkImage = controller.getprofileUrl();

                    print('Gambar kosong : ${networkImage.isNotEmpty }');
                    print('Url gambarnya : ${controller.getprofileUrl()}');
                    final image = networkImage.isNotEmpty ? controller.getprofileUrl() : 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=400';
                    return
                      ClipRRect(

                        borderRadius : BorderRadius.circular(100),
                        child: Image.network(image)
                    );
                  }),
                  SizedBox(
                    width: 120,
                    height: 120,
                    // child:
                    // ClipRRect(
                    //     borderRadius : BorderRadius.circular(100),
                    //     child: Image.network('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=400')
                    // ),
                  ),
                  const SizedBox(height: 40,),
                  theButton(
                    text: 'Update Profile Picture',
                    onTap: () async {
                      await controller.uploadProfilePicture();
                      // Get.to(()=>ProfileScreen());
                    },
                  ),
                  theButton(
                    text: 'Reload',
                    onTap: (){
                      FirebaseAuth.instance.currentUser?.reload();
                      // Timer(const Duration(seconds: 15),() {
                      //   print("This code executes after 15 seconds");
                      Get.to(()=>UpdateProfileScreen());
                      Get.to(()=>ProfileScreen());
                      Get.to(()=>UpdateProfileScreen());
                      Get.to(()=>ProfileScreen());
                      // });

                      // controller.uploadProfilePicture();

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
                      child: const Icon(LineAwesomeIcons.alternate_pencil, size : 20.0,color: Colors.black,),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Text("Profile section", style: Theme.of(context).textTheme.headline4,),
              Text("SupportSystem@Mail.com", style: Theme.of(context).textTheme.bodyText2,),
              const SizedBox(height: 20,),
              SizedBox(width : 200,
                child: ElevatedButton(
                  onPressed: ()=> Get.to(()=>UpdateProfileScreen()),
                  child: const Text("Edit Profile",
                  style: TextStyle(color: Colors.black))
                , style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, side: BorderSide.none,
                  shape: StadiumBorder(),),
              ),
              ),
              const SizedBox(height: 30,),
              const Divider(),
              const SizedBox(height: 10,),

              // MENU
              ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog, onPress: (){}),
              ProfileMenuWidget(title: "Details Others", icon: LineAwesomeIcons.walking, onPress: (){}),
              ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check, onPress: ()=> Get.to(()=>ManageUserScreen())),
              const Divider(color: Colors.grey,),
              const SizedBox(height: 10,),
              ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info, onPress: (){}),
              ProfileMenuWidget(
                title: "Log Out",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: (){
                  AuthenticationRepository.instance.logout();
                },

              ),

            ],
          ),
        ),
      ),
    );
  }

}
