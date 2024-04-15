import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsilocal/models/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  var ctr =0;
  String userModelID = "";
  String userModelFullName = "";
  String userModelEmail = "";
  String userModelUserName = "";
  String userModelProvince = "";
  String userModelDateOfBirth = "";
  String userModelJoinDate = "";
  String userModelProfilePicture = "";
  String isSuccesGetData = "FALSE";
  List<int> listScore = [];
  String initKategori = "";

  int scoreKategori1=0;
  int scoreKategori2=0;
  int scoreKategori3=0;
  int scoreKategori4=0;
  int scoreKategori5=0;
  int scoreKategori6=0;
  int scoreKategori7=0;
  int scoreKategori8=0;
  int scoreKategori9=0;
  int scoreKategori10=0;
  int scoreKategori11=0;
  int scoreKategori12=0;
  int scoreKategori13=0;
  int scoreKategori14=0;
  int scoreKategori15=0;
  int scoreKategori16=0;
  int scoreKategori17=0;
  int scoreKategori18=0;
  int scoreKategori19=0;
  int scoreKategori20=0;
  int scoreKategori21=0;
  int scoreKategori22=0;
  int scoreKategori23=0;
  int scoreKategori24=0;
  int scoreKategori25=0;
  int scoreKategori26=0;
  int scoreKategori27=0;
  int scoreKategori28=0;
  int scoreKategori29=0;
  int scoreKategori30=0;
  int scoreKategori31=0;
  int scoreKategori32=0;
  int scoreKategori33=0;
  int scoreKategori34=0;
  int scoreKategori35=0;
  int scoreKategori36=0;
  int scoreKategori37=0;
  int scoreKategori38=0;


  final _db = FirebaseFirestore.instance;

  createUer(UserModel user) async {
    await _db.collection("/Users").add(user.toJson());
    // print('User Berhasil dibuat');
  }

  String isUserNull = "";
  List<String> listUsernameRegistered = [];
  String isUsernameAvail = "";
  Future<List<UserModel>> checkListUserName(String username) async{
    final snapshot = await _db.collection("/Users").where("UserName", isEqualTo: username).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    if(userData.isNotEmpty){
      for (int i=0; i<userData.length;i++){
        listUsernameRegistered.add(userData[i].userName);
      }
      isUsernameAvail = "NO";
    } else{
      isUsernameAvail = "YES";
    }
    return userData;
  }

  String getUsernameAvail(){
    return isUsernameAvail;
  }

  String isUserEmailAvail = "";
  Future<List<UserModel>> getSingelAllUserFromEmail(String email) async{
    final snapshot = await _db.collection("/Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    isUserEmailAvail = "";
    if(userData.isEmpty){
      isUserEmailAvail="NO";
    } else if(userData.isNotEmpty){
      isUserEmailAvail="YES";
    }
    return userData;
  }

  String getIsUserEmailAvail(){
    return isUserEmailAvail;
  }


  List<int> initScoreAwal = [];
  String flagOverCategory = "";
  List<int> indexCategoryOver = [];
  Future<UserModel> getSingelUserDetails(String email) async{
    // print('CheckPoint login 2');
    // print('DB telah dipanggil ke ${ctr+=1}');
    final snapshot = await _db.collection("/Users").where("Email", isEqualTo: email).get();
    // print('CheckPoint login 3');
    // final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).elementAt(0);
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    // print('CheckPoint login 4');

    isSuccesGetData = "";

    userModelID = userData.id!;
    userModelFullName = userData.fullName;
    userModelEmail = userData.email;
    userModelUserName = userData.userName;
    userModelProvince = userData.province;
    userModelDateOfBirth = userData.dateOfBirth;
    userModelJoinDate = userData.joinDate;
    userModelProfilePicture = userData.profilePicture;

    // ADDING
    scoreKategori1 = userData.scoreKategori1;
    scoreKategori2 = userData.scoreKategori2;
    scoreKategori3 = userData.scoreKategori3;
    scoreKategori4 = userData.scoreKategori4;
    scoreKategori5 = userData.scoreKategori5;
    scoreKategori6 = userData.scoreKategori6;
    scoreKategori7 = userData.scoreKategori7;
    scoreKategori8 = userData.scoreKategori8;
    scoreKategori9 = userData.scoreKategori9;
    scoreKategori10 = userData.scoreKategori10;
    scoreKategori11 = userData.scoreKategori11;
    scoreKategori12 = userData.scoreKategori12;
    scoreKategori13 = userData.scoreKategori13;
    scoreKategori14 = userData.scoreKategori14;
    scoreKategori15 = userData.scoreKategori15;
    scoreKategori16 = userData.scoreKategori16;
    scoreKategori17 = userData.scoreKategori17;
    scoreKategori18 = userData.scoreKategori18;
    scoreKategori19 = userData.scoreKategori19;
    scoreKategori20 = userData.scoreKategori20;
    scoreKategori21 = userData.scoreKategori21;
    scoreKategori22 = userData.scoreKategori22;
    scoreKategori23 = userData.scoreKategori23;
    scoreKategori24 = userData.scoreKategori24;
    scoreKategori25 = userData.scoreKategori25;
    scoreKategori26 = userData.scoreKategori26;
    scoreKategori27 = userData.scoreKategori27;
    scoreKategori28 = userData.scoreKategori28;
    scoreKategori29 = userData.scoreKategori29;
    scoreKategori30 = userData.scoreKategori30;
    scoreKategori31 = userData.scoreKategori31;
    scoreKategori32 = userData.scoreKategori32;
    scoreKategori33 = userData.scoreKategori33;
    scoreKategori34 = userData.scoreKategori34;
    scoreKategori35 = userData.scoreKategori35;
    scoreKategori36 = userData.scoreKategori36;
    scoreKategori37 = userData.scoreKategori37;
    scoreKategori38 = userData.scoreKategori38;

    listScore = [];
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
    // print('Lit score yg dibalikin : ${listScore.toString()}');
    // listScore.sort();
    await Future.delayed(const Duration(milliseconds: 100));
    initScoreAwal = [];
    indexCategoryOver = [];
    flagOverCategory = "";
    for(int i=0; i<listScore.length; i++){
      if(listScore[i]>999){
        initScoreAwal.add(listScore[i]);
      }
      if(listScore[i]>=960 && listScore[i]<= 998){
        indexCategoryOver.add(i);
        flagOverCategory = "TRUE";
      }

    }
    initKategori = "";
    await Future.delayed(const Duration(milliseconds: 100));
    if(initScoreAwal.length <3){
      initKategori =  "NO";
    } else {
      initKategori =  "YES";
    }

    isSuccesGetData = "True";
    return userData;
  }

  String getUserOverScoreCategory(){
    return flagOverCategory;
  }

  List<int> getListScoreOverCategory(){
    return indexCategoryOver;
  }

  Future<List<UserModel>> getAllUserDetails() async{
    final snapshot = await _db.collection("/Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  String getUserModelInitScore(){
    return initKategori;
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

  int getScoreKategori1(){
    return scoreKategori1;
  }

  int getScoreKategori2(){
    return scoreKategori2;
  }

  int getScoreKategori3(){
    return scoreKategori3;
  }

  int getScoreKategori4(){
    return scoreKategori4;
  }

  int getScoreKategori5(){
    return scoreKategori5;
  }

  int getScoreKategori6(){
    return scoreKategori6;
  }

  int getScoreKategori7(){
    return scoreKategori7;
  }

  int getScoreKategori8(){
    return scoreKategori8;
  }

  int getScoreKategori9(){
    return scoreKategori9;
  }

  int getScoreKategori10(){
    return scoreKategori10;
  }

  int getScoreKategori11(){
    return scoreKategori11;
  }

  int getScoreKategori12(){
    return scoreKategori12;
  }

  int getScoreKategori13(){
    return scoreKategori13;
  }

  int getScoreKategori14(){
    return scoreKategori14;
  }

  int getScoreKategori15(){
    return scoreKategori15;
  }

  int getScoreKategori16(){
    return scoreKategori16;
  }

  int getScoreKategori17(){
    return scoreKategori17;
  }

  int getScoreKategori18(){
    return scoreKategori18;
  }

  int getScoreKategori19(){
    return scoreKategori19;
  }

  int getScoreKategori20(){
    return scoreKategori20;
  }

  int getScoreKategori21(){
    return scoreKategori21;
  }

  int getScoreKategori22(){
    return scoreKategori22;
  }

  int getScoreKategori23(){
    return scoreKategori23;
  }

  int getScoreKategori24(){
    return scoreKategori24;
  }

  int getScoreKategori25(){
    return scoreKategori25;
  }

  int getScoreKategori26(){
    return scoreKategori26;
  }

  int getScoreKategori27(){
    return scoreKategori27;
  }

  int getScoreKategori28(){
    return scoreKategori28;
  }

  int getScoreKategori29(){
    return scoreKategori29;
  }

  int getScoreKategori30(){
    return scoreKategori30;
  }

  int getScoreKategori31(){
    return scoreKategori31;
  }

  int getScoreKategori32(){
    return scoreKategori32;
  }

  int getScoreKategori33(){
    return scoreKategori33;
  }

  int getScoreKategori34(){
    return scoreKategori34;
  }

  int getScoreKategori35(){
    return scoreKategori35;
  }

  int getScoreKategori36(){
    return scoreKategori36;
  }

  int getScoreKategori37(){
    return scoreKategori37;
  }

  int getScoreKategori38(){
    return scoreKategori38;
  }



  Future<void> updateUserRecord(UserModel user, String id) async{
    // getSingelUserDetails(email);
    // print('User Id yang mau di update : ${user.id}');
    // print('Email yang mau di update : ${user.email}');
    // print('Email yang mau di update2 : $Id');
    //
    // print('CaraKedua : Id yang mau diupdate : ${user.id}');
    // print('CaraKedua : Id yang mau dikirm : ${UserRepository.instance.getUserModelId()}');
    // await _db.collection("/Users").doc(email).update(user.toJson()).catchError((error, stackTrice){
    await _db.collection("/Users").doc(id).update(user.toJson()).catchError((error, stackTrice){
      // print('Thi1 the error : $error');
      // print('Thi2 the error : ${stackTrice.message}');
      // print(error.toString());
    });
    getSingelUserDetails(user.email);
  }

  Future<void> updateSingelRecord(Map<String, dynamic> json) async{
    await _db.collection("/Users").doc(UserRepository.instance.getUserModelId()).update(json);
  }

  Future<void> updateUserOverLimitCategoryRecord(Map<String, dynamic> json) async{
    await _db.collection("/Users").doc(UserRepository.instance.getUserModelId()).update(json);
  }

  // Inc News Read
  Future<void> updateSingelScore(String kategori) async{
    Map<String, dynamic> json = {'scoreKategori1' : FieldValue.increment(0)};
    if(kategori == "Nasional"){
      json = {'scoreKategori1' : FieldValue.increment(1)};
    } else if(kategori == "Bisnis"){
      json = {'scoreKategori2' : FieldValue.increment(1)};
    }else if(kategori == "Politik"){
      json = {'scoreKategori3' : FieldValue.increment(1)};
    } else if(kategori == "Hukum"){
      json = {'scoreKategori4' : FieldValue.increment(1)};
    } else if(kategori == "Ekonomi"){
      json = {'scoreKategori5' : FieldValue.increment(1)};
    } else if(kategori == "Olahraga"){
      json = {'scoreKategori6' : FieldValue.increment(1)};
    }else if(kategori == "Teknologi"){
      json = {'scoreKategori7' : FieldValue.increment(1)};
    }else if(kategori == "Otomotif"){
      json = {'scoreKategori8' : FieldValue.increment(1)};
    }else if(kategori == "Internasional"){
      json = {'scoreKategori9' : FieldValue.increment(1)};
    } else if(kategori == "Bola"){
      json = {'scoreKategori10' : FieldValue.increment(1)};
    }else if(kategori == "Selebritis"){
      json = {'scoreKategori11' : FieldValue.increment(1)};
    }else if(kategori == "Lifestyle"){
      json = {'scoreKategori12' : FieldValue.increment(1)};
    }else if(kategori == "Hiburan"){
      json = {'scoreKategori13' : FieldValue.increment(1)};
    }else if(kategori == "Jakarta"){
      json = {'scoreKategori14' : FieldValue.increment(1)};
    }else if(kategori == "Market"){
      json = {'scoreKategori15' : FieldValue.increment(1)};
    }else if(kategori == "News"){
      json = {'scoreKategori16' : FieldValue.increment(1)};
    }else if(kategori == "Cantik"){
      json = {'scoreKategori17' : FieldValue.increment(1)};
    }else if(kategori == "Travel"){
      json = {'scoreKategori18' : FieldValue.increment(1)};
    }else if(kategori == "Syariah"){
      json = {'scoreKategori19' : FieldValue.increment(1)};
    }else if(kategori == "Islam"){
      json = {'scoreKategori20' : FieldValue.increment(1)};
    }else if(kategori == "Sains"){
      json = {'scoreKategori21' : FieldValue.increment(1)};
    }else if(kategori == "Edukasi"){
      json = {'scoreKategori22' : FieldValue.increment(1)};
    }else if(kategori == "Kesehatan"){
      json = {'scoreKategori23' : FieldValue.increment(1)};
    }else if(kategori == "Humaniora"){
      json = {'scoreKategori24' : FieldValue.increment(1)};
    }else if(kategori == "Entrepreneur"){
      json = {'scoreKategori25' : FieldValue.increment(1)};
    }else if(kategori == "Opini"){
      json = {'scoreKategori26' : FieldValue.increment(1)};
    }else if(kategori == "Khas"){
      json = {'scoreKategori27' : FieldValue.increment(1)};
    }else if(kategori == "Jateng"){
      json = {'scoreKategori28' : FieldValue.increment(1)};
    }else if(kategori == "Daerah"){
      json = {'scoreKategori29' : FieldValue.increment(1)};
    }else if(kategori == "Khazanah"){
      json = {'scoreKategori30' : FieldValue.increment(1)};
    }else if(kategori == "Leisure"){
      json = {'scoreKategori31' : FieldValue.increment(1)};
    }else if(kategori == "Metro"){
      json = {'scoreKategori32' : FieldValue.increment(1)};
    }else if(kategori == "Ekbis"){
      json = {'scoreKategori33' : FieldValue.increment(1)};
    }else if(kategori == "Kalam"){
      json = {'scoreKategori34' : FieldValue.increment(1)};
    }else if(kategori == "Difabel"){
      json = {'scoreKategori35' : FieldValue.increment(1)};
    }else if(kategori == "Creativelab"){
      json = {'scoreKategori36' : FieldValue.increment(1)};
    }else if(kategori == "Inforial"){
      json = {'scoreKategori37' : FieldValue.increment(1)};
    }else if(kategori == "Event"){
      json = {'scoreKategori38' : FieldValue.increment(1)};
    }
    await _db.collection("/Users").doc(UserRepository.instance.getUserModelId()).update(json);
  }

  Future<void> updateSingelScoreOverLimit(String kategori, int score) async{
    Map<String, dynamic> json = {'scoreKategori1' : FieldValue.increment(0)};
    if(kategori == "Nasional"){
      json = {'scoreKategori1' : score};
    } else if(kategori == "Bisnis"){
      json = {'scoreKategori2' : score};
    }else if(kategori == "Politik"){
      json = {'scoreKategori3' : score};
    } else if(kategori == "Hukum"){
      json = {'scoreKategori4' : score};
    } else if(kategori == "Ekonomi"){
      json = {'scoreKategori5' : score};
    } else if(kategori == "Olahraga"){
      json = {'scoreKategori6' : score};
    }else if(kategori == "Teknologi"){
      json = {'scoreKategori7' : score};
    }else if(kategori == "Otomotif"){
      json = {'scoreKategori8' : score};
    }else if(kategori == "Internasional"){
      json = {'scoreKategori9' : score};
    } else if(kategori == "Bola"){
      json = {'scoreKategori10' : score};
    }else if(kategori == "Selebritis"){
      json = {'scoreKategori11' : score};
    }else if(kategori == "Lifestyle"){
      json = {'scoreKategori12' : score};
    }else if(kategori == "Hiburan"){
      json = {'scoreKategori13' : score};
    }else if(kategori == "Jakarta"){
      json = {'scoreKategori14' : score};
    }else if(kategori == "Market"){
      json = {'scoreKategori15' : score};
    }else if(kategori == "News"){
      json = {'scoreKategori16' : score};
    }else if(kategori == "Cantik"){
      json = {'scoreKategori17' : score};
    }else if(kategori == "Travel"){
      json = {'scoreKategori18' : score};
    }else if(kategori == "Syariah"){
      json = {'scoreKategori19' : score};
    }else if(kategori == "Islam"){
      json = {'scoreKategori20' : score};
    }else if(kategori == "Sains"){
      json = {'scoreKategori21' : score};
    }else if(kategori == "Edukasi"){
      json = {'scoreKategori22' : score};
    }else if(kategori == "Kesehatan"){
      json = {'scoreKategori23' : score};
    }else if(kategori == "Humaniora"){
      json = {'scoreKategori24' : score};
    }else if(kategori == "Entrepreneur"){
      json = {'scoreKategori25' : score};
    }else if(kategori == "Opini"){
      json = {'scoreKategori26' : score};
    }else if(kategori == "Khas"){
      json = {'scoreKategori27' : score};
    }else if(kategori == "Jateng"){
      json = {'scoreKategori28' : score};
    }else if(kategori == "Daerah"){
      json = {'scoreKategori29' : score};
    }else if(kategori == "Khazanah"){
      json = {'scoreKategori30' : score};
    }else if(kategori == "Leisure"){
      json = {'scoreKategori31' : score};
    }else if(kategori == "Metro"){
      json = {'scoreKategori32' : score};
    }else if(kategori == "Ekbis"){
      json = {'scoreKategori33' : score};
    }else if(kategori == "Kalam"){
      json = {'scoreKategori34' : score};
    }else if(kategori == "Difabel"){
      json = {'scoreKategori35' : score};
    }else if(kategori == "Creativelab"){
      json = {'scoreKategori36' : score};
    }else if(kategori == "Inforial"){
      json = {'scoreKategori37' : score};
    }else if(kategori == "Event"){
      json = {'scoreKategori38' : score};
    }
    await _db.collection("/Users").doc(UserRepository.instance.getUserModelId()).update(json);
  }


  Future<String> uploadImage (String path, XFile image) async{
    // print('Path yang diterima : $path');
    final ref = FirebaseStorage.instance.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    // print('Url yang dibalikin : $url');
    return url;
  }

  Future<void> refreshUserData() async {
    try {
      // Ambil data terbaru dari Firebase
      final email = getUserModelEmail();
      final userData = await getSingelUserDetails(email);

      // Perbarui data di UserRepository
      userModelID = userData.id!;
      userModelFullName = userData.fullName;
      userModelEmail = userData.email;
      userModelUserName = userData.userName;
      userModelProvince = userData.province;
      userModelDateOfBirth = userData.dateOfBirth;
      userModelJoinDate = userData.joinDate;
      userModelProfilePicture = userData.profilePicture;

      // Perbarui data kategori
      // Tambahkan perbaruan untuk setiap kategori yang Anda miliki
      scoreKategori1 = userData.scoreKategori1;
      scoreKategori2 = userData.scoreKategori2;
      // ... (dan seterusnya untuk kategori lainnya)

      isSuccesGetData = "True";

      // Perbarui state GetX
      update();
    } catch (e) {
      // Tangani kesalahan jika terjadi
      // print('Error refreshing user data: $e');
    }
  }

  Future<void> deleteSingelUser(String id)async{
    await _db.collection("/Users").doc(id).delete();
  }

}