import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail()async{
    try{
      await AuthenticationRepository.instance.sendEmailForgetPassword(email.text.trim());
      // print('Email Sent' 'Email link sent to reset your password');
    } catch (e){
      // print('Error di controller send password : $e');
      rethrow;
    }
  }

  resendPasswordResetEmail() async{
    try{
      await AuthenticationRepository.instance.sendEmailForgetPassword(email.text.trim());
      // print('Email has been Sent' 'Email link sent to reset your password');
    } catch (e){
      // print('Error di controller send password : $e');
      rethrow;
    }
  }

}