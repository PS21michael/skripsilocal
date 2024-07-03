import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/controller/forget_password_controller.dart';
import 'package:skripsilocal/pages/authentication/login_page.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import '../components/button.dart';
import '../components/my_textfield.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final controller = Get.put(ForgetPasswordController());
  final _formkey = GlobalKey<FormState>();
  // final _authRepo = Get.put(AuthenticationRepository());
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // print('Screen forget password berhasil didapat');
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.jpg',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Fill your email to change your password!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: controller.email,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  TheButton(
                    text: 'Send Email',
                    onTap: () {
                      controller.sendPasswordResetEmail();
                      showCustomSnackbar('Success', 'Email sent successfully', isError: false);
                      Future.delayed(const Duration(seconds: 5));
                      Get.to(() => const LoginPage());
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }
}
