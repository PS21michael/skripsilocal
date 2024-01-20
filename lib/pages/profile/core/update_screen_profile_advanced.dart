import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/pages/components/square_tile.dart';
import 'package:skripsilocal/pages/profile/core/profile_creen.dart';
import 'package:skripsilocal/pages/profile/core/update_profile_screen.dart';
import 'package:skripsilocal/pages/profile/register_page.dart';
import 'package:skripsilocal/src/features/authentication/controller/profile_controller.dart';
import 'package:skripsilocal/src/features/authentication/controller/signin_controller.dart';
import 'package:skripsilocal/src/repository/user_repository/user_repository.dart';
import '../../../src/features/authentication/models/user_model.dart';
import '../../../src/repository/authentication_repository/authentication_repository.dart';
import '../../components/button.dart';
import '../../components/my_textfield.dart';

class UpdateScreenProfilePage extends StatefulWidget {

  UpdateScreenProfilePage({super.key});

  @override
  State<UpdateScreenProfilePage> createState() => _UpdateScreenProfilePageState();
}

class _UpdateScreenProfilePageState extends State<UpdateScreenProfilePage> {
  final controller = Get.put(SignInController());
  final _formkey = GlobalKey<FormState>();
  final _authRepo = Get.put(AuthenticationRepository());

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final provinceController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final joinDateController = TextEditingController();
  final passwordController = TextEditingController();

  void SignInUser(){}

  @override
  Widget build(BuildContext context) {
    var i =0;
    String idCustomer = UserRepository.instance.getUserModelId();
    String fullNameCustomer = UserRepository.instance.getUserModelFullName();
    String emailCustomer = UserRepository.instance.getUserModelEmail();
    String userNameCustomer = UserRepository.instance.getUserModelUserName();
    String provinceCustomer = UserRepository.instance.getUserModelProvince();
    String dateOfBirthCustomer = UserRepository.instance.getUserModelDateOfBirth();
    String passwordCustomer = UserRepository.instance.getUserModelPassword();
    String joinDateCustomer = UserRepository.instance.getUserModelJoinDate();
    String profilePictureCustomer = UserRepository.instance.getUserModelProfilePicture();

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
                  'Silahkan isi field yg mau di update',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 50),
                MyTextField(
                  controller: fullNameController,
                  hintText: fullNameCustomer,
                  obscureText: false,
                ),
                const SizedBox(height: 50),
                MyTextField(
                  controller: userNameController,
                  hintText: userNameCustomer,
                  obscureText: false,
                ),

                const SizedBox(height: 25),
                MyTextField(
                  controller: provinceController,
                  hintText: provinceCustomer,
                  obscureText: false,
                ),
                const SizedBox(height: 25),

                MyTextField(
                  controller: dateOfBirthController,
                  hintText: dateOfBirthCustomer,
                  obscureText: false,
                ),
                const SizedBox(height: 25),

                theButton(
                  text: 'Update Data',
                  onTap: (){

                    final user = UserModel(
                        fullName: fullNameController.text.trim() == "" ? fullNameCustomer : fullNameController.text.trim(),
                        email: emailCustomer,
                        userName: userNameController.text.trim() == "" ? userNameCustomer : userNameController.text.trim(),
                        province: provinceController.text.trim() == "" ? provinceCustomer : provinceController.text.trim(),
                        dateOfBirth: dateOfBirthController.text.trim() == "" ? dateOfBirthCustomer : dateOfBirthController.text.trim(),
                        password: passwordCustomer,
                        joinDate: joinDateCustomer,
                        profilePicture : profilePictureCustomer);

                    print('fullName yg di input: ${user.fullName}');
                    print('email yg di input: ${user.email}');
                    print('userName yg di input: ${user.userName}');
                    print('province yg di input: ${user.province}');
                    print('dateOfBirth yg di input: ${user.dateOfBirth}');
                    print('password yg di input: ${user.password}');

                    UserRepository.instance.updateUserRecord(user, idCustomer);
                    // controller.updateRecord(user);
                    Get.to(()=>UpdateProfileScreen());
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
