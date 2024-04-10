import 'package:cloud_firestore/cloud_firestore.dart';

var temp=0;

class UserModel{
  final String? id;
  final String fullName;
  final String email;
  final String userName;
  final String province;
  final String dateOfBirth;
  final String joinDate;
  String profilePicture;
  int scoreKategori1;
  int scoreKategori2;
  int scoreKategori3;
  int scoreKategori4;
  int scoreKategori5;
  int scoreKategori6;
  int scoreKategori7;
  int scoreKategori8;
  int scoreKategori9;
  int scoreKategori10;
  int scoreKategori11;
  int scoreKategori12;
  int scoreKategori13;
  int scoreKategori14;
  int scoreKategori15;
  int scoreKategori16;
  int scoreKategori17;
  int scoreKategori18;
  int scoreKategori19;
  int scoreKategori20;
  int scoreKategori21;
  int scoreKategori22;
  int scoreKategori23;
  int scoreKategori24;
  int scoreKategori25;
  int scoreKategori26;
  int scoreKategori27;
  int scoreKategori28;
  int scoreKategori29;
  int scoreKategori30;
  int scoreKategori31;
  int scoreKategori32;
  int scoreKategori33;
  int scoreKategori34;
  int scoreKategori35;
  int scoreKategori36;
  int scoreKategori37;
  int scoreKategori38;


  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.userName,
    required this.province,
    required this.dateOfBirth,
    required this.joinDate,
    required this.profilePicture,
    required this.scoreKategori1,
    required this.scoreKategori2,
    required this.scoreKategori3,
    required this.scoreKategori4,
    required this.scoreKategori5,
    required this.scoreKategori6,
    required this.scoreKategori7,
    required this.scoreKategori8,
    required this.scoreKategori9,
    required this.scoreKategori10,
    required this.scoreKategori11,
    required this.scoreKategori12,
    required this.scoreKategori13,
    required this.scoreKategori14,
    required this.scoreKategori15,
    required this.scoreKategori16,
    required this.scoreKategori17,
    required this.scoreKategori18,
    required this.scoreKategori19,
    required this.scoreKategori20,
    required this.scoreKategori21,
    required this.scoreKategori22,
    required this.scoreKategori23,
    required this.scoreKategori24,
    required this.scoreKategori25,
    required this.scoreKategori26,
    required this.scoreKategori27,
    required this.scoreKategori28,
    required this.scoreKategori29,
    required this.scoreKategori30,
    required this.scoreKategori31,
    required this.scoreKategori32,
    required this.scoreKategori33,
    required this.scoreKategori34,
    required this.scoreKategori35,
    required this.scoreKategori36,
    required this.scoreKategori37,
    required this.scoreKategori38
  });

  static UserModel empty() => UserModel(
      id : '',
      fullName: '',
      email: '',
      userName: '',
      province: '',
      dateOfBirth: '',
      profilePicture: '',
      joinDate:'',
      scoreKategori1: 0,
      scoreKategori2: 0,
      scoreKategori3: 0,
      scoreKategori4: 0,
      scoreKategori5: 0,
      scoreKategori6: 0,
      scoreKategori7: 0,
      scoreKategori8: 0,
      scoreKategori9: 0,
      scoreKategori10: 0,
      scoreKategori11: 0,
      scoreKategori12: 0,
      scoreKategori13: 0,
      scoreKategori14: 0,
      scoreKategori15: 0,
      scoreKategori16: 0,
      scoreKategori17: 0,
      scoreKategori18: 0,
      scoreKategori19: 0,
      scoreKategori20: 0,
      scoreKategori21: 0,
      scoreKategori22: 0,
      scoreKategori23: 0,
      scoreKategori24: 0,
      scoreKategori25: 0,
      scoreKategori26: 0,
      scoreKategori27: 0,
      scoreKategori28: 0,
      scoreKategori29: 0,
      scoreKategori30: 0,
      scoreKategori31: 0,
      scoreKategori32: 0,
      scoreKategori33: 0,
      scoreKategori34: 0,
      scoreKategori35: 0,
      scoreKategori36: 0,
      scoreKategori37: 0,
      scoreKategori38: 0
  );

  // Sent to Json
  toJson(){
    return {
      "FullName" : fullName,
      "Email" : email,
      "UserName" : userName,
      "Province" : province,
      "DateOfBirth" : dateOfBirth,
      "JoinDate" : joinDate,
      "ProfilePicture" : profilePicture,
      "scoreKategori1": scoreKategori1,
      "scoreKategori2": scoreKategori2,
      "scoreKategori3": scoreKategori3,
      "scoreKategori4": scoreKategori4,
      "scoreKategori5": scoreKategori5,
      "scoreKategori6": scoreKategori6,
      "scoreKategori7": scoreKategori7,
      "scoreKategori8": scoreKategori8,
      "scoreKategori9": scoreKategori9,
      "scoreKategori10": scoreKategori10,
      "scoreKategori11": scoreKategori11,
      "scoreKategori12": scoreKategori12,
      "scoreKategori13": scoreKategori13,
      "scoreKategori14": scoreKategori14,
      "scoreKategori15": scoreKategori15,
      "scoreKategori16": scoreKategori16,
      "scoreKategori17": scoreKategori17,
      "scoreKategori18": scoreKategori18,
      "scoreKategori19": scoreKategori19,
      "scoreKategori20": scoreKategori20,
      "scoreKategori21": scoreKategori21,
      "scoreKategori22": scoreKategori22,
      "scoreKategori23": scoreKategori23,
      "scoreKategori24": scoreKategori24,
      "scoreKategori25": scoreKategori25,
      "scoreKategori26": scoreKategori26,
      "scoreKategori27": scoreKategori27,
      "scoreKategori28": scoreKategori28,
      "scoreKategori29": scoreKategori29,
      "scoreKategori30": scoreKategori30,
      "scoreKategori31": scoreKategori31,
      "scoreKategori32": scoreKategori32,
      "scoreKategori33": scoreKategori33,
      "scoreKategori34": scoreKategori34,
      "scoreKategori35": scoreKategori35,
      "scoreKategori36": scoreKategori36,
      "scoreKategori37": scoreKategori37,
      "scoreKategori38": scoreKategori38
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    // print('Sudah dipanggil ke ${temp+=1}');
    final data = document.data();
    return UserModel(
        id: document.id,
        fullName: data?["FullName"],
        email: data?["Email"],
        userName: data?["UserName"],
        province: data?["Province"],
        dateOfBirth: data?["DateOfBirth"],
        joinDate: data?["JoinDate"],
        profilePicture: data?["ProfilePicture"],
        scoreKategori1: data?["scoreKategori1"],
        scoreKategori2: data?["scoreKategori2"],
        scoreKategori3: data?["scoreKategori3"],
        scoreKategori4: data?["scoreKategori4"],
        scoreKategori5: data?["scoreKategori5"],
        scoreKategori6: data?["scoreKategori6"],
        scoreKategori7: data?["scoreKategori7"],
        scoreKategori8: data?["scoreKategori8"],
        scoreKategori9: data?["scoreKategori9"],
        scoreKategori10: data?["scoreKategori10"],
        scoreKategori11: data?["scoreKategori11"],
        scoreKategori12: data?["scoreKategori12"],
        scoreKategori13: data?["scoreKategori13"],
        scoreKategori14: data?["scoreKategori14"],
        scoreKategori15: data?["scoreKategori15"],
        scoreKategori16: data?["scoreKategori16"],
        scoreKategori17: data?["scoreKategori17"],
        scoreKategori18: data?["scoreKategori18"],
        scoreKategori19: data?["scoreKategori19"],
        scoreKategori20: data?["scoreKategori20"],
        scoreKategori21: data?["scoreKategori21"],
        scoreKategori22: data?["scoreKategori22"],
        scoreKategori23: data?["scoreKategori23"],
        scoreKategori24: data?["scoreKategori24"],
        scoreKategori25: data?["scoreKategori25"],
        scoreKategori26: data?["scoreKategori26"],
        scoreKategori27: data?["scoreKategori27"],
        scoreKategori28: data?["scoreKategori28"],
        scoreKategori29: data?["scoreKategori29"],
        scoreKategori30: data?["scoreKategori30"],
        scoreKategori31: data?["scoreKategori31"],
        scoreKategori32: data?["scoreKategori32"],
        scoreKategori33: data?["scoreKategori33"],
        scoreKategori34: data?["scoreKategori34"],
        scoreKategori35: data?["scoreKategori35"],
        scoreKategori36: data?["scoreKategori36"],
        scoreKategori37: data?["scoreKategori37"],
        scoreKategori38: data?["scoreKategori38"]
    );
  }

}