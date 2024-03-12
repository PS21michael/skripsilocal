import 'package:cloud_firestore/cloud_firestore.dart';

var temp=0;

class UserModel{
  final String? id;
  final String fullName;
  final String email;
  final String userName;
  final String province;
  final String dateOfBirth;
  final String password;
  final String joinDate;
  String profilePicture;
  // Adding
  String kategori1;
  int scoreKategori1;
  String kategori2;
  int scoreKategori2;
  String kategori3;
  int scoreKategori3;
  String kategori4;
  int scoreKategori4;
  String kategori5;
  int scoreKategori5;
  String kategori6;
  int scoreKategori6;
  String kategori7;
  int scoreKategori7;
  String kategori8;
  int scoreKategori8;
  String kategori9;
  int scoreKategori9;
  String kategori10;
  int scoreKategori10;
  String kategori11;
  int scoreKategori11;
  String kategori12;
  int scoreKategori12;
  String kategori13;
  int scoreKategori13;
  String kategori14;
  int scoreKategori14;
  String kategori15;
  int scoreKategori15;
  String kategori16;
  int scoreKategori16;
  String kategori17;
  int scoreKategori17;
  String kategori18;
  int scoreKategori18;
  String kategori19;
  int scoreKategori19;
  String kategori20;
  int scoreKategori20;
  String kategori21;
  int scoreKategori21;
  String kategori22;
  int scoreKategori22;
  String kategori23;
  int scoreKategori23;
  String kategori24;
  int scoreKategori24;
  String kategori25;
  int scoreKategori25;
  String kategori26;
  int scoreKategori26;
  String kategori27;
  int scoreKategori27;
  String kategori28;
  int scoreKategori28;
  String kategori29;
  int scoreKategori29;
  String kategori30;
  int scoreKategori30;
  String kategori31;
  int scoreKategori31;
  String kategori32;
  int scoreKategori32;
  String kategori33;
  int scoreKategori33;
  String kategori34;
  int scoreKategori34;
  String kategori35;
  int scoreKategori35;
  String kategori36;
  int scoreKategori36;
  String kategori37;
  int scoreKategori37;
  String kategori38;
  int scoreKategori38;


  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.userName,
    required this.province,
    required this.dateOfBirth,
    required this.password,
    required this.joinDate,
    required this.profilePicture,
    required this.kategori1,
    required this.scoreKategori1,
    required this.kategori2,
    required this.scoreKategori2,
    required this.kategori3,
    required this.scoreKategori3,
    required this.kategori4,
    required this.scoreKategori4,
    required this.kategori5,
    required this.scoreKategori5,
    required this.kategori6,
    required this.scoreKategori6,
    required this.kategori7,
    required this.scoreKategori7,
    required this.kategori8,
    required this.scoreKategori8,
    required this.kategori9,
    required this.scoreKategori9,
    required this.kategori10,
    required this.scoreKategori10,
    required this.kategori11,
    required this.scoreKategori11,
    required this.kategori12,
    required this.scoreKategori12,
    required this.kategori13,
    required this.scoreKategori13,
    required this.kategori14,
    required this.scoreKategori14,
    required this.kategori15,
    required this.scoreKategori15,
    required this.kategori16,
    required this.scoreKategori16,
    required this.kategori17,
    required this.scoreKategori17,
    required this.kategori18,
    required this.scoreKategori18,
    required this.kategori19,
    required this.scoreKategori19,
    required this.kategori20,
    required this.scoreKategori20,
    required this.kategori21,
    required this.scoreKategori21,
    required this.kategori22,
    required this.scoreKategori22,
    required this.kategori23,
    required this.scoreKategori23,
    required this.kategori24,
    required this.scoreKategori24,
    required this.kategori25,
    required this.scoreKategori25,
    required this.kategori26,
    required this.scoreKategori26,
    required this.kategori27,
    required this.scoreKategori27,
    required this.kategori28,
    required this.scoreKategori28,
    required this.kategori29,
    required this.scoreKategori29,
    required this.kategori30,
    required this.scoreKategori30,
    required this.kategori31,
    required this.scoreKategori31,
    required this.kategori32,
    required this.scoreKategori32,
    required this.kategori33,
    required this.scoreKategori33,
    required this.kategori34,
    required this.scoreKategori34,
    required this.kategori35,
    required this.scoreKategori35,
    required this.kategori36,
    required this.scoreKategori36,
    required this.kategori37,
    required this.scoreKategori37,
    required this.kategori38,
    required this.scoreKategori38
  });

  static UserModel empty() => UserModel(
      id : '',
      fullName: '',
      email: '',
      userName: '',
      province: '',
      dateOfBirth: '',
      password: '',
      profilePicture: '',
      joinDate:'',
      kategori1: '',
      scoreKategori1: 0,
      kategori2: '',
      scoreKategori2: 0,
      kategori3: '',
      scoreKategori3: 0,
      kategori4: '',
      scoreKategori4: 0,
      kategori5: '',
      scoreKategori5: 0,
      kategori6: '',
      scoreKategori6: 0,
      kategori7: '',
      scoreKategori7: 0,
      kategori8: '',
      scoreKategori8: 0,
      kategori9: '',
      scoreKategori9: 0,
      kategori10: '',
      scoreKategori10: 0,
      kategori11: '',
      scoreKategori11: 0,
      kategori12: '',
      scoreKategori12: 0,
      kategori13: '',
      scoreKategori13: 0,
      kategori14: '',
      scoreKategori14: 0,
      kategori15: '',
      scoreKategori15: 0,
      kategori16: '',
      scoreKategori16: 0,
      kategori17: '',
      scoreKategori17: 0,
      kategori18: '',
      scoreKategori18: 0,
      kategori19: '',
      scoreKategori19: 0,
      kategori20: '',
      scoreKategori20: 0,
      kategori21: '',
      scoreKategori21: 0,
      kategori22: '',
      scoreKategori22: 0,
      kategori23: '',
      scoreKategori23: 0,
      kategori24: '',
      scoreKategori24: 0,
      kategori25: '',
      scoreKategori25: 0,
      kategori26: '',
      scoreKategori26: 0,
      kategori27: '',
      scoreKategori27: 0,
      kategori28: '',
      scoreKategori28: 0,
      kategori29: '',
      scoreKategori29: 0,
      kategori30: '',
      scoreKategori30: 0,
      kategori31: '',
      scoreKategori31: 0,
      kategori32: '',
      scoreKategori32: 0,
      kategori33: '',
      scoreKategori33: 0,
      kategori34: '',
      scoreKategori34: 0,
      kategori35: '',
      scoreKategori35: 0,
      kategori36: '',
      scoreKategori36: 0,
      kategori37: '',
      scoreKategori37: 0,
      kategori38: '',
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
      "Password" : password,
      "JoinDate" : joinDate,
      "ProfilePicture" : profilePicture,
      "kategori1" : kategori1,
      "scoreKategori1": scoreKategori1,
      "kategori2" : kategori2,
      "scoreKategori2": scoreKategori2,
      "kategori3" : kategori3,
      "scoreKategori3": scoreKategori3,
      "kategori4" : kategori4,
      "scoreKategori4": scoreKategori4,
      "kategori5" : kategori5,
      "scoreKategori5": scoreKategori5,
      "kategori6" : kategori6,
      "scoreKategori6": scoreKategori6,
      "kategori7" : kategori7,
      "scoreKategori7": scoreKategori7,
      "kategori8" : kategori8,
      "scoreKategori8": scoreKategori8,
      "kategori9" : kategori9,
      "scoreKategori9": scoreKategori9,
      "kategori10" : kategori10,
      "scoreKategori10": scoreKategori10,
      "kategori11" : kategori11,
      "scoreKategori11": scoreKategori11,
      "kategori12" : kategori12,
      "scoreKategori12": scoreKategori12,
      "kategori13" : kategori13,
      "scoreKategori13": scoreKategori13,
      "kategori14" : kategori14,
      "scoreKategori14": scoreKategori14,
      "kategori15" : kategori15,
      "scoreKategori15": scoreKategori15,
      "kategori16" : kategori16,
      "scoreKategori16": scoreKategori16,
      "kategori17" : kategori17,
      "scoreKategori17": scoreKategori17,
      "kategori18" : kategori18,
      "scoreKategori18": scoreKategori18,
      "kategori19" : kategori19,
      "scoreKategori19": scoreKategori19,
      "kategori20" : kategori20,
      "scoreKategori20": scoreKategori20,
      "kategori21" : kategori21,
      "scoreKategori21": scoreKategori21,
      "kategori22" : kategori22,
      "scoreKategori22": scoreKategori22,
      "kategori23" : kategori23,
      "scoreKategori23": scoreKategori23,
      "kategori24" : kategori24,
      "scoreKategori24": scoreKategori24,
      "kategori25" : kategori25,
      "scoreKategori25": scoreKategori25,
      "kategori26" : kategori26,
      "scoreKategori26": scoreKategori26,
      "kategori27" : kategori27,
      "scoreKategori27": scoreKategori27,
      "kategori28" : kategori28,
      "scoreKategori28": scoreKategori28,
      "kategori29" : kategori29,
      "scoreKategori29": scoreKategori29,
      "kategori30" : kategori30,
      "scoreKategori30": scoreKategori30,
      "kategori31" : kategori31,
      "scoreKategori31": scoreKategori31,
      "kategori32" : kategori32,
      "scoreKategori32": scoreKategori32,
      "kategori33" : kategori33,
      "scoreKategori33": scoreKategori33,
      "kategori34" : kategori34,
      "scoreKategori34": scoreKategori34,
      "kategori35" : kategori35,
      "scoreKategori35": scoreKategori35,
      "kategori36" : kategori36,
      "scoreKategori36": scoreKategori36,
      "kategori37" : kategori37,
      "scoreKategori37": scoreKategori37,
      "kategori38" : kategori38,
      "scoreKategori38": scoreKategori38
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    print('Sudah dipanggil ke ${temp+=1}');
    final data = document.data();
    return UserModel(
        id: document.id,
        fullName: data?["FullName"],
        email: data?["Email"],
        userName: data?["UserName"],
        province: data?["Province"],
        dateOfBirth: data?["DateOfBirth"],
        password: data?["Password"],
        joinDate: data?["JoinDate"],
        profilePicture: data?["ProfilePicture"],
        kategori1: data?["kategori1"],
        scoreKategori1: data?["scoreKategori1"],
        kategori2: data?["kategori2"],
        scoreKategori2: data?["scoreKategori2"],
        kategori3: data?["kategori3"],
        scoreKategori3: data?["scoreKategori3"],
        kategori4: data?["kategori4"],
        scoreKategori4: data?["scoreKategori4"],
        kategori5: data?["kategori5"],
        scoreKategori5: data?["scoreKategori5"],
        kategori6: data?["kategori6"],
        scoreKategori6: data?["scoreKategori6"],
        kategori7: data?["kategori7"],
        scoreKategori7: data?["scoreKategori7"],
        kategori8: data?["kategori8"],
        scoreKategori8: data?["scoreKategori8"],
        kategori9: data?["kategori9"],
        scoreKategori9: data?["scoreKategori9"],
        kategori10: data?["kategori10"],
        scoreKategori10: data?["scoreKategori10"],
        kategori11: data?["kategori11"],
        scoreKategori11: data?["scoreKategori11"],
        kategori12: data?["kategori12"],
        scoreKategori12: data?["scoreKategori12"],
        kategori13: data?["kategori13"],
        scoreKategori13: data?["scoreKategori13"],
        kategori14: data?["kategori14"],
        scoreKategori14: data?["scoreKategori14"],
        kategori15: data?["kategori15"],
        scoreKategori15: data?["scoreKategori15"],
        kategori16: data?["kategori16"],
        scoreKategori16: data?["scoreKategori16"],
        kategori17: data?["kategori17"],
        scoreKategori17: data?["scoreKategori17"],
        kategori18: data?["kategori18"],
        scoreKategori18: data?["scoreKategori18"],
        kategori19: data?["kategori19"],
        scoreKategori19: data?["scoreKategori19"],
        kategori20: data?["kategori20"],
        scoreKategori20: data?["scoreKategori20"],
        kategori21: data?["kategori21"],
        scoreKategori21: data?["scoreKategori21"],
        kategori22: data?["kategori22"],
        scoreKategori22: data?["scoreKategori22"],
        kategori23: data?["kategori23"],
        scoreKategori23: data?["scoreKategori23"],
        kategori24: data?["kategori24"],
        scoreKategori24: data?["scoreKategori24"],
        kategori25: data?["kategori25"],
        scoreKategori25: data?["scoreKategori25"],
        kategori26: data?["kategori26"],
        scoreKategori26: data?["scoreKategori26"],
        kategori27: data?["kategori27"],
        scoreKategori27: data?["scoreKategori27"],
        kategori28: data?["kategori28"],
        scoreKategori28: data?["scoreKategori28"],
        kategori29: data?["kategori29"],
        scoreKategori29: data?["scoreKategori29"],
        kategori30: data?["kategori30"],
        scoreKategori30: data?["scoreKategori30"],
        kategori31: data?["kategori31"],
        scoreKategori31: data?["scoreKategori31"],
        kategori32: data?["kategori32"],
        scoreKategori32: data?["scoreKategori32"],
        kategori33: data?["kategori33"],
        scoreKategori33: data?["scoreKategori33"],
        kategori34: data?["kategori34"],
        scoreKategori34: data?["scoreKategori34"],
        kategori35: data?["kategori35"],
        scoreKategori35: data?["scoreKategori35"],
        kategori36: data?["kategori36"],
        scoreKategori36: data?["scoreKategori36"],
        kategori37: data?["kategori37"],
        scoreKategori37: data?["scoreKategori37"],
        kategori38: data?["kategori38"],
        scoreKategori38: data?["scoreKategori38"]
    );
  }

}