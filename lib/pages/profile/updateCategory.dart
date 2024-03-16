import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/Utils/Helper/CategoryUtils.dart';
import 'package:skripsilocal/pages/components/button.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';

import '../../models/user_model.dart';

class UpdateCategory extends StatefulWidget {
  @override
  _UpdateCategoryState createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  List<String> categories = ['Nasional', 'Bisnis', 'Politik', 'Hukum', 'Ekonomi', 'Olahrga', 'Teknologi', 'Otomotif', 'Internasional', 'Lifestyle', 'Hiburan', 'Travel', 'Sains', 'Edukasi', 'Kesehatan', 'Bola', 'Enterpreneur', 'Event'];
  List<String> selectedCategories = [];
  final listCategoryController = Get.put(CategoryListParser());
  List<String> TempselectedCategories = ['Nasional', 'Bisnis'];
  List<String> userCategory = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    UserRepository.instance.resetListScore();
    await Future.delayed(Duration(seconds: 1));
    await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    List<int> daftarScore = UserRepository.instance.getListScore();
    List<int> scoreSecure = [];
    for(int i=0; i<38; i++){
      scoreSecure.add(daftarScore[i]);
    }
    listCategoryController.parseScoreToList(scoreSecure);
    print("List kategori favorit : "+ listCategoryController.parseScoreToList(scoreSecure).toString());
    this.userCategory = listCategoryController.parseScoreToList(scoreSecure);
    if(daftarScore.length != 38){
      UserRepository.instance.resetListScore();
    }
    print("#####");
    print(userCategory);
    print("Total score Awal : ${daftarScore.length}");
    if(daftarScore.length.isLowerThan(1)){
      await Future.delayed(Duration(seconds: 1));
      await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    }
    print("Total score Akhir : ${daftarScore.length}");
    print("List kategori favorit 2: "+ listCategoryController.parseScoreToList(scoreSecure).toString());
    // UserRepository.instance.resetListScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Update kategori beritamu dulu yuk!',
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
                        selected: userCategory.map((e) => e.toLowerCase()).contains(category.toLowerCase()),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              // userCategory.add(category);
                              selectedCategories.add(category);
                            } else {
                              // userCategory.add(category);
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
                      onTap: () async{
                        handleSubmit(userCategory);
                      },
                      text: "Submit"
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> handleSubmit(List<String> listKategory) async {

    // Inquiry Data First
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

    int tempIndexFavorit=0;
    int tempIndexRemover=0;


    // List<String> tempCategories2 = ['Bisnis', 'Politik', 'Hukum'];
    List<String> removeCategories = [];
    List<String> filteredCategories = categories.where((category) => selectedCategories.contains(category)).toList(); //ToDO Data baru
    print(filteredCategories);
    if (selectedCategories.length >= 3) {
      for (String category in userCategory) {
        if (!filteredCategories.contains(category)) {
          removeCategories.add(category);
        }
      }

      // List nambah
      for(int i=0; i<filteredCategories.length; i++){
        tempIndexFavorit = listCategoryController.listToScore(filteredCategories[i].toLowerCase());
        if(tempIndexFavorit == 1){
          kategoriCustomer1 = kategoriCustomer1>=10000?kategoriCustomer1:10000;
        } else if(tempIndexFavorit == 2){
          kategoriCustomer2 = kategoriCustomer2>=10000?kategoriCustomer2:10000;
        } else if(tempIndexFavorit == 3){
          kategoriCustomer3 = kategoriCustomer3>=10000?kategoriCustomer3:10000;
        }else if(tempIndexFavorit == 4){
          kategoriCustomer4 = kategoriCustomer4>=10000?kategoriCustomer4:10000;
        }else if(tempIndexFavorit == 5){
          kategoriCustomer5 = kategoriCustomer5>=10000?kategoriCustomer5:10000;;
        }else if(tempIndexFavorit == 6){
          kategoriCustomer6 = kategoriCustomer6>=10000?kategoriCustomer6:10000;;
        }else if(tempIndexFavorit == 7){
          kategoriCustomer7 = kategoriCustomer7>=10000?kategoriCustomer7:10000;;
        }else if(tempIndexFavorit == 8){
          kategoriCustomer8 = kategoriCustomer8>=10000?kategoriCustomer8:10000;;
        }else if(tempIndexFavorit == 9){
          kategoriCustomer9 = kategoriCustomer9>=10000?kategoriCustomer9:10000;;
        }else if(tempIndexFavorit == 10){
          kategoriCustomer10 = kategoriCustomer10>=10000?kategoriCustomer10:10000;;
        } else if(tempIndexFavorit == 11){
          kategoriCustomer11 = kategoriCustomer11>=10000?kategoriCustomer11:10000;;
        } else if(tempIndexFavorit == 12){
          kategoriCustomer12 = kategoriCustomer12>=10000?kategoriCustomer12:10000;;
        } else if(tempIndexFavorit == 13){
          kategoriCustomer13 = kategoriCustomer13>=10000?kategoriCustomer13:10000;;
        }else if(tempIndexFavorit == 14){
          kategoriCustomer14 = kategoriCustomer14>=10000?kategoriCustomer14:10000;;
        }else if(tempIndexFavorit == 15){
          kategoriCustomer15 = kategoriCustomer15>=10000?kategoriCustomer15:10000;;
        }else if(tempIndexFavorit == 16){
          kategoriCustomer16 = kategoriCustomer16>=10000?kategoriCustomer16:10000;;
        }else if(tempIndexFavorit == 17){
          kategoriCustomer17 = kategoriCustomer17>=10000?kategoriCustomer17:10000;;
        }else if(tempIndexFavorit == 18){
          kategoriCustomer18 = kategoriCustomer18>=10000?kategoriCustomer18:10000;;
        }else if(tempIndexFavorit == 19){
          kategoriCustomer19 = kategoriCustomer19>=10000?kategoriCustomer19:10000;;
        }else if(tempIndexFavorit == 20){
          kategoriCustomer20 = kategoriCustomer20>=10000?kategoriCustomer20:10000;;
        } else if(tempIndexFavorit == 21){
          kategoriCustomer21 = kategoriCustomer21>=10000?kategoriCustomer21:10000;;
        } else if(tempIndexFavorit == 22){
          kategoriCustomer22 = kategoriCustomer22>=10000?kategoriCustomer22:10000;;
        } else if(tempIndexFavorit == 23){
          kategoriCustomer23 = kategoriCustomer23>=10000?kategoriCustomer23:10000;;
        }else if(tempIndexFavorit == 24){
          kategoriCustomer24 = kategoriCustomer24>=10000?kategoriCustomer24:10000;;
        }else if(tempIndexFavorit == 25){
          kategoriCustomer25 = kategoriCustomer25>=10000?kategoriCustomer25:10000;;
        }else if(tempIndexFavorit == 26){
          kategoriCustomer26 = kategoriCustomer26>=10000?kategoriCustomer26:10000;;
        }else if(tempIndexFavorit == 27){
          kategoriCustomer27 = kategoriCustomer27>=10000?kategoriCustomer27:10000;;
        }else if(tempIndexFavorit == 28){
          kategoriCustomer28 = kategoriCustomer28>=10000?kategoriCustomer28:10000;;
        }else if(tempIndexFavorit == 29){
          kategoriCustomer29 = kategoriCustomer29>=10000?kategoriCustomer29:10000;;
        }else if(tempIndexFavorit == 30){
          kategoriCustomer30 = kategoriCustomer30>=10000?kategoriCustomer30:10000;;
        } else if(tempIndexFavorit == 31){
          kategoriCustomer31 = kategoriCustomer31>=10000?kategoriCustomer31:10000;;
        } else if(tempIndexFavorit == 32){
          kategoriCustomer32 = kategoriCustomer32>=10000?kategoriCustomer32:10000;;
        } else if(tempIndexFavorit == 33){
          kategoriCustomer33 = kategoriCustomer33>=10000?kategoriCustomer33:10000;;
        }else if(tempIndexFavorit == 34){
          kategoriCustomer34 = kategoriCustomer34>=10000?kategoriCustomer34:10000;;
        }else if(tempIndexFavorit == 35){
          kategoriCustomer35 = kategoriCustomer35>=10000?kategoriCustomer35:10000;;
        }else if(tempIndexFavorit == 36){
          kategoriCustomer36 = kategoriCustomer36>=10000?kategoriCustomer36:10000;;
        }else if(tempIndexFavorit == 37){
          kategoriCustomer37 = kategoriCustomer37>=10000?kategoriCustomer37:10000;;
        }else if(tempIndexFavorit == 38){
          kategoriCustomer38 = kategoriCustomer38>=10000?kategoriCustomer38:10000;;
        }


        // Batas for
      }

      // List hilang
      for(int i=0; i<removeCategories.length; i++){
        tempIndexRemover = listCategoryController.listToScore(removeCategories[i].toLowerCase());
        if(tempIndexRemover == 1){
          kategoriCustomer1-=10000;
        } else if(tempIndexRemover == 2){
          kategoriCustomer2-=10000;
        } else if(tempIndexRemover == 3){
          kategoriCustomer3-=10000;
        }else if(tempIndexRemover == 4){
          kategoriCustomer4-=10000;
        }else if(tempIndexRemover == 5){
          kategoriCustomer5-=10000;
        }else if(tempIndexRemover == 6){
          kategoriCustomer6-=10000;
        }else if(tempIndexRemover == 7){
          kategoriCustomer7-=10000;
        }else if(tempIndexRemover == 8){
          kategoriCustomer8-=10000;
        }else if(tempIndexRemover == 9){
          kategoriCustomer9-=10000;
        }else if(tempIndexRemover == 10){
          kategoriCustomer10-=10000;
        } else if(tempIndexRemover == 11){
          kategoriCustomer11-=10000;
        } else if(tempIndexRemover == 12){
          kategoriCustomer12-=10000;
        } else if(tempIndexRemover == 13){
          kategoriCustomer13-=10000;
        }else if(tempIndexRemover == 14){
          kategoriCustomer14-=10000;
        }else if(tempIndexRemover == 15){
          kategoriCustomer15-=10000;
        }else if(tempIndexRemover == 16){
          kategoriCustomer16-=10000;
        }else if(tempIndexRemover == 17){
          kategoriCustomer17-=10000;
        }else if(tempIndexRemover == 18){
          kategoriCustomer18-=10000;
        }else if(tempIndexRemover == 19){
          kategoriCustomer19-=10000;
        }else if(tempIndexRemover == 20){
          kategoriCustomer20-=10000;
        } else if(tempIndexRemover == 21){
          kategoriCustomer21-=10000;
        } else if(tempIndexRemover == 22){
          kategoriCustomer22-=10000;
        } else if(tempIndexRemover == 23){
          kategoriCustomer23-=10000;
        }else if(tempIndexRemover == 24){
          kategoriCustomer24-=10000;
        }else if(tempIndexRemover == 25){
          kategoriCustomer25-=10000;
        }else if(tempIndexRemover == 26){
          kategoriCustomer26-=10000;
        }else if(tempIndexRemover == 27){
          kategoriCustomer27-=10000;
        }else if(tempIndexRemover == 28){
          kategoriCustomer28-=10000;
        }else if(tempIndexRemover == 29){
          kategoriCustomer29-=10000;
        }else if(tempIndexRemover == 30){
          kategoriCustomer30-=10000;
        } else if(tempIndexRemover == 31){
          kategoriCustomer31-=10000;
        } else if(tempIndexRemover == 32){
          kategoriCustomer32-=10000;
        } else if(tempIndexRemover == 33){
          kategoriCustomer33-=10000;
        }else if(tempIndexRemover == 34){
          kategoriCustomer34-=10000;
        }else if(tempIndexRemover == 35){
          kategoriCustomer35-=10000;
        }else if(tempIndexRemover == 36){
          kategoriCustomer36-=10000;
        }else if(tempIndexRemover == 37){
          kategoriCustomer37-=10000;
        }else if(tempIndexRemover == 38){
          kategoriCustomer38-=10000;
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
        scoreKategori1: kategoriCustomer1<0?0:kategoriCustomer1,
        kategori2: 'bisnis',
        scoreKategori2: kategoriCustomer2<0?0:kategoriCustomer2,
        kategori3: 'politik',
        scoreKategori3: kategoriCustomer3<0?0:kategoriCustomer3,
        kategori4: 'hukum',
        scoreKategori4: kategoriCustomer4<0?0:kategoriCustomer4,
        kategori5: 'ekonomi',
        scoreKategori5: kategoriCustomer5<0?0:kategoriCustomer5,
        kategori6: 'olahraga',
        scoreKategori6: kategoriCustomer6<0?0:kategoriCustomer6,
        kategori7: 'teknologi',
        scoreKategori7: kategoriCustomer7<0?0:kategoriCustomer7,
        kategori8: 'otomotif',
        scoreKategori8: kategoriCustomer8<0?0:kategoriCustomer8,
        kategori9: 'internasional',
        scoreKategori9: kategoriCustomer9<0?0:kategoriCustomer9,
        kategori10: 'bola',
        scoreKategori10: kategoriCustomer10<0?0:kategoriCustomer10,
        kategori11: 'selebritis',
        scoreKategori11: kategoriCustomer11<0?0:kategoriCustomer11,
        kategori12: 'lifestyle',
        scoreKategori12: kategoriCustomer12<0?0:kategoriCustomer12,
        kategori13: 'hiburan',
        scoreKategori13: kategoriCustomer13<0?0:kategoriCustomer13,
        kategori14: 'jakarta',
        scoreKategori14: kategoriCustomer14<0?0:kategoriCustomer14,
        kategori15: 'market',
        scoreKategori15: kategoriCustomer15<0?0:kategoriCustomer15,
        kategori16: 'news',
        scoreKategori16: kategoriCustomer16<0?0:kategoriCustomer16,
        kategori17: 'cantik',
        scoreKategori17: kategoriCustomer17<0?0:kategoriCustomer17,
        kategori18: 'travel',
        scoreKategori18: kategoriCustomer18<0?0:kategoriCustomer18,
        kategori19: 'syariah',
        scoreKategori19: kategoriCustomer19<0?0:kategoriCustomer19,
        kategori20: 'islam',
        scoreKategori20: kategoriCustomer20<0?0:kategoriCustomer20,
        kategori21: 'sains',
        scoreKategori21: kategoriCustomer21<0?0:kategoriCustomer21,
        kategori22: 'edukasi',
        scoreKategori22: kategoriCustomer22<0?0:kategoriCustomer22,
        kategori23: 'kesehatan',
        scoreKategori23: kategoriCustomer23<0?0:kategoriCustomer23,
        kategori24: 'humaniora',
        scoreKategori24: kategoriCustomer24<0?0:kategoriCustomer24,
        kategori25: 'entrepreneur',
        scoreKategori25: kategoriCustomer25<0?0:kategoriCustomer25,
        kategori26: 'opini',
        scoreKategori26: kategoriCustomer26<0?0:kategoriCustomer26,
        kategori27: 'khas',
        scoreKategori27: kategoriCustomer27<0?0:kategoriCustomer27,
        kategori28: 'jateng',
        scoreKategori28: kategoriCustomer28<0?0:kategoriCustomer28,
        kategori29: 'daerah',
        scoreKategori29: kategoriCustomer29<0?0:kategoriCustomer29,
        kategori30: 'khazanah',
        scoreKategori30: kategoriCustomer30<0?0:kategoriCustomer30,
        kategori31: 'leisure',
        scoreKategori31: kategoriCustomer31<0?0:kategoriCustomer31,
        kategori32: 'metro',
        scoreKategori32: kategoriCustomer32<0?0:kategoriCustomer32,
        kategori33: 'ekbis',
        scoreKategori33: kategoriCustomer33<0?0:kategoriCustomer33,
        kategori34: 'kalam',
        scoreKategori34: kategoriCustomer34<0?0:kategoriCustomer34,
        kategori35: 'difabel',
        scoreKategori35: kategoriCustomer35<0?0:kategoriCustomer35,
        kategori36: 'creativelab',
        scoreKategori36: kategoriCustomer36<0?0:kategoriCustomer36,
        kategori37: 'inforial',
        scoreKategori37: kategoriCustomer37<0?0:kategoriCustomer37,
        kategori38: 'event',
        scoreKategori38: kategoriCustomer38<0?0:kategoriCustomer38,
      );

      await Future.delayed(Duration(seconds: 2));
      await UserRepository.instance.updateUserRecord(user, idCustomer);
      await Future.delayed(Duration(seconds: 3));
      UserRepository.instance.getSingelUserDetails(emailCustomer);

      showCustomSnackbar('SUCCES', 'DATA SUDAH DIMASUKKAN', isError: false);

      print("Data yg di dapat : "+ filteredCategories.toString());
      print("Data yg di hapus : "+ removeCategories.toString());
      UserRepository.instance.resetListScore();
      Get.to(() => HomePage());
    }
    else{
      showCustomSnackbar('Error', 'Pilih setidaknya 3 kategori', isError: true);
    }
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

}
