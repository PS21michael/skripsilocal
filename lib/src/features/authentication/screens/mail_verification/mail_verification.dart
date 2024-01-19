import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';

import '../../controller/mail_verification_controller.dart';

class MailVerification extends StatelessWidget{
  const MailVerification ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
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
              Text('Email Verification'.tr, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: 10,),
              Text(
                "Email Verif".tr,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 200,
                child: OutlinedButton(child: Text("Continue".tr),
                onPressed: ()=>controller.manuallyCheckEmailVerificationStatus(),),
              ),
              const SizedBox(height: 20,),
              TextButton(onPressed: ()=> controller.sendVerificationEmail(),
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