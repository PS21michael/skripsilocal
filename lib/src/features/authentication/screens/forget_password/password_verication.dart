import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/src/features/authentication/controller/forget_password_controller.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';

import '../../../../../pages/components/my_textfield.dart';
import '../../../../../pages/profile/login_page.dart';

class PasswordVerification extends StatelessWidget{
  const PasswordVerification ({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10 * 5,
              left: 10,
              right: 10,
              bottom: 10 * 2
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LineAwesomeIcons.envelope_open, size: 100,),
              Text('Password Verification'.tr, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: 10,),
              MyTextField(
                controller: controller.email,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 30),

              Text(
                "Email has been send Verif".tr,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 200,
                child: OutlinedButton(child: Text("Continue".tr),
                  onPressed: (){Get.to(()=>const LoginPage());},),
              ),
              const SizedBox(height: 20,),
              TextButton(onPressed: ()=> ForgetPasswordController.instance.resendPasswordResetEmail(),
                child: Text("Resend Email".tr),
              ),
              TextButton(onPressed: ()=> AuthenticationRepository.instance.logout(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(LineAwesomeIcons.alternate_long_arrow_left),
                      const SizedBox(width: 5,),
                      Text("Back To Login".tr.toLowerCase()),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}