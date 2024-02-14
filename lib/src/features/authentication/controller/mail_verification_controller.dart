import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/features/authentication/controller/signin_controller.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';

import '../../../../pages/profile/core/update_profile_new.dart';
import '../../../repository/user_repository/user_repository.dart';

class MailVerificationController extends GetxController{

  late Timer _timer;

  @override
  void onInit(){
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();

  }
  Future<void> sendVerificationEmail() async {
    final controller = Get.put(SignInController());
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
      if(UserRepository.instance.getUserModelProvince() == "ProvinsiUtama"){
        print('ChekpointGoogle 6');
        Get.to(()=>const UpdateProfile_New());
      }
      //
      //
      // AuthenticationRepository.instance.setInitialScreen(user);
    }
  }

}