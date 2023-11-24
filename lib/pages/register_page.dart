import 'package:flutter/material.dart';
import 'components/my_textfield.dart';
import 'components/button.dart';

class RegisterPage extends StatelessWidget {

  RegisterPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final repasswordController = TextEditingController();
  final birthdayController = TextEditingController();
  final provinsicontroller = TextEditingController();

  void SignUpUser(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 30),
                MyTextField(
                  controller: nameController,
                  hintText: 'Nama Lengkap',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: provinsicontroller,
                  hintText: 'Provinsi',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: birthdayController,
                  hintText: 'Tanggal Lahir',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: repasswordController,
                  hintText: 'Konfirmasi Password',
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                theButton(
                  text: 'Sign Up',
                  onTap: SignUpUser,
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?'
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Login yuk!',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                const Image(
                  image: AssetImage('assets/logoPemilu.png'),
                  height: 120,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
