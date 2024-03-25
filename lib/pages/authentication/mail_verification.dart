import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:skripsilocal/controller/mail_verification_controller.dart';
import 'package:skripsilocal/pages/components/button.dart';

class MailVerification extends StatelessWidget{
  const MailVerification ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final controller = Get.put(MailVerificationController());
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                    CupertinoIcons.mail,
                    size: 130,
                ),
                Text(
                  'Check your email inbox!',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Please  verify your email before click 'Continue'",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                theButton(
                    onTap: ()=>controller.manuallyCheckEmailVerificationStatus(),
                    text: 'Continue',
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        "Don't get a email?",
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: ()=> controller.sendVerificationEmail(),
                      child : const Text(
                        'Resend email',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                // TextButton(onPressed: ()=> controller.sendVerificationEmail(),
                //     child: Text("Resend Email".tr),
                // ),
                // TextButton(onPressed: ()=> AuthenticationRepository.instance.logout(),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         const Icon(LineAwesomeIcons.alternate_long_arrow_left),
                //         const SizedBox(width: 5,),
                //         Text("Back To Login".tr.toLowerCase()),
                //       ],
                //     )
                // )
              ],
            ),
          ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}