import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skripsilocal/controller/signin_controller.dart';
import 'package:skripsilocal/models/user_model.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/pages/profile/pickCategory.dart';
// import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';
import '../components/button.dart';
import '../news/explore.dart';

class FillProfile extends StatefulWidget {

  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {

  _FillProfileState() {
    _provinsiVal = _provinsiList[0];
  }

  Future<void> _validateUsername() async {
    String inputUsername = userNameController.text.trim();
    Future<bool> isValid = validateUsername(inputUsername);
    if (await isValid) {
      setState(() {
        _usernameValidated = true;
      });
      showCustomSnackbar("Success", "Username bisa digunakan!", isError: false);
    } else {
      showCustomSnackbar("Error", "Username sudah digunakan orang lain!", isError: true);
    }
  }

  Future<bool> validateUsername(String username) async{
    // print("username yg dikirim "+ username);
    await UserRepository.instance.checkListUserName(username);
    String usernameAvail = UserRepository.instance.isUsernameAvail;
    if(usernameAvail == "NO"){
      return false;
    } else if(usernameAvail == "YES"){
      return true;
    }
    // logika validasi username di sini
    return false;
  }

  bool _usernameValidated = false;
  final controller = Get.put(SignInController());
  final _formkey = GlobalKey<FormState>();
  // final _authRepo = Get.put(AuthenticationRepository());
  final _provinsiList = ["Nanggroe Aceh Darussalam", "Sumatera Utara", "Sumatera Selatan", "Sumatera Barat","Bengkulu", "Riau", "Kepulauan Riau", "Jambi", "Lampung", "Bangka Belitung", "Kalimantan Barat", "Kalumantan Timur", "Kalimantan Selatan" , "Kalimantan Tengah", "Kalimantan Utara", "Banten", "DKI Jakarta", "Jawa Barat", "Jawa Timur", "JawaTengah", "Daerah Istimewa Yogyakarta", "Bali", "Nusa Tenggara Timur", "Nusa Tenggara Barat", "Gorontalo", "Sulawesi Barat", "Sulawesi Tengah", "Sulawesi Utara", "Sulawesi Tenggara", "Sulawesi Selatan", "Maluku Utara", "Maluku", "Papua Barat", "Papua", "Papua Tengah", "Papua Pegunungan", "Papua Selatan", "Papua Barat Daya"];
  String? _provinsiVal = "";
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final provinceController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final joinDateController = TextEditingController();
  final passwordController = TextEditingController();
  // TextEditingController _date = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var i = 0;
    String idCustomer = UserRepository.instance.getUserModelId();
    String fullNameCustomer = UserRepository.instance.getUserModelFullName();
    String emailCustomer = UserRepository.instance.getUserModelEmail();
    String userNameCustomer = UserRepository.instance.getUserModelUserName();
    String provinceCustomer = UserRepository.instance.getUserModelProvince();
    String dateOfBirthCustomer = UserRepository.instance
        .getUserModelDateOfBirth();
    String joinDateCustomer = UserRepository.instance.getUserModelJoinDate();
    String profilePictureCustomer = UserRepository.instance
        .getUserModelProfilePicture();

    // List Score
    int kategoriCustomer1 = UserRepository.instance.getScoreKategori1();
    int kategoriCustomer2 = UserRepository.instance.getScoreKategori2();
    int kategoriCustomer3 = UserRepository.instance.getScoreKategori3();
    int kategoriCustomer4 = UserRepository.instance.getScoreKategori4();
    int kategoriCustomer5 = UserRepository.instance.getScoreKategori5();
    int kategoriCustomer6 = UserRepository.instance.getScoreKategori6();
    int kategoriCustomer7 = UserRepository.instance.getScoreKategori7();
    int kategoriCustomer8 = UserRepository.instance.getScoreKategori8();
    int kategoriCustomer9 = UserRepository.instance.getScoreKategori9();
    int kategoriCustomer10 = UserRepository.instance.getScoreKategori10();
    int kategoriCustomer11 = UserRepository.instance.getScoreKategori11();
    int kategoriCustomer12 = UserRepository.instance.getScoreKategori12();
    int kategoriCustomer13 = UserRepository.instance.getScoreKategori13();
    int kategoriCustomer14 = UserRepository.instance.getScoreKategori14();
    int kategoriCustomer15 = UserRepository.instance.getScoreKategori15();
    int kategoriCustomer16 = UserRepository.instance.getScoreKategori16();
    int kategoriCustomer17 = UserRepository.instance.getScoreKategori17();
    int kategoriCustomer18 = UserRepository.instance.getScoreKategori18();
    int kategoriCustomer19 = UserRepository.instance.getScoreKategori19();
    int kategoriCustomer20 = UserRepository.instance.getScoreKategori20();
    int kategoriCustomer21 = UserRepository.instance.getScoreKategori21();
    int kategoriCustomer22 = UserRepository.instance.getScoreKategori22();
    int kategoriCustomer23 = UserRepository.instance.getScoreKategori23();
    int kategoriCustomer24 = UserRepository.instance.getScoreKategori24();
    int kategoriCustomer25 = UserRepository.instance.getScoreKategori25();
    int kategoriCustomer26 = UserRepository.instance.getScoreKategori26();
    int kategoriCustomer27 = UserRepository.instance.getScoreKategori27();
    int kategoriCustomer28 = UserRepository.instance.getScoreKategori28();
    int kategoriCustomer29 = UserRepository.instance.getScoreKategori29();
    int kategoriCustomer30 = UserRepository.instance.getScoreKategori30();
    int kategoriCustomer31 = UserRepository.instance.getScoreKategori31();
    int kategoriCustomer32 = UserRepository.instance.getScoreKategori32();
    int kategoriCustomer33 = UserRepository.instance.getScoreKategori33();
    int kategoriCustomer34 = UserRepository.instance.getScoreKategori34();
    int kategoriCustomer35 = UserRepository.instance.getScoreKategori35();
    int kategoriCustomer36 = UserRepository.instance.getScoreKategori36();
    int kategoriCustomer37 = UserRepository.instance.getScoreKategori37();
    int kategoriCustomer38 = UserRepository.instance.getScoreKategori38();

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
                    const Align(
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
                              icon: const Icon(CupertinoIcons.person),
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
                      child: Stack(
                        children: [
                          FormField(
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
                                  icon: const Icon(CupertinoIcons.person_alt_circle_fill),
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
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              // onTap: () {
                              //   String inputUsername = userNameController.text.trim();
                              //   print("Username yang diinput: $inputUsername");
                              // },
                              onTap: _validateUsername,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Cek username',
                                  style: TextStyle(
                                    color: Colors.blue, // Ganti warna sesuai keinginan Anda
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: TextEditingController(text: _provinsiVal ?? ""),
                          decoration: InputDecoration(
                            icon: const Icon(CupertinoIcons.home),
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
                            _provinsiVal = suggestion;
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
                              icon: const Icon(CupertinoIcons.calendar),
                              labelText: "Tanggal Lahir",
                            ),
                            onTap: () async {
                              DateTime? pickDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1945),
                                lastDate: DateTime.now(), // Mengatur lastDate menjadi hari ini
                                selectableDayPredicate: (DateTime date) {
                                  return date.isBefore(DateTime.now()) || date.isAtSameMomentAs(DateTime.now());
                                },
                              );
                              if (pickDate != null) {
                                setState(() {
                                  dateOfBirthController.text = DateFormat('dd-MM-yyyy').format(pickDate);
                                });
                                state.didChange(dateOfBirthController.text);
                              }
                            },
                          );
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Tanggal lahir harus diisi';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    TheButton(
                      text: 'Isi Data',
                      onTap: () async {

                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );

                        if(_formKey.currentState!.validate()) {
                          if(!_usernameValidated) {
                            Navigator.pop(context);
                            showCustomSnackbar(
                              "Error!",
                              "Please validate the username first!",
                              isError: true,
                            );
                          } else {
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
                              joinDate: joinDateCustomer,
                              profilePicture: profilePictureCustomer,

                                scoreKategori1: kategoriCustomer1,
                                scoreKategori2: kategoriCustomer2,
                                scoreKategori3: kategoriCustomer3,
                                scoreKategori4: kategoriCustomer4,
                                scoreKategori5: kategoriCustomer5,
                                scoreKategori6: kategoriCustomer6,
                                scoreKategori7: kategoriCustomer7,
                                scoreKategori8: kategoriCustomer8,
                                scoreKategori9: kategoriCustomer9,
                                scoreKategori10: kategoriCustomer10,
                                scoreKategori11: kategoriCustomer11,
                                scoreKategori12: kategoriCustomer12,
                                scoreKategori13: kategoriCustomer13,
                                scoreKategori14: kategoriCustomer14,
                                scoreKategori15: kategoriCustomer15,
                                scoreKategori16: kategoriCustomer16,
                                scoreKategori17: kategoriCustomer17,
                                scoreKategori18: kategoriCustomer18,
                                scoreKategori19: kategoriCustomer19,
                                scoreKategori20: kategoriCustomer20,
                                scoreKategori21: kategoriCustomer21,
                                scoreKategori22: kategoriCustomer22,
                                scoreKategori23: kategoriCustomer23,
                                scoreKategori24: kategoriCustomer24,
                                scoreKategori25: kategoriCustomer25,
                                scoreKategori26: kategoriCustomer26,
                                scoreKategori27: kategoriCustomer27,
                                scoreKategori28: kategoriCustomer28,
                                scoreKategori29: kategoriCustomer29,
                                scoreKategori30: kategoriCustomer30,
                                scoreKategori31: kategoriCustomer31,
                                scoreKategori32: kategoriCustomer32,
                                scoreKategori33: kategoriCustomer33,
                                scoreKategori34: kategoriCustomer34,
                                scoreKategori35: kategoriCustomer35,
                                scoreKategori36: kategoriCustomer36,
                                scoreKategori37: kategoriCustomer37,
                                scoreKategori38: kategoriCustomer38,                            );
                            // print('fullName yg di input: ${user.fullName}');
                            // print('email yg di input: ${user.email}');
                            // print('userName yg di input: ${user.userName}');
                            // print('province yg di input: ${user.province}');
                            // print('dateOfBirth yg di input: ${user.dateOfBirth}');
                            // print("user Id yang dikirim :"+ idCustomer);
                            await Future.delayed(const Duration(seconds: 1));
                            await UserRepository.instance.updateUserRecord(
                                user, idCustomer);
                            await Future.delayed(const Duration(seconds: 1));
                            await UserRepository.instance.getSingelUserDetails(
                                user.email);

                            await Future.delayed(const Duration(milliseconds: 200));
                            if(UserRepository.instance.getUserModelInitScore() == "NO"){
                              Navigator.pop(context);
                              Get.offAll(()=> PickCategory());
                            } else{
                              await Future.delayed(const Duration(milliseconds: 200));
                              Navigator.pop(context);
                              Get.to(() => const ExplorePage());
                            }

                          }
                        } else {
                          Navigator.pop(context);
                          showCustomSnackbar(
                            "Error!",
                            "Please fill in all required fields!",
                            isError: true,
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

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

}