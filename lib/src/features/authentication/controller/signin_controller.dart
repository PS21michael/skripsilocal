
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';

import '../../../repository/user_repository/user_repository.dart';

class SignInController extends GetxController{

  static SignInController get instance => Get.find();

  String emailGoogle = "";

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userRepo = Get.put(UserRepository());

  // Loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;

  void signGoogle()async{
    final auth = AuthenticationRepository.instance;
    await auth.signInWithGoogle();
  }


  Future<void> googleSignIn()async{
    try{
      emailGoogle = AuthenticationRepository.instance.getEmailGoogleSingIn();
      print('CheckPointGoogle 2, Email udah di assign $emailGoogle');
      await AuthenticationRepository.instance.signup();

      // await userRepo.createUer(user);
    }catch (e){
      print('Error In Sign In With Google : $e');
    }
  }

  String getEmailGoogle(){
    return emailGoogle;
  }

  Future<void> loginUser(String email, String password) async {

    try{
      final auth = AuthenticationRepository.instance;
      await auth.loginUserWithEmailAndPassword(email, password);
    } catch(e){
      isLoading.value = false;
      print('Error In Login : $e');
    }
  }

  void logout(){
    AuthenticationRepository.instance.logout();
  }


}