import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/models/user_model.dart';
import 'package:skripsilocal/pages/components/button.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/pages/news/news.dart';
import '../../Utils/CategoryUtils.dart';
import '../../repository/authentication_repository/authentication_repository.dart';
import '../../repository/user_repository/user_repository.dart';

class PickCategory extends StatefulWidget {
  const PickCategory({Key? key}) : super(key: key);
  @override
  State<PickCategory> createState() => _PickCategoryState();
}

class _PickCategoryState extends State<PickCategory> {
  List<String> categories = ['Nasional', 'Bisnis', 'Politik', 'Hukum', 'Ekonomi', 'Olahraga', 'Teknologi', 'Otomotif', 'Internasional', 'Lifestyle', 'Hiburan', 'Travel', 'Sains', 'Edukasi', 'Kesehatan', 'Bola', 'Entrepreneur', 'Event'];
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
                  const SizedBox(height: 10),
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
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        visualDensity: const VisualDensity(
                          horizontal: 4,
                          vertical: 3,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  TheButton(
                      // List<String> filteredCategories = categories.where((category) => selectedCategories.contains(category)).toList();
                      // Get.to(() => HomePage(selectedCategories: filteredCategories));
                      // print('filteredCategories');
                      onTap: () async{
                        handleSubmit();
                      },
                      text: "Selesai"
                  ),
                  const SizedBox(height: 20),
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

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 2));
    await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    String idCustomer = UserRepository.instance.getUserModelId();
    String fullnameCustomer = UserRepository.instance.getUserModelFullName();
    String emailCustomer = UserRepository.instance.getUserModelEmail();
    String usernameCustomer = UserRepository.instance.getUserModelUserName();
    String provinceCustomer = UserRepository.instance.getUserModelProvince();
    String dobCustomer = UserRepository.instance.getUserModelDateOfBirth();
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
      // print(filteredCategories);
      // Get.to(() => HomePage(selectedCategories: filteredCategories));
      for(int i=0; i<filteredCategories.length; i++){
        tempIndex = listCategoryController.listToScore(filteredCategories[i]);
        if(tempIndex == 1){
          kategoriCustomer1 = 1000;
        } else if(tempIndex == 2){
          kategoriCustomer2 = 1000;
        } else if(tempIndex == 3){
          kategoriCustomer3 = 1000;
        }else if(tempIndex == 4){
          kategoriCustomer4 = 1000;
        }else if(tempIndex == 5){
          kategoriCustomer5 = 1000;
        }else if(tempIndex == 6){
          kategoriCustomer6 = 1000;
        }else if(tempIndex == 7){
          kategoriCustomer7 = 1000;
        }else if(tempIndex == 8){
          kategoriCustomer8 = 1000;
        }else if(tempIndex == 9){
          kategoriCustomer9 = 1000;
        }else if(tempIndex == 10){
          kategoriCustomer10 = 1000;
        } else if(tempIndex == 11){
          kategoriCustomer11 = 1000;
        } else if(tempIndex == 12){
          kategoriCustomer12 = 1000;
        } else if(tempIndex == 13){
          kategoriCustomer13 = 1000;
        }else if(tempIndex == 14){
          kategoriCustomer14 = 1000;
        }else if(tempIndex == 15){
          kategoriCustomer15 = 1000;
        }else if(tempIndex == 16){
          kategoriCustomer16 = 1000;
        }else if(tempIndex == 17){
          kategoriCustomer17 = 1000;
        }else if(tempIndex == 18){
          kategoriCustomer18 = 1000;
        }else if(tempIndex == 19){
          kategoriCustomer19 = 1000;
        }else if(tempIndex == 20){
          kategoriCustomer20 = 1000;
        } else if(tempIndex == 21){
          kategoriCustomer21 = 1000;
        } else if(tempIndex == 22){
          kategoriCustomer22 = 1000;
        } else if(tempIndex == 23){
          kategoriCustomer23 = 1000;
        }else if(tempIndex == 24){
          kategoriCustomer24 = 1000;
        }else if(tempIndex == 25){
          kategoriCustomer25 = 1000;
        }else if(tempIndex == 26){
          kategoriCustomer26 = 1000;
        }else if(tempIndex == 27){
          kategoriCustomer27 = 1000;
        }else if(tempIndex == 28){
          kategoriCustomer28 = 1000;
        }else if(tempIndex == 29){
          kategoriCustomer29 = 1000;
        }else if(tempIndex == 30){
          kategoriCustomer30 = 1000;
        } else if(tempIndex == 31){
          kategoriCustomer31 = 1000;
        } else if(tempIndex == 32){
          kategoriCustomer32 = 1000;
        } else if(tempIndex == 33){
          kategoriCustomer33 = 1000;
        }else if(tempIndex == 34){
          kategoriCustomer34 = 1000;
        }else if(tempIndex == 35){
          kategoriCustomer35 = 1000;
        }else if(tempIndex == 36){
          kategoriCustomer36 = 1000;
        }else if(tempIndex == 37){
          kategoriCustomer37 = 1000;
        }else if(tempIndex == 38){
          kategoriCustomer38 = 1000;
        }
      }

      final user = UserModel(
          fullName: fullnameCustomer,
          email: emailCustomer,
          userName: usernameCustomer,
          province: provinceCustomer,
          dateOfBirth: dobCustomer,
          joinDate: joinDateCustomer,
          profilePicture: profilPicturePathCustomer,
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
          scoreKategori38: kategoriCustomer38,
      );

      await Future.delayed(const Duration(seconds: 4));
      await UserRepository.instance.updateUserRecord(user, idCustomer);
      await Future.delayed(const Duration(seconds: 2));
      UserRepository.instance.getSingelUserDetails(emailCustomer);
      showCustomSnackbar('SUCCES', 'Data berhasil disimpan', isError: false);

      // await Future.delayed(Duration(milliseconds: 300));
      // UserRepository.instance.resetListScore();
      await Future.delayed(const Duration(milliseconds: 300));
      await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
      await Future.delayed(const Duration(milliseconds: 300));
      Navigator.pop(context);
      Get.to(() => const NewsPage());
    }
    else{
      showCustomSnackbar('Error', 'Pilih setidaknya 3 kategori', isError: true);
    }
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

}
