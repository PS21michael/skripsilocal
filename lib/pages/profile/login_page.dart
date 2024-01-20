import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/pages/components/square_tile.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/profile/register_page.dart';
import 'package:skripsilocal/src/features/authentication/controller/signin_controller.dart';
import 'package:skripsilocal/src/features/authentication/screens/forget_password/reset_password_screen.dart';
import 'package:skripsilocal/src/repository/authentication_repository/authentication_repository.dart';
import '../../src/features/authentication/controller/profile_controller.dart';
import '../../src/features/authentication/controller/signup_controller.dart';
import '../../src/features/authentication/models/user_model.dart';
import '../../src/repository/user_repository/user_repository.dart';
import '../components/my_textfield.dart';
import '../components/button.dart';
import 'core/manage_user_screen.dart';
import 'core/update_screen_profile_advanced.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key});

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

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "User_$camelCaseUsername";
    return usernameWithPrefix;
  }


  @override
  Widget build(BuildContext context) {
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
                  'Selamat datang kembali calon pemilih !',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 50),
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
                const SizedBox(height: 30),

                // Forget Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>ResetPasswordScreen());
                      },
                      // onTap: (){
                      //   showModalBottomSheet(
                      //       context: context,
                      //       builder: (context) => Container(
                      //         padding: const EdgeInsets.all(30.0),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text('Make Selection', style: Theme.of(context).textTheme.headline2,),
                      //             Text('Select one of the options given below to reset your password.',
                      //               style: Theme.of(context).textTheme.bodyText2,),
                      //             const SizedBox(height: 10.0,),
                      //             Container(
                      //               padding: const EdgeInsets.all(20.0),
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(10.0),
                      //                 color: Colors.grey.shade200,
                      //               ),
                      //             ),
                      //
                      //           ],
                      //         ),
                      //       ),
                      //   );
                      // },
                      
                        // onTap: (){
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder:
                        //           (context)=> RegisterPage()));
                        // },
                        child : const Text(
                          'Forget Password',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    )

                  ],
                ),

                // Forget Password


                theButton(
                  text: 'Sign In',
                  onTap: (){
                      UserRepository.instance.getSingelUserDetails(controller.email.text.trim());
                      SignInController.instance.loginUser(controller.email.text.trim(), controller.password.text.trim());
                    },
                ),
                const SizedBox(height: 20),
                theButton(
                  text: 'Login Google',

                  onTap: () async {
                    var i=0;
                    var j=0;
                    String emailTemp = "";
                    SignInController.instance.googleSignIn();
                    emailTemp = AuthenticationRepository.instance.getEmailGoogleSingIn();
                    // Timer(Duration(seconds: 3), () {
                    //   FirebaseAuth.instance.currentUser?.reload();
                    //   print("Yeah, this line is printed after 3 seconds");
                    // });
                    FirebaseAuth.instance.currentUser?.reload();
                    if(emailTemp == "") {
                      print('Email null, silahkan coba lagi ${i+=1}');
                    } else{
                      print('Email sudah tidak null ${j+=1}');
                      try{
                        print('ChekpointGoogle 1');
                        UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getEmailGoogleSingIn());
                        print('ChekpointGoogle 2');
                      } catch (e){
                        print('ChekpointGoogle 3');
                        print('Ada error ${e}');
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
                          Get.to(()=>UpdateScreenProfilePage());
                        } else{
                          print('ChekpointGoogle 7');
                          Get.to(()=>HomePage());
                        }
                      } else{
                        print('ChekpointGoogle 8');
                        print('Email yang diterima page : ${AuthenticationRepository.instance.getEmailGoogleSingIn()}');
                        final user = UserModel(
                            fullName: randomNames.manFullName(),
                            email: AuthenticationRepository.instance.getEmailGoogleSingIn(),
                            userName: generateUserName(randomNames.manFullName()),
                            province: "ProvinsiUtama",
                            dateOfBirth: "01-01-1900",
                            password: "Login with Google",
                            joinDate: DateTime.now().toString(),
                            profilePicture: 'https://firebasestorage.googleapis.com/v0/b/indonesia-memilih-c26b0.appspot.com/o/Users%2FImages%2FProfile%2FDefaultImageProject.jpg?alt=media&token=6b2e46b5-a2f6-4377-ade1-7a1046724b8c');
                        print('ChekpointGoogle 9');
                        await userRepo.createUer(user);
                        print('ChekpointGoogle 10');
                        Get.to(()=>UpdateScreenProfilePage());
                        print('ChekpointGoogle 11');
                      }

                    }
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
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
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                        //onTap: ()=> ,

                        imagePath: 'assets/google.png'
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?'
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context)=> RegisterPage()));
                        },
                        child : const Text(
                          'Daftar dulu!',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    )

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
