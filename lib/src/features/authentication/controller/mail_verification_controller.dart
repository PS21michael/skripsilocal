import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';

class MailVerificationController extends GetxController{

  late Timer _timer;

  @override
  void onInit(){
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();

  }
  Future<void> sendVerificationEmail() async {

    try{
      await AuthenticationRepository.instance.sendEmailVerification();
    }catch(e){
      // Helper.errorSncakBar();
      print(e);
      rethrow;
    }

  }

  void setTimerForAutoRedirect(){
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified){
        timer.cancel();
        // AuthenticationRepository.instance.setInitialScreen(user);
      }
    });
  }

  void manuallyCheckEmailVerificationStatus(){
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user!.emailVerified){
      AuthenticationRepository.instance.setInitialScreen(user);
    }
  }

}