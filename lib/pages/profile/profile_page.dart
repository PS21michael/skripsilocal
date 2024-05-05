import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/controller/history_controller.dart';
import 'package:skripsilocal/controller/profile_controller.dart';
import 'package:skripsilocal/controller/recommendation_controller.dart';
import 'package:skripsilocal/pages/components/custom_list_tile.dart';
import 'package:skripsilocal/pages/profile/show_user.dart';
import 'package:skripsilocal/pages/profile/updateCategory.dart';
import 'package:skripsilocal/pages/profile/update_profile.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:skripsilocal/repository/rating_repository/rating_repository.dart';
import 'package:skripsilocal/repository/recommendation_repository/recommendation_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import 'package:skripsilocal/pages/profile/InquiryNewsAdmin.dart';
import '../../controller/bookmark_controller.dart';
import '../../controller/rating_controller.dart';
import '../../repository/bookmark_repository/bookmark_repository.dart';
import '../components/button.dart';
import '../components/my_navbar.dart';
import '../components/snackbar_utils.dart';

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
  final historyController = Get.put(HistoryController());
  final ratingController = Get.put(RatingController());
  final recommendController = Get.put(RecommendationController());

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
            await Future.delayed(const Duration(seconds: 5));
            await updateController.reloadProfileData();
            setState(() {});
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 70),
              child: buildProfileSection(),
            ),
          ),
        ),
        bottomNavigationBar: const MyNavBar(initialIndex: 3),
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
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: NetworkImage(
                      profilePictureCustomer == ""
                          ? 'assets/desktop-wallpaper-abstract-square-blue-aesthetic-square-thumbnail.jpg'
                          : profilePictureCustomer,
                    ),
                  ),
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
                    child: const Icon(
                      LineAwesomeIcons.camera,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Hi, $userNameCustomer',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          itemCard('Username', userNameCustomer, CupertinoIcons.person_alt_circle_fill),
          const SizedBox(height: 20),
          itemCard('Fullname', fullNameCustomer, CupertinoIcons.person),
          const SizedBox(height: 20),
          itemCard('Province of residence', provinceCustomer, CupertinoIcons.home),
          const SizedBox(height: 20),
          itemCard('Date of birth', dateOfBirthCustomer, CupertinoIcons.calendar),
          const SizedBox(height: 20),
          TheButton(
            text: 'Edit Profile',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UpdateProfile()),
            ).then((value) {}),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
        ],
      ),
    ];

      widgets.add(
        CustomListTile(
          onTap: () {
            Get.to(()=> const UpdateCategory());
          },
          title: 'Update Favorite Category',
          textColor: Colors.black,
          icon: LineAwesomeIcons.edit,
          iconColor: Colors.black,
        ),
      );
      widgets.add(const SizedBox(height: 5));

    if (emailCustomer == 'snackmaknyo@gmail.com' || emailCustomer == 'jardaniserpi@gmail.com') {
      widgets.add(
        CustomListTile(
          onTap: () {
            Get.to(()=> const InquiryNews());
          },
          title: 'Inquiry News',
          textColor: Colors.black,
          icon: LineAwesomeIcons.upload,
          iconColor: Colors.black,
        ),
      );
      widgets.add(const SizedBox(height: 5));
    }

    if (emailCustomer == 'snackmaknyo@gmail.com' || emailCustomer == 'jardaniserpi@gmail.com') {
      widgets.add(
        CustomListTile(
          onTap: () {
            Get.to(()=> const ShowUser());
          },
          title: 'List Registered User',
          textColor: Colors.black,
          icon: CupertinoIcons.person_2_fill,
          iconColor: Colors.black,
        ),
      );
      widgets.add(const SizedBox(height: 5));
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
    widgets.add(const SizedBox(height: 5));

    widgets.add(
      CustomListTile(
        onTap: () async{
          final providerData = FirebaseAuth.instance.currentUser?.providerData.first;
          if(GoogleAuthProvider().providerId == providerData?.providerId){

            // AUTH
            await Future.delayed(const Duration(milliseconds: 1000));
            await Future.delayed(const Duration(milliseconds: 100));
            userController.deleteUserAuthGoogle();

            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );

            // DB
            await Future.delayed(const Duration(seconds: 1));
            String id = idCustomer;
            await Future.delayed(const Duration(milliseconds: 300));
            userController.deleteUserDBByID(id);

            // BOOKMARK
            await Future.delayed(const Duration(milliseconds: 500));
            bookMarkController.getAllBookmarkfromSingleUser(id);
            await Future.delayed(const Duration(milliseconds: 1000));
            List<String> listIdBookmark = BookmarkRepository.instance.getListIdBookmarkFromSingelUser();
            await Future.delayed(const Duration(milliseconds: 500));
            for(int i=0; i<listIdBookmark.length; i++){
              await Future.delayed(const Duration(milliseconds: 50));
              bookMarkController.deleteBookmark(listIdBookmark[i]);
            }


            // HISTORY
            await Future.delayed(const Duration(milliseconds: 500));
            historyController.getAllHistoryFromSingleUser(id);
            await Future.delayed(const Duration(milliseconds: 800));
            List<String> listIdHistory = HistoryRepository.instance.getListIdHistoryFromSingelUser();
            await Future.delayed(const Duration(milliseconds: 500));
            for(int i=0; i<listIdHistory.length; i++){
              await Future.delayed(const Duration(milliseconds: 50));
              historyController.deleteHistory(listIdHistory[i]);
            }


            // RATING
            await Future.delayed(const Duration(milliseconds: 500));
            ratingController.getAllRatingOnlyUserTarget(id);
            await Future.delayed(const Duration(milliseconds: 1500));
            List<String> listIdRating = [];
            listIdRating = RatingRepository.instance.getListIdRatingFromSingelUserId();
            await Future.delayed(const Duration(milliseconds: 500));
            for(int i=0; i<listIdRating.length; i++){
              await Future.delayed(const Duration(milliseconds: 50));
              ratingController.deleteRating(listIdRating[i]);
            }


            // RECOMMEND
            await Future.delayed(const Duration(milliseconds: 500));
            recommendController.getAllRecommendationFromUserTarget(id);
            await Future.delayed(const Duration(milliseconds: 1500));
            List<String> listIdRecommend = [];
            listIdRecommend = RecommendationRepository.instance.getListIdRecommendFromSingelUserId();
            await Future.delayed(const Duration(milliseconds: 500));
            for(int i=0; i<listIdRecommend.length; i++){
              await Future.delayed(const Duration(milliseconds: 50));
              recommendController.deleteRecommendation(listIdRecommend[i]);

            }

            await Future.delayed(const Duration(seconds: 1));
            Navigator.pop(context);
            await Future.delayed(const Duration(milliseconds: 300));
            Navigator.pop(context);
            showCustomSnackbar("Success", "Account successfully deleted!", isError: false);
            userController.logout();
            exit(0);
          } else{
            TextEditingController passwordController = TextEditingController();

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Delete Account Confirmation',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'By refilling your password, your Baca Berita account will be deleted',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Input your password ....'
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final providerData = FirebaseAuth.instance.currentUser?.providerData.first;
                        String password = passwordController.text;
                        if(EmailAuthProvider.PROVIDER_ID == providerData?.providerId){
                          if(password != ""){
                            // AUTH
                            await Future.delayed(const Duration(milliseconds: 1000));
                            await Future.delayed(const Duration(milliseconds: 100));
                            userController.deleteUserAuth(password);

                            String flagHapusAuth = "";
                            await Future.delayed(const Duration(milliseconds: 800));
                            await Future.delayed(const Duration(milliseconds: 100));
                            flagHapusAuth = AuthenticationRepository.instance.getFlagAuthDelete();


                            showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );

                            if(flagHapusAuth == "TRUE"){
                              // DB
                              await Future.delayed(const Duration(seconds: 1));
                              String id = idCustomer;
                              await Future.delayed(const Duration(milliseconds: 300));
                              userController.deleteUserDBByID(id);

                              // BOOKMARK
                              await Future.delayed(const Duration(milliseconds: 500));
                              bookMarkController.getAllBookmarkfromSingleUser(id);
                              await Future.delayed(const Duration(milliseconds: 1000));
                              List<String> listIdBookmark = BookmarkRepository.instance.getListIdBookmarkFromSingelUser();
                              await Future.delayed(const Duration(milliseconds: 500));
                              for(int i=0; i<listIdBookmark.length; i++){
                                await Future.delayed(const Duration(milliseconds: 50));
                                bookMarkController.deleteBookmark(listIdBookmark[i]);
                              }


                              // HISTORY
                              await Future.delayed(const Duration(milliseconds: 500));
                              historyController.getAllHistoryFromSingleUser(id);
                              await Future.delayed(const Duration(milliseconds: 800));
                              List<String> listIdHistory = HistoryRepository.instance.getListIdHistoryFromSingelUser();
                              await Future.delayed(const Duration(milliseconds: 500));
                              for(int i=0; i<listIdHistory.length; i++){
                                await Future.delayed(const Duration(milliseconds: 50));
                                historyController.deleteHistory(listIdHistory[i]);
                              }


                              // RATING
                              await Future.delayed(const Duration(milliseconds: 500));
                              ratingController.getAllRatingOnlyUserTarget(id);
                              await Future.delayed(const Duration(milliseconds: 1500));
                              List<String> listIdRating = [];
                              listIdRating = RatingRepository.instance.getListIdRatingFromSingelUserId();
                              await Future.delayed(const Duration(milliseconds: 500));
                              for(int i=0; i<listIdRating.length; i++){
                                await Future.delayed(const Duration(milliseconds: 50));
                                ratingController.deleteRating(listIdRating[i]);
                              }


                              // RECOMMEND
                              await Future.delayed(const Duration(milliseconds: 500));
                              recommendController.getAllRecommendationFromUserTarget(id);
                              await Future.delayed(const Duration(milliseconds: 1500));
                              List<String> listIdRecommend = [];
                              listIdRecommend = RecommendationRepository.instance.getListIdRecommendFromSingelUserId();
                              await Future.delayed(const Duration(milliseconds: 500));
                              for(int i=0; i<listIdRecommend.length; i++){
                                await Future.delayed(const Duration(milliseconds: 50));
                                recommendController.deleteRecommendation(listIdRecommend[i]);

                              }

                              await Future.delayed(const Duration(seconds: 1));
                              Navigator.pop(context);
                              await Future.delayed(const Duration(milliseconds: 300));
                              showCustomSnackbar("Success", "Account successfully deleted!", isError: false);
                              userController.logout();

                            } else {
                              Navigator.pop(context);
                              showCustomSnackbar("Error", "Wrong password!", isError: true);
                            }

                          } else {
                            // Navigator.pop(context);
                            showCustomSnackbar("Error", "Please provide your password!!", isError: true);
                          }
                        }
                        // print('User password: $password');
                        // Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );

          }
        },
        textColor: Colors.red,
        title: 'Delete Account',
        icon: LineAwesomeIcons.times_circle,
        iconColor: Colors.red,
      ),
    );
    widgets.add(const SizedBox(height: 5));

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

void showCustomSnackbar(String title, String message, {bool isError = true}) {
  SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
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