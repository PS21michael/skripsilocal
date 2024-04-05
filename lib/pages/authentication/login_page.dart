import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/controller/signin_controller.dart';
import 'package:skripsilocal/models/user_model.dart';
import 'package:skripsilocal/pages/authentication/register_page.dart';
import 'package:skripsilocal/pages/components/button.dart';
import 'package:skripsilocal/pages/components/my_textfield.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/pages/components/square_tile.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/news/explore.dart';
import 'package:skripsilocal/pages/profile/fill_profile.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import 'package:skripsilocal/pages/authentication/reset_password_screen.dart';

import '../profile/pickCategory.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.put(SignInController());

  final _formkey = GlobalKey<FormState>();

  final userRepo = Get.put(UserRepository());

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void SignInUser(){}

  var randomNames = RandomNames(Zone.us);

  static String generateUserName(fullName){
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "User_$camelCaseUsername";
    return usernameWithPrefix;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          key : _formkey,
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
                // const SizedBox(height: 10),
                Image.asset(
                  'assets/logo.jpg',
                  width: 200,
                  height: 200,
                ),
                // const SizedBox(height: 10),
                const Text(
                  'Selamat datang kembali!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: controller.email,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: controller.password,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                // Forget Password
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                          'Lupa Password?'
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                          onTap: (){
                            Get.to(()=>const ResetPasswordScreen());
                          },
                          child : const Text(
                            'Ganti Password',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                theButton(
                  text: 'Sign In',
                  onTap: (){
                    print('CheckPoint login 1');
                    UserRepository.instance.getSingelUserDetails(controller.email.text.trim());
                    SignInController.instance.loginUser(controller.email.text.trim(), controller.password.text.trim());
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
                        child: Text(
                          'Atau lanjutkan dengan',
                          style: TextStyle(
                            color: Colors.black,
                          ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                        onTap: () async {
                          var i=0;
                          var j=0;
                          String emailTemp = "";
                          SignInController.instance.googleSignIn();
                          emailTemp = AuthenticationRepository.instance.getEmailGoogleSingIn();
                          FirebaseAuth.instance.currentUser?.reload();
                          if(emailTemp == "") {
                            showCustomSnackbar(
                              "Maaf!",
                              "Terjadi kesalahan \nSilahkan tekan sekali lagi \n Untuk melanjutkan",
                              isError: true,
                            );
                          } else{
                            print('Email sudah tidak null ${j+=1}');
                            try{
                              print('ChekpointGoogle 1');
                              UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getEmailGoogleSingIn());
                              print('ChekpointGoogle 2');
                            } catch (e){
                              print('ChekpointGoogle 3');
                              print('Ada error $e');
                            }

                            if(UserRepository.instance.getIsSuccessGetData() == "True"){
                              print('ChekpointGoogle 4');
                              if(UserRepository.instance.getUserModelEmail() == ""){
                                print('ChekpointGoogle 5');
                                Map<String, dynamic> json = {'Email' : AuthenticationRepository.instance.getEmailGoogleSingIn()};
                                userRepo.updateSingelRecord(json);
                              }
                              if(UserRepository.instance.getUserModelProvince() == "ProvinsiUtama"){
                                print('ChekpointGoogle 6');
                                Get.to(()=>const FillProfile());
                              } if(UserRepository.instance.getUserModelInitScore() == "NO"){
                                Get.offAll(()=> PickCategory());
                              }else{
                                print('ChekpointGoogle 7');
                                await Future.delayed(Duration(seconds: 1));
                                UserRepository.instance.getSingelUserDetails(emailTemp);

                                Get.to(()=>const ExplorePage());
                              }
                            } else{
                              print('ChekpointGoogle 8');
                              await Future.delayed(Duration(seconds: 1));
                              UserRepository.instance.getSingelUserDetails(emailTemp);
                              print("Email dari DB : "+UserRepository.instance.getUserModelEmail());
                              print("Status dari DB : "+UserRepository.instance.getIsSuccessGetData());

                              print('Email yang diterima page : ${AuthenticationRepository.instance.getEmailGoogleSingIn()}');
                              print('Email yang diterima page1 : ${emailTemp}');

                              await Future.delayed(Duration(seconds: 1));
                              UserRepository.instance.getSingelAllUserFromEmail(emailTemp);

                              await Future.delayed(Duration(milliseconds: 200));
                              String isUserDBExist = UserRepository.instance.getIsUserEmailAvail();
                              print('Status yang diterima page : ${isUserDBExist}');
                              if(isUserDBExist==""){
                                await Future.delayed(Duration(seconds: 1));
                                UserRepository.instance.getSingelAllUserFromEmail(emailTemp);

                                await Future.delayed(Duration(milliseconds: 200));
                                isUserDBExist = UserRepository.instance.getIsUserEmailAvail();
                              }
                              if(isUserDBExist=="NO"){

                                final user = UserModel(
                                  fullName: randomNames.manFullName(),
                                  email: AuthenticationRepository.instance.getEmailGoogleSingIn(),
                                  userName: generateUserName(randomNames.manFullName()),
                                  province: "ProvinsiUtama",
                                  dateOfBirth: "01-01-1900",
                                  joinDate: DateTime.now().toString(),
                                  profilePicture: 'https://firebasestorage.googleapis.com/v0/b/indonesia-memilih-c26b0.appspot.com/o/Users%2FImages%2FProfile%2FDefaultImageProject.jpg?alt=media&token=6b2e46b5-a2f6-4377-ade1-7a1046724b8c',
                                  // Adding
                                  scoreKategori1: 0,
                                  scoreKategori2: 0,
                                  scoreKategori3: 0,
                                  scoreKategori4: 0,
                                  scoreKategori5: 0,
                                  scoreKategori6: 0,
                                  scoreKategori7: 0,
                                  scoreKategori8: 0,
                                  scoreKategori9: 0,
                                  scoreKategori10: 0,
                                  scoreKategori11: 0,
                                  scoreKategori12: 0,
                                  scoreKategori13: 0,
                                  scoreKategori14: 0,
                                  scoreKategori15: 0,
                                  scoreKategori16: 0,
                                  scoreKategori17: 0,
                                  scoreKategori18: 0,
                                  scoreKategori19: 0,
                                  scoreKategori20: 0,
                                  scoreKategori21: 0,
                                  scoreKategori22: 0,
                                  scoreKategori23: 0,
                                  scoreKategori24: 0,
                                  scoreKategori25: 0,
                                  scoreKategori26: 0,
                                  scoreKategori27: 0,
                                  scoreKategori28: 0,
                                  scoreKategori29: 0,
                                  scoreKategori30: 0,
                                  scoreKategori31: 0,
                                  scoreKategori32: 0,
                                  scoreKategori33: 0,
                                  scoreKategori34: 0,
                                  scoreKategori35: 0,
                                  scoreKategori36: 0,
                                  scoreKategori37: 0,
                                  scoreKategori38: 0,
                                  //Adding
                                );
                                print('ChekpointGoogle 9');
                                await Future.delayed(Duration(seconds: 2));
                                await userRepo.createUer(user);
                                print('ChekpointGoogle 10');

                                await Future.delayed(Duration(seconds: 1));
                                UserRepository.instance.getSingelUserDetails(emailTemp);

                                Get.to(()=>const FillProfile());
                                print('ChekpointGoogle 11');


                              } else {
                                print("Checkpoint login 15");
                                await Future.delayed(Duration(seconds: 1));
                                UserRepository.instance.getSingelUserDetails(emailTemp);

                                Get.to(()=>const ExplorePage());
                              }

                            }
                          }
                        },
                        imagePath: 'assets/google.png'
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                        'Belum punya akun?'
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context)=> const RegisterPage()));
                        },
                        child : const Text(
                          'Daftar dulu!',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
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