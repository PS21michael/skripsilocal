import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
import 'package:skripsilocal/pages/profile/fill_profile.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import 'package:skripsilocal/pages/authentication/reset_password_screen.dart';

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
                const SizedBox(height: 30),
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
                //const SizedBox(height: 20),
                // theButton(
                //   text: 'Login Google',

                // onTap: () async {
                //   var i=0;
                //   var j=0;
                //   String emailTemp = "";
                //   SignInController.instance.googleSignIn();
                //   emailTemp = AuthenticationRepository.instance.getEmailGoogleSingIn();
                //   // Timer(Duration(seconds: 3), () {
                //   //   FirebaseAuth.instance.currentUser?.reload();
                //   //   print("Yeah, this line is printed after 3 seconds");
                //   // });
                //   FirebaseAuth.instance.currentUser?.reload();
                //   if(emailTemp == "") {
                //     print('Email null, silahkan coba lagi ${i+=1}');
                //   } else{
                //     print('Email sudah tidak null ${j+=1}');
                //     try{
                //       print('ChekpointGoogle 1');
                //       UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getEmailGoogleSingIn());
                //       print('ChekpointGoogle 2');
                //     } catch (e){
                //       print('ChekpointGoogle 3');
                //       print('Ada error $e');
                //     }
                //
                //     if(UserRepository.instance.getIsSuccessGetData() == "True"){
                //       print('ChekpointGoogle 4');
                //       if(UserRepository.instance.getUserModelEmail() == ""){
                //         print('ChekpointGoogle 5');
                //         Map<String, dynamic> json = {'Email' : AuthenticationRepository.instance.getEmailGoogleSingIn()};
                //         userRepo.updateSingelRecord(json);
                //       }
                //       if(UserRepository.instance.getUserModelProvince() == "ProvinsiUtama"){
                //         print('ChekpointGoogle 6');
                //         Get.to(()=>const UpdateScreenProfilePage());
                //       } else{
                //         print('ChekpointGoogle 7');
                //         Get.to(()=>const HomePage());
                //       }
                //     } else{
                //       print('ChekpointGoogle 8');
                //       print('Email yang diterima page : ${AuthenticationRepository.instance.getEmailGoogleSingIn()}');
                //       final user = UserModel(
                //           fullName: randomNames.manFullName(),
                //           email: AuthenticationRepository.instance.getEmailGoogleSingIn(),
                //           userName: generateUserName(randomNames.manFullName()),
                //           province: "ProvinsiUtama",
                //           dateOfBirth: "01-01-1900",
                //           password: "Login with Google",
                //           joinDate: DateTime.now().toString(),
                //           profilePicture: 'https://firebasestorage.googleapis.com/v0/b/indonesia-memilih-c26b0.appspot.com/o/Users%2FImages%2FProfile%2FDefaultImageProject.jpg?alt=media&token=6b2e46b5-a2f6-4377-ade1-7a1046724b8c');
                //       print('ChekpointGoogle 9');
                //       await userRepo.createUer(user);
                //       print('ChekpointGoogle 10');
                //       Get.to(()=>const UpdateScreenProfilePage());
                //       print('ChekpointGoogle 11');
                //     }
                //   }
                // },
                // ),
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
                          // Timer(Duration(seconds: 3), () {
                          //   FirebaseAuth.instance.currentUser?.reload();
                          //   print("Yeah, this line is printed after 3 seconds");
                          // });
                          FirebaseAuth.instance.currentUser?.reload();
                          if(emailTemp == "") {
                            showCustomSnackbar(
                              "Error!",
                              "Opps terjadi kesalahan \nSilahkan coba lagi ${i+=1}",
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
                              } else{
                                print('ChekpointGoogle 7');
                                Get.to(()=>const HomePage());
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
                                  profilePicture: 'https://firebasestorage.googleapis.com/v0/b/indonesia-memilih-c26b0.appspot.com/o/Users%2FImages%2FProfile%2FDefaultImageProject.jpg?alt=media&token=6b2e46b5-a2f6-4377-ade1-7a1046724b8c',
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
                              print('ChekpointGoogle 9');
                              await userRepo.createUer(user);
                              print('ChekpointGoogle 10');
                              Get.to(()=>const FillProfile());
                              print('ChekpointGoogle 11');
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
                    )

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