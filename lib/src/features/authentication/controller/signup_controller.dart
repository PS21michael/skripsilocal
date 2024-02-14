import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';

import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController{

  static SignUpController get instace => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final fullName = TextEditingController();
  final province = TextEditingController();
  final dateOfBirth = TextEditingController();
  final userName = TextEditingController();
  final phoneNo = TextEditingController();
  final profilePicture = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  // Loader
  final isLoading = false.obs;

  Future<void> registerUser(String email, String password, String confirmPassword) async {
    try{
      final auth = AuthenticationRepository.instance;
      await auth.createUserWithEmailAndPassword(email, password, confirmPassword);
    } catch(e){
      isLoading.value = false;
      print('Errror in Register $e');
    }
  }

  uploadImageByLink(String link) async{
    final image = link;
    print("CheckPoint Upload Image Baru 2");
    final imageUrl = await userRepo.uploadImage("/Users/Images/Profile/", image as XFile);
    print("CheckPoint Upload Image Baru 2");
    Map<String, dynamic> json = {'ProfilePicture' : imageUrl};
    await userRepo.updateSingelRecord(json);
    user.value.profilePicture = imageUrl;
    print("CheckPoint Upload Image Baru 3");
    }

  Future<void> registerAndCreateUser(String email, String password, String confirmPassword, UserModel user) async {
    try{
      final auth = AuthenticationRepository.instance;
      await auth.createUserWithEmailAndPassword(email, password, confirmPassword);
      if(AuthenticationRepository.instance.getisSuccessCreateUser() == 'True'){
        await userRepo.createUer(user);
      }
      UserRepository.instance.getSingelUserDetails(email);
    } catch(e){
      isLoading.value = false;
      print('Errror in Register $e');
    }
  }

  void loginUser(String email, String password){
    AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
  }

  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  Future<void> createUser(UserModel user) async {
    print('Befire user : $user');
    await userRepo.createUer(user);
    print('after user : $user');
    registerUser(user.email, user.password, "test");
  }

  Future<void> createUserDefault(UserModel user) async {
    print('User Akan Dibuat');
    await userRepo.createUer(user);
  }



  void logout(){
    AuthenticationRepository.instance.logout();
    // print('User : ${AuthenticationRepository.instance.firebaseUser}');
  }
}