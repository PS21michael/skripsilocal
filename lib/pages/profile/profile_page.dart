import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/pages/components/custom_list_tile.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';
import '../../src/features/authentication/controller/profile_controller.dart';
import '../../src/features/authentication/models/user_model.dart';
import '../../src/repository/user_repository/user_repository.dart';
import '../components/button.dart';
import '../components/my_navbar.dart';
import 'core/fill_profile.dart';

class ProfilePage extends StatelessWidget {
  // const ProfilePage({super.key});
  const ProfilePage({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final updateController = Get.put(UpdateProfileController());
    String fullNameCustomer = UserRepository.instance.getUserModelFullName();
    String emailCustomer = UserRepository.instance.getUserModelEmail();
    String userNameCustomer = UserRepository.instance.getUserModelUserName();
    String provinceCustomer = UserRepository.instance.getUserModelProvince();
    String dateOfBirthCustomer = UserRepository.instance
        .getUserModelDateOfBirth();
    String profilePictureCustomer = UserRepository.instance
        .getUserModelProfilePicture();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          await Future.delayed(Duration(seconds: 5));
          updateController.reloadProfileData();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: ClipRRect(
                        child: Image(
                          image: NetworkImage(profilePictureCustomer==""?'assets/desktop-wallpaper-abstract-square-blue-aesthetic-square-thumbnail.jpg':profilePictureCustomer),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 20,
                      child: InkWell(
                        onTap: () async {
                          await controller.uploadProfilePicture();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            )
                          ),
                          child: Icon(
                            LineAwesomeIcons.camera,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Hi, ${userNameCustomer}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15),
                itemCard('Username', userNameCustomer, CupertinoIcons.person_alt_circle_fill),
                SizedBox(height: 20),
                itemCard('Nama Lengkap', fullNameCustomer, CupertinoIcons.person),
                SizedBox(height: 20),
                itemCard('Provinsi Tempat Tinggal', provinceCustomer, CupertinoIcons.home),
                SizedBox(height: 20),
                itemCard('Tanggal Lahir', dateOfBirthCustomer, CupertinoIcons.calendar),
                SizedBox(height: 20),
                theButton(
                  text: 'Edit Profile',
                    onTap: ()=> Get.to(()=>const FillProfile()),
                ),
                SizedBox(height: 10),
                const Divider(),
                SizedBox(height: 10),
                CustomListTile(
                  onTap: () {
                    AuthenticationRepository.instance.logout();
                  },
                  title: 'Log Out',
                  icon: LineAwesomeIcons.alternate_sign_out,
                ),
                SizedBox(height: 20),
                CustomListTile(
                  onTap: () {
                    // AuthenticationRepository.instance.logout();
                  },
                  title: 'Delete Acount',
                  icon: LineAwesomeIcons.times_circle,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MyNavBar(index: 3),
    );
  }
}

itemCard(String title, String subtitle, IconData){
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text (subtitle),
        leading: Icon(IconData),
      ),
    ),
  );
}

class UpdateProfileController extends GetxController {

  Future<void> reloadProfileData() async {
    final controller = Get.put(ProfileController());
    controller.getUserData();
    //Butuh logika untuk memperbarui data
    update();
  }
}
