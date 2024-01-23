import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/features/authentication/controller/forget_password_controller.dart';
import 'package:skripsilocal/src/features/authentication/screens/forget_password/password_verication.dart';
import '../../../../../pages/components/button.dart';
import '../../../../../pages/components/my_textfield.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';

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
    print('Screen forget password berhasil didapat');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          key : _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),
                const Text(
                  'Please Fill Your email here',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 50),
                // TextFormField(
                //   controller: controller.email,
                //   validator: Validation.validateEmail(value),
                //   decoration: InputDecoration(
                //     hintText: "Fill your email",
                //   ),
                // ),
                MyTextField(
                  controller: controller.email,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 30),
                theButton(
                  text: 'Send Email verification',
                  onTap: (){
                    controller.sendPasswordResetEmail();
                    Get.to(()=>const PasswordVerification());
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blueGrey.shade400,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.blueGrey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 4),
                  ],
                ),
                const SizedBox(height: 20),
                const Image(
                  image: AssetImage('assets/logoPemilu.png'),
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
