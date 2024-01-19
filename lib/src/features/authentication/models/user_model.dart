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

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.userName,
    required this.province,
    required this.dateOfBirth,
    required this.password,
    required this.joinDate,
    required this.profilePicture
  });

  static UserModel empty() => UserModel(id : '',fullName: '', email: '', userName: '', province: '', dateOfBirth: '', password: '', profilePicture: '', joinDate:'');

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
      "ProfilePicture" : profilePicture
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
        profilePicture: data?["ProfilePicture"]);
  }

}