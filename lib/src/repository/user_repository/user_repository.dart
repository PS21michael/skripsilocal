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