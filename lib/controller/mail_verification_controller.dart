import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/controller/signin_controller.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import '../../../../pages/profile/fill_profile.dart';
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
      // print(e);
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
        // print('ChekpointGoogle 6');
        Get.to(()=>const FillProfile());
      }
      //
      //
      // AuthenticationRepository.instance.setInitialScreen(user);
    }
  }

}