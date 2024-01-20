import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsilocal/src/features/authentication/models/user_model.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final province = TextEditingController();
  final dateOfBirth = TextEditingController();
  final userName = TextEditingController();
  final phoneNo = TextEditingController();


  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  var temp = 0;

  getUserData()async{
    print('UserData dipanggil ${temp+=1} kali');
    final email = _authRepo.firebaseUser?.email;
    if(email != null){
      print('Checkpint 22');
      print('Test  1 '+ _userRepo.getSingelUserDetails(email).toString());
      return await _userRepo.getSingelUserDetails(email);
    } else{
      print('Error' + "Login to continue");
    }

  }

  // Future<Null> getsingelUser() async{
  //   Null response = null;
  //   print('UserDatasingel record dipanggil kali');
  //   final email = _authRepo.firebaseUser?.email;
  //   if(email != null){
  //     print('Checkpint 22');
  //     print('Test  1 '+ _userRepo.getSingelUserDetails(email).toString());
  //     response =  (await _userRepo.getSingelUserDetails(email)) as Null;
  //   } else{
  //     print('Error' + "Login to continue");
  //   }
  //   return response;
  // }

  Future<List<UserModel>> getAllUser() async{
    return await _userRepo.getAllUserDetails();
  }


  updateRecord(UserModel user) async{
    final email = _authRepo.firebaseUser?.email;
    await _userRepo.updateUserRecord(user, email!);
  }

  uploadProfilePicture() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70,
    maxHeight: 512, maxWidth: 512);
    print("CheckPoint LALA Controller1");
    if(image!=null){
      final imageUrl = await _userRepo.uploadImage("/Users/Images/Profile/", image);

      // Update user image record
      Map<String, dynamic> json = {'ProfilePicture' : imageUrl};
      print("CheckPoint LALA Controller2");
      await _userRepo.updateSingelRecord(json);
      print("CheckPoint LALA Controller3");
      user.value.profilePicture = imageUrl;
      print("CheckPoint LALA Controller4");
    }
  }

  uploadImageByLink(String link) async{
    final image = link;
    if(image != null){
      final imageUrl = await _userRepo.uploadImage("/Users/Images/Profile/", image as XFile);
      Map<String, dynamic> json = {'ProfilePicture' : imageUrl};
      await _userRepo.updateSingelRecord(json);
      user.value.profilePicture = imageUrl;
      print("CheckPoint Upload Image Baru");
    }
  }

  String getprofileUrl(){
    getUserData();
    return _userRepo.userModelProfilePicture;
  }


}