import 'package:flutter/material.dart';
import 'components/my_textfield.dart';
import 'components/button.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void SignInUser(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),
              const Text(
                'Selamat datang kembali calon pemilih !',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 50),
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 30),
              theButton(
                text: 'Sign In',
                onTap: SignInUser,
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum punya akun?'
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Daftar dulu!',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              const Image(
                image: AssetImage('assets/logoPemilu.png'),
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
