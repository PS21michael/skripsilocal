import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';

class SignInController extends GetxController{

  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> googleSignIn() async{
    try{
      await Future.delayed(const Duration(milliseconds: 150));
      await AuthenticationRepository.instance.signup();
      // await Future.delayed(const Duration(milliseconds: 100));
      // emailGoogle = AuthenticationRepository.instance.getEmailGoogleSingIn();
      // print('CheckPointGoogle 2, Email udah di assign $emailGoogle');

      // await userRepo.createUer(user);
    }catch (e){
      print('Error In Sign In With Google : $e');
    }
  }

  Future<void> loginUser(String email, String password) async {

    try{
      final auth = AuthenticationRepository.instance;
      await auth.loginUserWithEmailAndPassword(email, password);
    } catch(e){
      print('Error In Login : $e');
    }
  }

}