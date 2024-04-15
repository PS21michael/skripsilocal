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

  bool _obscureText = true;
  void _TriggerObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPopupMessage(context);
    });
  }

  void _showPopupMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          backgroundColor: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Password harus terdiri dari satu special character, satu angka, satu huruf besar, satu huruf kecil dan lebih dari 8 karakter!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Oke, paham!'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.password,
                    obscureText: _obscureText,
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
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: _TriggerObscureText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.confirmPassword,
                    obscureText: _obscureText,
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
                      hintText: 'Konfirmasi Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: _TriggerObscureText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                theButton(
                  text: 'Sign Up',
                  onTap: (){

                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );

                    final user = UserModel(
                        fullName: randomNames.manFullName(),
                        email: controller.email.text.trim(),
                        userName: generateUserName(randomNames.manFullName()),
                        province: "ProvinsiUtama",
                        dateOfBirth: "01-01-1900",
                        joinDate: DateTime.now().toString(),
                        profilePicture: 'https://firebasestorage.googleapis.com/v0/b/indonesia-memilih-c26b0.appspot.com/o/Users%2FImages%2FProfile%2FDefaultImageProject.jpg?alt=media&token=6b2e46b5-a2f6-4377-ade1-7a1046724b8c',
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

                    Navigator.pop(context);

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
