import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/controller/signup_controller.dart';
import 'package:skripsilocal/models/user_model.dart';
import 'package:skripsilocal/pages/authentication/login_page.dart';
import 'package:skripsilocal/pages/components/button.dart';
import 'package:skripsilocal/pages/components/my_textfield.dart';
import 'package:skripsilocal/pages/news/explore.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var randomNames = RandomNames(Zone.us);

  final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final repasswordController = TextEditingController();

  static String generateUserName(fullName){
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "User_$camelCaseUsername";
    return usernameWithPrefix;
  }

  void SignUpUser(){}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    child: Text(
                      "Langsung baca berita!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {
                      Get.to(()=>const ExplorePage());
                    },
                  ),
                ),
                Image.asset(
                  'assets/logo.jpg',
                  width: 200,
                  height: 200,
                ),
                const Text(
                  'Daftar dulu yuk !',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: controller.email,
                  hintText: 'Email',
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
                  controller: controller.confirmPassword,
                  hintText: 'Konfirmasi Password',
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                theButton(
                  text: 'Sign Up',
                  onTap: (){

                    // Data yg akan di assign untuk pertama kali
                    final user = UserModel(
                        fullName: randomNames.manFullName(),
                        email: controller.email.text.trim(),
                        userName: generateUserName(randomNames.manFullName()),
                        province: "ProvinsiUtama",
                        dateOfBirth: "01-01-1900",
                        password: controller.password.text.trim(),
                        joinDate: DateTime.now().toString(),
                        profilePicture: 'https://firebasestorage.googleapis.com/v0/b/indonesia-memilih-c26b0.appspot.com/o/Users%2FImages%2FProfile%2FDefaultImageProject.jpg?alt=media&token=6b2e46b5-a2f6-4377-ade1-7a1046724b8c',
                        // Adding
                        kategori1: 'Nasional',
                        scoreKategori1: 0,
                        kategori2: 'Bisnis',
                        scoreKategori2: 0,
                        kategori3: 'Politik',
                        scoreKategori3: 0,
                        kategori4: 'Hukum',
                        scoreKategori4: 0,
                        kategori5: 'Ekonomi',
                        scoreKategori5: 0,
                        kategori6: 'Olahraga',
                        scoreKategori6: 0,
                        kategori7: 'Teknologi',
                        scoreKategori7: 0,
                        kategori8: 'Otomotif',
                        scoreKategori8: 0,
                        kategori9: 'Internasional',
                        scoreKategori9: 0,
                        kategori10: 'Bola',
                        scoreKategori10: 0,
                        kategori11: 'Selebritis',
                        scoreKategori11: 0,
                        kategori12: 'Lifestyle',
                        scoreKategori12: 0,
                        kategori13: 'Hiburan',
                        scoreKategori13: 0,
                        kategori14: 'Jakarta',
                        scoreKategori14: 0,
                        kategori15: 'Market',
                        scoreKategori15: 0,
                        kategori16: 'News',
                        scoreKategori16: 0,
                        kategori17: 'Cantik',
                        scoreKategori17: 0,
                        kategori18: 'Travel',
                        scoreKategori18: 0,
                        kategori19: 'Syariah',
                        scoreKategori19: 0,
                        kategori20: 'Islam',
                        scoreKategori20: 0,
                        kategori21: 'Sains',
                        scoreKategori21: 0,
                        kategori22: 'Edukasi',
                        scoreKategori22: 0,
                        kategori23: 'Kesehatan',
                        scoreKategori23: 0,
                        kategori24: 'Humaniora',
                        scoreKategori24: 0,
                        kategori25: 'Entrepreneur',
                        scoreKategori25: 0,
                        kategori26: 'Opini',
                        scoreKategori26: 0,
                        kategori27: 'Khas',
                        scoreKategori27: 0,
                        kategori28: 'Jateng',
                        scoreKategori28: 0,
                        kategori29: 'Daerah',
                        scoreKategori29: 0,
                        kategori30: 'Khazanah',
                        scoreKategori30: 0,
                        kategori31: 'Leisure',
                        scoreKategori31: 0,
                        kategori32: 'Metro',
                        scoreKategori32: 0,
                        kategori33: 'Ekbis',
                        scoreKategori33: 0,
                        kategori34: 'Kalam',
                        scoreKategori34: 0,
                        kategori35: 'Difabel',
                        scoreKategori35: 0,
                        kategori36: 'Creativelab',
                        scoreKategori36: 0,
                        kategori37: 'Inforial',
                        scoreKategori37: 0,
                        kategori38: 'Event',
                        scoreKategori38: 0,
                        //Adding
                    );

                    SignUpController.instace.registerAndCreateUser(controller.email.text.trim(), controller.password.text.trim(),
                        controller.confirmPassword.text.trim(), user);
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
