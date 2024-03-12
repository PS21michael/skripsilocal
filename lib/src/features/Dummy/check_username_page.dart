import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/features/authentication/controller/signup_controller.dart';

import '../../../pages/components/button.dart';
import '../../../pages/components/my_textfield.dart';
import '../../../pages/home_page.dart';
import '../../repository/user_repository/user_repository.dart';
import '../authentication/screens/error_toast/show_toast.dart';

class checkUsernamePage extends StatefulWidget {

  const checkUsernamePage({super.key});

  @override
  State<checkUsernamePage> createState() => _checkUsernamePage();
}

class _checkUsernamePage extends State<checkUsernamePage> {

  final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();

  void SignUpUser(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Check Username',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: usernameController,
                  hintText: 'User Name',
                  obscureText: false,
                ),
                const SizedBox(height: 30),
                theButton(
                    text: 'Check Username',
                  onTap: () async{
                      print("username yg dikirim "+ usernameController.text.trim());
                    await UserRepository.instance.checkListUserName(usernameController.text.trim());
                    print("Checkpoint username");
                    String usernameAvail = UserRepository.instance.isUsernameAvail;
                    if(usernameAvail == "NO"){
                      showToast(message: "Username tidak bisa digunakan");
                    } else if(usernameAvail == "YES"){
                      showToast(message: "Username bisa digunakan");
                    }
                    // Get.to(()=>const HomePage());
                  },
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
