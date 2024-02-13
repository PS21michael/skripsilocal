import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/src/features/authentication/controller/signup_controller.dart';
import '../../src/features/authentication/models/user_model.dart';
import '../components/my_textfield.dart';
import '../components/button.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final repasswordController = TextEditingController();

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
                  'Daftar dulu yuk !',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: controller.fullName,
                  hintText: 'Full Name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: controller.email,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: controller.userName,
                  hintText: 'User Name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: controller.province,
                  hintText: 'Provinsi',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: controller.dateOfBirth,
                  hintText: 'Tanggal Lahir',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: controller.phoneNo,
                  hintText: 'Phone Number',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                MyTextField(
                  controller: controller.password,
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
                  onTap: (){
                    // Create User Collection
                    print('Fullname : ${controller.fullName.text.trim()}');
                    final user = UserModel(
                        fullName: controller.fullName.text.trim(),
                        email: controller.email.text.trim(),
                        userName: controller.userName.text.trim(),
                        province: controller.province.text.trim(),
                        dateOfBirth: controller.dateOfBirth.text.trim(),
                        password: controller.password.text.trim(),
                        joinDate: "",
                        profilePicture: controller.profilePicture.text.trim(),
                        // Adding
                        kategori1: 'nasional',
                        scoreKategori1: 0,
                        kategori2: 'bisnis',
                        scoreKategori2: 0,
                        kategori3: 'politik',
                        scoreKategori3: 0,
                        kategori4: 'hukum',
                        scoreKategori4: 0,
                        kategori5: 'ekonomi',
                        scoreKategori5: 0,
                        kategori6: 'olahraga',
                        scoreKategori6: 0,
                        kategori7: 'teknologi',
                        scoreKategori7: 0,
                        kategori8: 'otomotif',
                        scoreKategori8: 0,
                        kategori9: 'internasional',
                        scoreKategori9: 0,
                        kategori10: 'bola',
                        scoreKategori10: 0,
                        kategori11: 'selebritis',
                        scoreKategori11: 0,
                        kategori12: 'lifestyle',
                        scoreKategori12: 0,
                        kategori13: 'hiburan',
                        scoreKategori13: 0,
                        kategori14: 'jakarta',
                        scoreKategori14: 0,
                        kategori15: 'market',
                        scoreKategori15: 0,
                        kategori16: 'news',
                        scoreKategori16: 0,
                        kategori17: 'cantik',
                        scoreKategori17: 0,
                        kategori18: 'travel',
                        scoreKategori18: 0,
                        kategori19: 'syariah',
                        scoreKategori19: 0,
                        kategori20: 'islam',
                        scoreKategori20: 0,
                        kategori21: 'sains',
                        scoreKategori21: 0,
                        kategori22: 'edukasi',
                        scoreKategori22: 0,
                        kategori23: 'kesehatan',
                        scoreKategori23: 0,
                        kategori24: 'humaniora',
                        scoreKategori24: 0,
                        kategori25: 'entrepreneur',
                        scoreKategori25: 0,
                        kategori26: 'opini',
                        scoreKategori26: 0,
                        kategori27: 'khas',
                        scoreKategori27: 0,
                        kategori28: 'jateng',
                        scoreKategori28: 0,
                        kategori29: 'daerah',
                        scoreKategori29: 0,
                        kategori30: 'khazanah',
                        scoreKategori30: 0,
                        kategori31: 'leisure',
                        scoreKategori31: 0,
                        kategori32: 'metro',
                        scoreKategori32: 0,
                        kategori33: 'ekbis',
                        scoreKategori33: 0,
                        kategori34: 'kalam',
                        scoreKategori34: 0,
                        kategori35: 'difabel',
                        scoreKategori35: 0,
                        kategori36: 'creativelab',
                        scoreKategori36: 0,
                        kategori37: 'inforial',
                        scoreKategori37: 0,
                        kategori38: 'event',
                        scoreKategori38: 0,
                        //Adding
                    );

                    SignUpController.instace.createUser(user);
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sudah punya akun?'
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context)=> const LoginPage()));
                      },
                      child : const Text(
                        'Login yuk!',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
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
