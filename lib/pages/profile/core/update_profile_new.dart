import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:skripsilocal/pages/components/square_tile.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/profile/core/update_profile_screen.dart';
import 'package:skripsilocal/pages/profile/register_page.dart';
import 'package:skripsilocal/src/features/authentication/controller/signin_controller.dart';
import 'package:skripsilocal/src/features/authentication/screens/error_toast/show_toast.dart';
import 'package:skripsilocal/src/repository/user_repository/user_repository.dart';
import '../../../src/features/authentication/models/user_model.dart';
import '../../../src/repository/authentication_repository/authentication_repository.dart';
import '../../components/button.dart';
import '../../components/my_textfield.dart';
import '../profile_page.dart';

class UpdateProfile_New extends StatefulWidget {

  const UpdateProfile_New({super.key});

  @override
  State<UpdateProfile_New> createState() => _UpdateProfile_NewState();
}

class _UpdateProfile_NewState extends State<UpdateProfile_New> {

  _UpdateProfile_NewState() {
    _provinsiVal = _provinsiList[0];
  }

  final controller = Get.put(SignInController());
  final _formkey = GlobalKey<FormState>();
  final _authRepo = Get.put(AuthenticationRepository());
  final _provinsiList = ["Nanggroe Aceh Darussalam", "Sumatera Utara", "Sumatera Selatan", "Sumatera Barat","Bengkulu", "Riau", "Kepulauan Riau", "Jambi", "Lampung", "Bangka Belitung", "Kalimantan Barat", "Kalumantan Timur", "Kalimantan Selatan" , "Kalimantan Tengah", "Kalimantan Utara", "Banten", "DKI Jakarta", "Jawa Barat", "Jawa Timur", "JawaTengah", "Daerah Istimewa Yogyakarta", "Bali", "Nusa Tenggara Timur", "Nusa Tenggara Barat", "Gorontalo", "Sulawesi Barat", "Sulawesi Tengah", "Sulawesi Utara", "Sulawesi Tenggara", "Sulawesi Selatan", "Maluku Utara", "Maluku", "Papua Barat", "Papua", "Papua Tengah", "Papua Pegunungan", "Papua Selatan", "Papua Barat Daya"];
  String? _provinsiVal = "";

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final provinceController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final joinDateController = TextEditingController();
  final passwordController = TextEditingController();

  TextEditingController _date = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var i = 0;
    String idCustomer = UserRepository.instance.getUserModelId();
    String fullNameCustomer = UserRepository.instance.getUserModelFullName();
    String emailCustomer = UserRepository.instance.getUserModelEmail();
    String userNameCustomer = UserRepository.instance.getUserModelUserName();
    String provinceCustomer = UserRepository.instance.getUserModelProvince();
    String dateOfBirthCustomer = UserRepository.instance
        .getUserModelDateOfBirth();
    String passwordCustomer = UserRepository.instance.getUserModelPassword();
    String joinDateCustomer = UserRepository.instance.getUserModelJoinDate();
    String profilePictureCustomer = UserRepository.instance
        .getUserModelProfilePicture();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          key: _formkey,
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Isi data diri anda!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: FormField(
                        builder: (FormFieldState<String> state) {
                          return TextField(
                            controller: fullNameController,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black87),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                              ),
                              fillColor: Colors.grey[300],
                              filled: true,
                              icon: Icon(CupertinoIcons.person),
                              labelText: "Nama Lengkap",
                              // hintText: fullNameCustomer,
                            ),
                            onChanged: (value) {
                              state.didChange(value);
                            },
                          );
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Nama Lengkap harus diisi';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: FormField(
                        builder: (FormFieldState<String> state) {
                          return TextField(
                            controller: userNameController,
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
                              icon: Icon(CupertinoIcons.person_alt_circle_fill),
                              labelText: "Username",
                              // hintText: userNameCustomer,
                            ),
                            onChanged: (value) {
                              state.didChange(value);
                            },
                          );
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Nama Lengkap harus diisi';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: TextEditingController(text: _provinsiVal ?? ""),
                          decoration: InputDecoration(
                            icon: Icon(CupertinoIcons.home),
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
                            labelText: "Provinsi Tempat Tinggal",
                          ),
                        ),
                        suggestionsCallback: (pattern) {
                          var filteredSuggestions = _provinsiList.where(
                                (provinsi) => provinsi.toLowerCase().contains(pattern.toLowerCase()),
                          ).toList(); // Limit the suggestions to the first 5
                          return filteredSuggestions;
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          setState(() {
                            _provinsiVal = suggestion as String;
                            // print("Provinsi yang dipilih: $_provinsiVal");
                          });
                        },
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return "Wajib diisi";
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: FormField(
                        builder: (FormFieldState<String> state) {
                          return TextField(
                            controller: dateOfBirthController,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black54
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black87
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)
                                ),
                              ),
                              fillColor: Colors.grey[300],
                              filled: true,
                              icon: Icon(CupertinoIcons.calendar),
                              labelText: "Tanggal Lahir",
                            ),
                            onTap: () async {
                              DateTime? pickDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1945),
                                  lastDate: DateTime(2100));
                              if (pickDate != null) {
                                setState(() {
                                  dateOfBirthController.text =
                                      DateFormat('dd-MM-yyyy').format(
                                          pickDate);
                                });
                                state.didChange(dateOfBirthController.text);
                              };
                            },
                          );
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Nama Lengkap harus diisi';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    theButton(
                      text: 'Isi Data',
                      onTap: () {
                        if(_formKey.currentState!.validate()) {
                          final user = UserModel(
                            fullName: fullNameController.text.trim() == ""
                                ? fullNameCustomer
                                : fullNameController.text.trim(),
                            email: emailCustomer,
                            userName: userNameController.text.trim() == ""
                                ? userNameCustomer
                                : userNameController.text.trim(),
                            province: _provinsiVal ?? provinceCustomer,
                            dateOfBirth: dateOfBirthController.text.trim() == ""
                                ? dateOfBirthCustomer
                                : dateOfBirthController.text.trim(),
                            password: passwordCustomer,
                            joinDate: joinDateCustomer,
                            profilePicture: profilePictureCustomer,

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

                          print('fullName yg di input: ${user.fullName}');
                          print('email yg di input: ${user.email}');
                          print('userName yg di input: ${user.userName}');
                          print('province yg di input: ${user.province}');
                          print('dateOfBirth yg di input: ${user.dateOfBirth}');
                          print('password yg di input: ${user.password}');

                          UserRepository.instance.updateUserRecord(
                              user, idCustomer);
                          // controller.updateRecord(user);
                          // Get.to(() => const UpdateProfile());
                          UserRepository.instance.getSingelUserDetails(
                              controller.email.text.trim());
                          // Get.to(() => const ProfilePage());
                          Get.to(() => const HomePage());
                        }
                        else{
                            Get.snackbar(
                              "Error!",
                              "Please fill in all required fields!",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              borderRadius: 10.0,
                              duration: Duration(seconds: 3),
                              messageText: Text(
                                'Please fill in all required fields.',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,// Ganti ukuran sesuai keinginan Anda
                                ),
                              ),
                            );
                        }
                      },
                    ),
                    const SizedBox(height: 350),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
