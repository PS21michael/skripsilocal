import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/controller/forget_password_controller.dart';
import 'package:skripsilocal/pages/authentication/login_page.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
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
  final _authRepo = Get.put(AuthenticationRepository());
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    print('Screen forget password berhasil didapat');
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Untuk menyusun elemen secara vertikal di tengah halaman
                children: [
                  Image.asset(
                    'assets/logo.jpg',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Isi email untuk melakukan mengganti password!',
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
                  theButton(
                    text: 'Send Email',
                    onTap: () {
                      controller.sendPasswordResetEmail();
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
}
