import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/controller/mail_verification_controller.dart';
import 'package:skripsilocal/pages/components/button.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';

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
                const Text(
                  'Check your email inbox!',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Please  verify your email before click 'Continue'",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TheButton(
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
                      onTap: (){
                        showCustomSnackbar('Success', 'Email sent successfully', isError: false);
                        controller.sendVerificationEmail();
                      },
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
              ],
            ),
          ),
      ),
    );
    // throw UnimplementedError();
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }
}