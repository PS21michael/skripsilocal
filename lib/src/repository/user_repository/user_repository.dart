import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import '../../features/authentication/models/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  var ctr =0;

  String userModelID = "";
  String userModelFullName = "";
  String userModelEmail = "";
  String userModelUserName = "";
  String userModelProvince = "";
  String userModelDateOfBirth = "";
  String userModelPassword = "";
  String userModelJoinDate = "";
  String userModelProfilePicture = "";

  String isSuccesGetData = "False";

  List<int> listScore = [0];

  // ADDING
  String kategori1="";
  int scoreKategori1=0;
  String kategori2="";
  int scoreKategori2=0;
  String kategori3="";
  int scoreKategori3=0;
  String kategori4="";
  int scoreKategori4=0;
  String kategori5="";
  int scoreKategori5=0;
  String kategori6="";
  int scoreKategori6=0;
  String kategori7="";
  int scoreKategori7=0;
  String kategori8="";
  int scoreKategori8=0;
  String kategori9="";
  int scoreKategori9=0;
  String kategori10="";
  int scoreKategori10=0;
  String kategori11="";
  int scoreKategori11=0;
  String kategori12="";
  int scoreKategori12=0;
  String kategori13="";
  int scoreKategori13=0;
  String kategori14="";
  int scoreKategori14=0;
  String kategori15="";
  int scoreKategori15=0;
  String kategori16="";
  int scoreKategori16=0;
  String kategori17="";
  int scoreKategori17=0;
  String kategori18="";
  int scoreKategori18=0;
  String kategori19="";
  int scoreKategori19=0;
  String kategori20="";
  int scoreKategori20=0;
  String kategori21="";
  int scoreKategori21=0;
  String kategori22="";
  int scoreKategori22=0;
  String kategori23="";
  int scoreKategori23=0;
  String kategori24="";
  int scoreKategori24=0;
  String kategori25="";
  int scoreKategori25=0;
  String kategori26="";
  int scoreKategori26=0;
  String kategori27="";
  int scoreKategori27=0;
  String kategori28="";
  int scoreKategori28=0;
  String kategori29="";
  int scoreKategori29=0;
  String kategori30="";
  int scoreKategori30=0;
  String kategori31="";
  int scoreKategori31=0;
  String kategori32="";
  int scoreKategori32=0;
  String kategori33="";
  int scoreKategori33=0;
  String kategori34="";
  int scoreKategori34=0;
  String kategori35="";
  int scoreKategori35=0;
  String kategori36="";
  int scoreKategori36=0;
  String kategori37="";
  int scoreKategori37=0;
  String kategori38="";
  int scoreKategori38=0;


  final _db = FirebaseFirestore.instance;

  createUer(UserModel user) async {
    await _db.collection("/Users").add(user.toJson()).whenComplete(
          () => Get.snackbar("Success", "Your Account Has been created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green),
    ).catchError((error, stackTrice){
      print(error.toString());
      Get.snackbar("Error", "Something went wrong, try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
    print('User Berhasil dibuat');
  }


  Future<UserModel> getSingelUserDetails(String email) async{
    print('CheckPoint login 2');
    print('DB telah dipanggil ke ${ctr+=1}');
    final snapshot = await _db.collection("/Users").where("Email", isEqualTo: email).get();
    print('CheckPoint login 3');
    // final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).elementAt(0);
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    print('CheckPoint login 4');

    // Setter Data from snapshot
    userModelID = userData.id!;
    userModelFullName = userData.fullName;
    userModelEmail = userData.email;
    userModelUserName = userData.userName;
    userModelProvince = userData.province;
    userModelDateOfBirth = userData.dateOfBirth;
    userModelPassword = userData.password;
    userModelJoinDate = userData.joinDate;
    userModelProfilePicture = userData.profilePicture;

    // ADDING
    kategori1 = userData.kategori1;
    scoreKategori1 = userData.scoreKategori1;
    kategori2 = userData.kategori2;
    scoreKategori2 = userData.scoreKategori2;
    kategori3 = userData.kategori3;
    scoreKategori3 = userData.scoreKategori3;
    kategori4 = userData.kategori4;
    scoreKategori4 = userData.scoreKategori4;
    kategori5 = userData.kategori5;
    scoreKategori5 = userData.scoreKategori5;
    kategori6 = userData.kategori6;
    scoreKategori6 = userData.scoreKategori6;
    kategori7 = userData.kategori7;
    scoreKategori7 = userData.scoreKategori7;
    kategori8 = userData.kategori8;
    scoreKategori8 = userData.scoreKategori8;
    kategori9 = userData.kategori9;
    scoreKategori9 = userData.scoreKategori9;
    kategori10 = userData.kategori10;
    scoreKategori10 = userData.scoreKategori10;
    kategori11 = userData.kategori11;
    scoreKategori11 = userData.scoreKategori11;
    kategori12 = userData.kategori12;
    scoreKategori12 = userData.scoreKategori12;
    kategori13 = userData.kategori13;
    scoreKategori13 = userData.scoreKategori13;
    kategori14 = userData.kategori14;
    scoreKategori14 = userData.scoreKategori14;
    kategori15 = userData.kategori15;
    scoreKategori15 = userData.scoreKategori15;
    kategori16 = userData.kategori16;
    scoreKategori16 = userData.scoreKategori16;
    kategori17 = userData.kategori17;
    scoreKategori17 = userData.scoreKategori17;
    kategori18 = userData.kategori18;
    scoreKategori18 = userData.scoreKategori18;
    kategori19 = userData.kategori19;
    scoreKategori19 = userData.scoreKategori19;
    kategori20 = userData.kategori20;
    scoreKategori20 = userData.scoreKategori20;
    kategori21 = userData.kategori21;
    scoreKategori21 = userData.scoreKategori21;
    kategori22 = userData.kategori22;
    scoreKategori22 = userData.scoreKategori22;
    kategori23 = userData.kategori23;
    scoreKategori23 = userData.scoreKategori23;
    kategori24 = userData.kategori24;
    scoreKategori24 = userData.scoreKategori24;
    kategori25 = userData.kategori25;
    scoreKategori25 = userData.scoreKategori25;
    kategori26 = userData.kategori26;
    scoreKategori26 = userData.scoreKategori26;
    kategori27 = userData.kategori27;
    scoreKategori27 = userData.scoreKategori27;
    kategori28 = userData.kategori28;
    scoreKategori28 = userData.scoreKategori28;
    kategori29 = userData.kategori29;
    scoreKategori29 = userData.scoreKategori29;
    kategori30 = userData.kategori30;
    scoreKategori30 = userData.scoreKategori30;
    kategori31 = userData.kategori31;
    scoreKategori31 = userData.scoreKategori31;
    kategori32 = userData.kategori32;
    scoreKategori32 = userData.scoreKategori32;
    kategori33 = userData.kategori33;
    scoreKategori33 = userData.scoreKategori33;
    kategori34 = userData.kategori34;
    scoreKategori34 = userData.scoreKategori34;
    kategori35 = userData.kategori35;
    scoreKategori35 = userData.scoreKategori35;
    kategori36 = userData.kategori36;
    scoreKategori36 = userData.scoreKategori36;
    kategori37 = userData.kategori37;
    scoreKategori37 = userData.scoreKategori37;
    kategori38 = userData.kategori38;
    scoreKategori38 = userData.scoreKategori38;

    listScore.add(scoreKategori1);
    listScore.add(scoreKategori2);
    listScore.add(scoreKategori3);
    listScore.add(scoreKategori4);
    listScore.add(scoreKategori5);
    listScore.add(scoreKategori6);
    listScore.add(scoreKategori7);
    listScore.add(scoreKategori8);
    listScore.add(scoreKategori9);
    listScore.add(scoreKategori10);
    listScore.add(scoreKategori11);
    listScore.add(scoreKategori12);
    listScore.add(scoreKategori13);
    listScore.add(scoreKategori14);
    listScore.add(scoreKategori15);
    listScore.add(scoreKategori16);
    listScore.add(scoreKategori17);
    listScore.add(scoreKategori18);
    listScore.add(scoreKategori19);
    listScore.add(scoreKategori20);
    listScore.add(scoreKategori21);
    listScore.add(scoreKategori22);
    listScore.add(scoreKategori23);
    listScore.add(scoreKategori24);
    listScore.add(scoreKategori25);
    listScore.add(scoreKategori26);
    listScore.add(scoreKategori27);
    listScore.add(scoreKategori28);
    listScore.add(scoreKategori29);
    listScore.add(scoreKategori30);
    listScore.add(scoreKategori31);
    listScore.add(scoreKategori32);
    listScore.add(scoreKategori33);
    listScore.add(scoreKategori34);
    listScore.add(scoreKategori35);
    listScore.add(scoreKategori36);
    listScore.add(scoreKategori37);
    listScore.add(scoreKategori38);
    // listScore.sort();

    isSuccesGetData = "True";
    print('Data profil url udah di assign');
    return userData;
  }

  Future<List<UserModel>> getAllUserDetails() async{
    final snapshot = await _db.collection("/Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  String getUserModelId(){
    return userModelID;
  }
  String getUserModelFullName(){
    return userModelFullName;
  }
  String getUserModelEmail(){
    return userModelEmail;
  }
  String getUserModelUserName(){
    return userModelUserName;
  }
  String getUserModelProvince(){
    return userModelProvince;
  }
  String getUserModelDateOfBirth(){
    return userModelDateOfBirth;
  }
  String getUserModelPassword(){
    return userModelPassword;
  }
  String getUserModelJoinDate(){
    return userModelJoinDate;
  }
  String getUserModelProfilePicture(){
    return userModelProfilePicture;
  }
  String getIsSuccessGetData(){
    return isSuccesGetData;
  }

  List<int> getListScore(){
    return listScore;
  }

  void resetListScore(){
    listScore.clear();
  }

// ADDING
  String getKategori1(){
    return kategori1;
  }
  int getScoreKategori1(){
    return scoreKategori1;
  }

  String getKategori2(){
    return kategori2;
  }
  int getScoreKategori2(){
    return scoreKategori2;
  }

  String getKategori3(){
    return kategori3;
  }
  int getScoreKategori3(){
    return scoreKategori3;
  }

  String getKategori4(){
    return kategori4;
  }
  int getScoreKategori4(){
    return scoreKategori4;
  }

  String getKategori5(){
    return kategori5;
  }
  int getScoreKategori5(){
    return scoreKategori5;
  }

  String getKategori6(){
    return kategori6;
  }
  int getScoreKategori6(){
    return scoreKategori6;
  }

  String getKategori7(){
    return kategori7;
  }
  int getScoreKategori7(){
    return scoreKategori7;
  }

  String getKategori8(){
    return kategori8;
  }
  int getScoreKategori8(){
    return scoreKategori8;
  }

  String getKategori9(){
    return kategori9;
  }
  int getScoreKategori9(){
    return scoreKategori9;
  }

  String getKategori10(){
    return kategori10;
  }
  int getScoreKategori10(){
    return scoreKategori10;
  }

  String getKategori11(){
    return kategori11;
  }
  int getScoreKategori11(){
    return scoreKategori11;
  }

  String getKategori12(){
    return kategori12;
  }
  int getScoreKategori12(){
    return scoreKategori12;
  }

  String getKategori13(){
    return kategori13;
  }
  int getScoreKategori13(){
    return scoreKategori13;
  }

  String getKategori14(){
    return kategori14;
  }
  int getScoreKategori14(){
    return scoreKategori14;
  }

  String getKategori15(){
    return kategori15;
  }
  int getScoreKategori15(){
    return scoreKategori15;
  }

  String getKategori16(){
    return kategori16;
  }
  int getScoreKategori16(){
    return scoreKategori16;
  }

  String getKategori17(){
    return kategori17;
  }
  int getScoreKategori17(){
    return scoreKategori17;
  }

  String getKategori18(){
    return kategori18;
  }
  int getScoreKategori18(){
    return scoreKategori18;
  }

  String getKategori19(){
    return kategori19;
  }
  int getScoreKategori19(){
    return scoreKategori19;
  }

  String getKategori20(){
    return kategori20;
  }
  int getScoreKategori20(){
    return scoreKategori20;
  }

  String getKategori21(){
    return kategori21;
  }
  int getScoreKategori21(){
    return scoreKategori21;
  }

  String getKategori22(){
    return kategori22;
  }
  int getScoreKategori22(){
    return scoreKategori22;
  }

  String getKategori23(){
    return kategori23;
  }
  int getScoreKategori23(){
    return scoreKategori23;
  }

  String getKategori24(){
    return kategori24;
  }
  int getScoreKategori24(){
    return scoreKategori24;
  }

  String getKategori25(){
    return kategori25;
  }
  int getScoreKategori25(){
    return scoreKategori25;
  }

  String getKategori26(){
    return kategori26;
  }
  int getScoreKategori26(){
    return scoreKategori26;
  }

  String getKategori27(){
    return kategori27;
  }
  int getScoreKategori27(){
    return scoreKategori27;
  }

  String getKategori28(){
    return kategori28;
  }
  int getScoreKategori28(){
    return scoreKategori28;
  }

  String getKategori29(){
    return kategori29;
  }
  int getScoreKategori29(){
    return scoreKategori29;
  }

  String getKategori30(){
    return kategori30;
  }
  int getScoreKategori30(){
    return scoreKategori30;
  }

  String getKategori31(){
    return kategori31;
  }
  int getScoreKategori31(){
    return scoreKategori31;
  }

  String getKategori32(){
    return kategori32;
  }
  int getScoreKategori32(){
    return scoreKategori32;
  }

  String getKategori33(){
    return kategori33;
  }
  int getScoreKategori33(){
    return scoreKategori33;
  }

  String getKategori34(){
    return kategori34;
  }
  int getScoreKategori34(){
    return scoreKategori34;
  }

  String getKategori35(){
    return kategori35;
  }
  int getScoreKategori35(){
    return scoreKategori35;
  }

  String getKategori36(){
    return kategori36;
  }
  int getScoreKategori36(){
    return scoreKategori36;
  }

  String getKategori37(){
    return kategori37;
  }
  int getScoreKategori37(){
    return scoreKategori37;
  }

  String getKategori38(){
    return kategori38;
  }
  int getScoreKategori38(){
    return scoreKategori38;
  }



  Future<void> updateUserRecord(UserModel user, String Id) async{
    // getSingelUserDetails(email);
    print('User Id yang mau di update : ${user.id}');
    print('Email yang mau di update : ${user.email}');
    print('Email yang mau di update2 : $Id');

    print('CaraKedua : Id yang mau diupdate : ${user.id}');
    print('CaraKedua : Id yang mau dikirm : ${UserRepository.instance.getUserModelId()}');
    // await _db.collection("/Users").doc(email).update(user.toJson()).catchError((error, stackTrice){
    await _db.collection("/Users").doc(Id).update(user.toJson()).catchError((error, stackTrice){
      print('Thi1 the error : $error');
      print('Thi2 the error : ${stackTrice.message}');
      print(error.toString());
    });
    getSingelUserDetails(user.email);
  }

  Future<void> updateSingelRecord(Map<String, dynamic> json) async{
    await _db.collection("/Users").doc(UserRepository.instance.getUserModelId()).update(json);
  }


  Future<String> uploadImage (String path, XFile image) async{
    print('Path yang diterima : $path');
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    print('Url yang dibalikin : $url');
    return url;
  }



}