import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/pages/components/square_tile.dart';
import 'package:skripsilocal/pages/profile/core/update_profile_screen.dart';
import 'package:skripsilocal/pages/profile/register_page.dart';
import 'package:skripsilocal/src/features/authentication/controller/signin_controller.dart';
import 'package:skripsilocal/src/repository/user_repository/user_repository.dart';
import '../../../src/features/authentication/models/user_model.dart';
import '../../../src/repository/authentication_repository/authentication_repository.dart';
import '../../components/button.dart';
import '../../components/my_textfield.dart';

class UpdateProfile_New extends StatefulWidget {

  const UpdateProfile_New({super.key});

  @override
  State<UpdateProfile_New> createState() => _UpdateProfile_NewState();
}

class _UpdateProfile_NewState extends State<UpdateProfile_New> {
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

  TextEditingController _date = TextEditingController();

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
          child: Container(
            key : _formkey,
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Isi field yang mau di update',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Nama Lengkap :',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: fullNameController,
                      hintText: fullNameCustomer,
                      obscureText: false,
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Username :',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: userNameController,
                      hintText: userNameCustomer,
                      obscureText: false,
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Provinsi Tempat Tinggal :',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      controller: provinceController,
                      hintText: provinceCustomer,
                      obscureText: false,
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Tanggal Lahir :',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10),
                    // MyTextField(
                    //   controller: dateOfBirthController,
                    //   hintText: dateOfBirthCustomer,
                    //   obscureText: false,
                    // ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: _date,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          fillColor: Colors.grey[300],
                          filled: true,
                          icon : Icon(Icons.calendar_today_rounded),
                          labelText: "Pilih Tanggal",
                        ),
                        onTap: () async{
                          DateTime? pickDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1945),
                              lastDate: DateTime(2100));
                          if (pickDate != null){
                            setState(() {
                              _date.text = DateFormat('dd-MM-yyyy').format(pickDate);
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
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
                        Get.to(()=>const UpdateProfile());
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
