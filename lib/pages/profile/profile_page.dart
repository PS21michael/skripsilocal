import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/controller/profile_controller.dart';
import 'package:skripsilocal/pages/components/custom_list_tile.dart';
import 'package:skripsilocal/pages/profile/update_profile.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import 'package:skripsilocal/pages/profile/InquiryNewsAdmin.dart';
import '../../controller/bookmark_controller.dart';
import '../../repository/bookmark_repository/bookmark_repository.dart';
import '../components/button.dart';
import '../components/my_navbar.dart';
import 'fill_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileController controller;
  late UpdateProfileController updateController;

  final bookMarkController = Get.put(BookmarkController());
  final userController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    controller = ProfileController();
    updateController = UpdateProfileController();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 5));
            await updateController.reloadProfileData();
            setState(() {});
          },
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 70),
              child: buildProfileSection(),
            ),
          ),
        ),
        bottomNavigationBar: const MyNavBar(index: 3),
      ),
    );
  }

  Widget buildProfileSection() {
    final fullNameCustomer = UserRepository.instance.getUserModelFullName();
    final userNameCustomer = UserRepository.instance.getUserModelUserName();
    final provinceCustomer = UserRepository.instance.getUserModelProvince();
    final dateOfBirthCustomer = UserRepository.instance.getUserModelDateOfBirth();
    final profilePictureCustomer = UserRepository.instance.getUserModelProfilePicture();
    final emailCustomer = UserRepository.instance.getUserModelEmail();
    final idCustomer = UserRepository.instance.getUserModelId();

    List<Widget> widgets = [
      Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: ClipRRect(
                  child: Image(
                    image: NetworkImage(
                      profilePictureCustomer == ""
                          ? 'assets/desktop-wallpaper-abstract-square-blue-aesthetic-square-thumbnail.jpg'
                          : profilePictureCustomer,
                    ),
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
                    updateController.reloadProfileData();
                    setState(() {});
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
                      ),
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
            'Hi, $userNameCustomer',
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UpdateProfile()),
            ).then((value) {}),
          ),
          SizedBox(height: 10),
          const Divider(),
          SizedBox(height: 10),
        ],
      ),
    ];

    if (emailCustomer == 'snackmaknyo@gmail.com') {
      widgets.add(
        CustomListTile(
          onTap: () {
            Get.to(()=> InquiryNews());
          },
          title: 'Inquiry News',
          textColor: Colors.black,
          icon: LineAwesomeIcons.upload,
          iconColor: Colors.black,
        ),
      );
      widgets.add(SizedBox(height: 5));
    }


    widgets.add(
      CustomListTile(
        onTap: () {
          AuthenticationRepository.instance.logout();
        },
        title: 'Log Out',
        textColor: Colors.red,
        icon: LineAwesomeIcons.alternate_sign_out,
        iconColor: Colors.red,
      ),
    );
    widgets.add(SizedBox(height: 5));

    widgets.add(
      CustomListTile(
        onTap: () async{
          // AUTH
          await Future.delayed(Duration(milliseconds: 100));
          userController.deleteUserAuth();

          // DB
          await Future.delayed(Duration(seconds: 1));
          String id = idCustomer;
          await Future.delayed(Duration(milliseconds: 300));
          userController.deleteUserDBByID(id);

          // BOOKMARK
          await Future.delayed(Duration(milliseconds: 500));
          bookMarkController.getAllBookmarkfromSingleUser(id);
          await Future.delayed(Duration(milliseconds: 1000));
          List<String> listIdBookmark = BookmarkRepository.instance.getListIdBookmarkFromSingelUser();
          await Future.delayed(Duration(milliseconds: 500));
          print("list bookmark yg ada di homepage: ${listIdBookmark.toString()}");
          for(int i=0; i<listIdBookmark.length; i++){
            await Future.delayed(Duration(milliseconds: 50));
            print("data ke ${i+1} dengan id ${listIdBookmark[i]} berhail di hapus");
            bookMarkController.deleteBookmark(listIdBookmark[i]);
          }

          await Future.delayed(Duration(seconds: 1));
          print("User Berhasil di delete");
          userController.logout();

        },
        textColor: Colors.red,
        title: 'Delete Account',
        icon: LineAwesomeIcons.times_circle,
        iconColor: Colors.red,
      ),
    );
    widgets.add(SizedBox(height: 5));

    return Column(
      children: widgets,
    );
  }

  Widget itemCard(String title, String subtitle, IconData iconData) {
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
          subtitle: Text(subtitle),
          leading: Icon(iconData),
        ),
      ),
    );
  }
}

class UpdateProfileController {
  Future<void> reloadProfileData() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();
      await UserRepository.instance.refreshUserData();
      print('Profile data reloaded successfully');
    } catch (e) {
      print('Error reloading profile data: $e');
    }
  }
}
