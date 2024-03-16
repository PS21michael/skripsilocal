import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skripsilocal/models/user_model.dart';
import 'package:skripsilocal/pages/components/button.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';

import '../../Utils/Helper/CategoryUtils.dart';
import '../../repository/authentication_repository/authentication_repository.dart';
import '../../repository/user_repository/user_repository.dart';

class PickCategory extends StatefulWidget {
  @override
  _PickCategoryState createState() => _PickCategoryState();
}

class _PickCategoryState extends State<PickCategory> {
  List<String> categories = ['Nasional', 'Bisnis', 'Politik', 'Hukum', 'Ekonomi', 'Olahrga', 'Teknologi', 'Otomotif', 'Internasional', 'Lifestyle', 'Hiburan', 'Travel', 'Sains', 'Edukasi', 'Kesehatan', 'Bola', 'Enterpreneur', 'Event'];
  List<String> selectedCategories = [];
  final listCategoryController = Get.put(CategoryListParser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih kategori beritamu dulu yuk!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: categories.map((category) {
                      return ChoiceChip(
                        label: Text(category),
                        selected: selectedCategories.contains(category),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              selectedCategories.add(category);
                            } else {
                              selectedCategories.remove(category);
                            }
                          });
                        },
                        selectedColor: Colors.grey[400],
                        backgroundColor: Colors.white70,
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        visualDensity: VisualDensity(
                          horizontal: 4,
                          vertical: 3,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  theButton(
                      // List<String> filteredCategories = categories.where((category) => selectedCategories.contains(category)).toList();
                      // Get.to(() => HomePage(selectedCategories: filteredCategories));
                      // print('filteredCategories');
                      onTap: () async{
                        handleSubmit();
                      },
                      text: "Submit"
                  ),
                  SizedBox(height: 20),
                  // Text('Kategori yang Dipilih:'),
                  // SizedBox(height: 10),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: selectedCategories
                  //       .map((category) => Text(category, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
                  //       .toList(),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleSubmit() async{
    await Future.delayed(Duration(seconds: 2));
    await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    String idCustomer = UserRepository.instance.getUserModelId();
    String fullnameCustomer = UserRepository.instance.getUserModelFullName();
    String emailCustomer = UserRepository.instance.getUserModelEmail();
    String usernameCustomer = UserRepository.instance.getUserModelUserName();
    String provinceCustomer = UserRepository.instance.getUserModelProvince();
    String DOBCustomer = UserRepository.instance.getUserModelDateOfBirth();
    String passCustomer = UserRepository.instance.getUserModelPassword();
    String joinDateCustomer = UserRepository.instance.getUserModelJoinDate();
    String profilPicturePathCustomer = UserRepository.instance.getUserModelProfilePicture();

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

    int tempIndex=0;

    if (selectedCategories.length >= 3) {
      List<String> filteredCategories = categories.where((category) =>
          selectedCategories.contains(category)).toList();
      print(filteredCategories);
      // Get.to(() => HomePage(selectedCategories: filteredCategories));
      for(int i=0; i<filteredCategories.length; i++){
        tempIndex = listCategoryController.listToScore(filteredCategories[i].toLowerCase());
        if(tempIndex == 1){
          kategoriCustomer1 = 10000;
        } else if(tempIndex == 2){
          kategoriCustomer2 = 10000;
        } else if(tempIndex == 3){
          kategoriCustomer3 = 10000;
        }else if(tempIndex == 4){
          kategoriCustomer4 = 10000;
        }else if(tempIndex == 5){
          kategoriCustomer5 = 10000;
        }else if(tempIndex == 6){
          kategoriCustomer6 = 10000;
        }else if(tempIndex == 7){
          kategoriCustomer7 = 10000;
        }else if(tempIndex == 8){
          kategoriCustomer8 = 10000;
        }else if(tempIndex == 9){
          kategoriCustomer9 = 10000;
        }else if(tempIndex == 10){
          kategoriCustomer10 = 10000;
        } else if(tempIndex == 11){
          kategoriCustomer11 = 10000;
        } else if(tempIndex == 12){
          kategoriCustomer12 = 10000;
        } else if(tempIndex == 13){
          kategoriCustomer13 = 10000;
        }else if(tempIndex == 14){
          kategoriCustomer14 = 10000;
        }else if(tempIndex == 15){
          kategoriCustomer15 = 10000;
        }else if(tempIndex == 16){
          kategoriCustomer16 = 10000;
        }else if(tempIndex == 17){
          kategoriCustomer17 = 10000;
        }else if(tempIndex == 18){
          kategoriCustomer18 = 10000;
        }else if(tempIndex == 19){
          kategoriCustomer19 = 10000;
        }else if(tempIndex == 20){
          kategoriCustomer20 = 10000;
        } else if(tempIndex == 21){
          kategoriCustomer21 = 10000;
        } else if(tempIndex == 22){
          kategoriCustomer22 = 10000;
        } else if(tempIndex == 23){
          kategoriCustomer23 = 10000;
        }else if(tempIndex == 24){
          kategoriCustomer24 = 10000;
        }else if(tempIndex == 25){
          kategoriCustomer25 = 10000;
        }else if(tempIndex == 26){
          kategoriCustomer26 = 10000;
        }else if(tempIndex == 27){
          kategoriCustomer27 = 10000;
        }else if(tempIndex == 28){
          kategoriCustomer28 = 10000;
        }else if(tempIndex == 29){
          kategoriCustomer29 = 10000;
        }else if(tempIndex == 30){
          kategoriCustomer30 = 10000;
        } else if(tempIndex == 31){
          kategoriCustomer31 = 10000;
        } else if(tempIndex == 32){
          kategoriCustomer32 = 10000;
        } else if(tempIndex == 33){
          kategoriCustomer33 = 10000;
        }else if(tempIndex == 34){
          kategoriCustomer34 = 10000;
        }else if(tempIndex == 35){
          kategoriCustomer35 = 10000;
        }else if(tempIndex == 36){
          kategoriCustomer36 = 10000;
        }else if(tempIndex == 37){
          kategoriCustomer37 = 10000;
        }else if(tempIndex == 38){
          kategoriCustomer38 = 10000;
        }


        // Batas for
      }

      final user = UserModel(
          fullName: fullnameCustomer,
          email: emailCustomer,
          userName: usernameCustomer,
          province: provinceCustomer,
          dateOfBirth: DOBCustomer,
          password: passCustomer,
          joinDate: joinDateCustomer,
          profilePicture: profilPicturePathCustomer,
          kategori1: 'nasional',
          scoreKategori1: kategoriCustomer1,
          kategori2: 'bisnis',
          scoreKategori2: kategoriCustomer2,
          kategori3: 'politik',
          scoreKategori3: kategoriCustomer3,
          kategori4: 'hukum',
          scoreKategori4: kategoriCustomer4,
          kategori5: 'ekonomi',
          scoreKategori5: kategoriCustomer5,
          kategori6: 'olahraga',
          scoreKategori6: kategoriCustomer6,
          kategori7: 'teknologi',
          scoreKategori7: kategoriCustomer7,
          kategori8: 'otomotif',
          scoreKategori8: kategoriCustomer8,
          kategori9: 'internasional',
          scoreKategori9: kategoriCustomer9,
          kategori10: 'bola',
          scoreKategori10: kategoriCustomer10,
          kategori11: 'selebritis',
          scoreKategori11: kategoriCustomer11,
          kategori12: 'lifestyle',
          scoreKategori12: kategoriCustomer12,
          kategori13: 'hiburan',
          scoreKategori13: kategoriCustomer13,
          kategori14: 'jakarta',
          scoreKategori14: kategoriCustomer14,
          kategori15: 'market',
          scoreKategori15: kategoriCustomer15,
          kategori16: 'news',
          scoreKategori16: kategoriCustomer16,
          kategori17: 'cantik',
          scoreKategori17: kategoriCustomer17,
          kategori18: 'travel',
          scoreKategori18: kategoriCustomer18,
          kategori19: 'syariah',
          scoreKategori19: kategoriCustomer19,
          kategori20: 'islam',
          scoreKategori20: kategoriCustomer20,
          kategori21: 'sains',
          scoreKategori21: kategoriCustomer21,
          kategori22: 'edukasi',
          scoreKategori22: kategoriCustomer22,
          kategori23: 'kesehatan',
          scoreKategori23: kategoriCustomer23,
          kategori24: 'humaniora',
          scoreKategori24: kategoriCustomer24,
          kategori25: 'entrepreneur',
          scoreKategori25: kategoriCustomer25,
          kategori26: 'opini',
          scoreKategori26: kategoriCustomer26,
          kategori27: 'khas',
          scoreKategori27: kategoriCustomer27,
          kategori28: 'jateng',
          scoreKategori28: kategoriCustomer28,
          kategori29: 'daerah',
          scoreKategori29: kategoriCustomer29,
          kategori30: 'khazanah',
          scoreKategori30: kategoriCustomer30,
          kategori31: 'leisure',
          scoreKategori31: kategoriCustomer31,
          kategori32: 'metro',
          scoreKategori32: kategoriCustomer32,
          kategori33: 'ekbis',
          scoreKategori33: kategoriCustomer33,
          kategori34: 'kalam',
          scoreKategori34: kategoriCustomer34,
          kategori35: 'difabel',
          scoreKategori35: kategoriCustomer35,
          kategori36: 'creativelab',
          scoreKategori36: kategoriCustomer36,
          kategori37: 'inforial',
          scoreKategori37: kategoriCustomer37,
          kategori38: 'event',
          scoreKategori38: kategoriCustomer38,
      );

      await Future.delayed(Duration(seconds: 3));
      await UserRepository.instance.updateUserRecord(user, idCustomer);
      await Future.delayed(Duration(seconds: 4));
      UserRepository.instance.getSingelUserDetails(emailCustomer);

      showCustomSnackbar('SUCCES', 'DATA SUDAH DIMASUKKAN', isError: false);
    }
    else{
      showCustomSnackbar('Error', 'Pilih setidaknya 3 kategori', isError: true);
    }
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

}
