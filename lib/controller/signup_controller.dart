import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skripsilocal/models/user_model.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';


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

  final isLoading = false.obs;

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
      // print('Errror in Register $e');
    }
  }

}