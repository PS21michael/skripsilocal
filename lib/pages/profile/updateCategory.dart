import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/Utils/CategoryUtils.dart';
import 'package:skripsilocal/models/user_model.dart';
import 'package:skripsilocal/pages/components/button.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/pages/profile/profile_page.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';


class UpdateCategory extends StatefulWidget {
  const UpdateCategory({super.key});

  @override
  _UpdateCategoryState createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  List<String> categories = ['Nasional', 'Bisnis', 'Politik', 'Hukum', 'Ekonomi', 'Olahraga', 'Teknologi', 'Otomotif', 'Internasional', 'Lifestyle', 'Hiburan', 'Travel', 'Sains', 'Edukasi', 'Kesehatan', 'Bola', 'Entrepreneur', 'Event'];
  // For debugging only
  List<String> selectedCategories = [];
  final listCategoryController = Get.put(CategoryListParser());
  List<String> userCategory = [];
  List<String> tempCategory = [];
  // List<int> daftarScore = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {

    List<int> daftarScore = UserRepository.instance.getListScore();
    List<int> scoreSecure = [];
    for(int i=0; i<38; i++){
      scoreSecure.add(daftarScore[i]);
    }
    listCategoryController.parseScoreToList(scoreSecure);
    print("List kategori favorit : ${listCategoryController.parseScoreToList(scoreSecure)}");
    userCategory = listCategoryController.parseScoreToList(scoreSecure); // List score
    tempCategory = listCategoryController.parseScoreToList(scoreSecure); // List score dari db
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
                    'Choose your favorite news category!',
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
                      // final lowercaseCategory = category;
                      // widget untuk ubah warna
                      return ChoiceChip(
                        label: Text(category),
                        selected: tempCategory.contains(category), // ==> TempCategory : Nyimpen kategori yg dipilih user skarang
                        // ketika diselect akan milih kategori
                        onSelected: (bool selected) async {
                          setState(() {
                            if (selected) {
                              if (!tempCategory.contains(category)) {
                                setState(() {
                                  // semua dalam temp kategori akan di highlight
                                  tempCategory.add(category);
                                  // For debugging only
                                  selectedCategories.add(category);
                                });
                              }
                            } else {
                              setState(() {
                                tempCategory.remove(category);
                                // For debugging only
                                selectedCategories.remove(category);
                              });
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
                      onTap: () async{
                        handleSubmit(userCategory); // kondis awal kategori
                      },
                      text: "Submit"
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

  Future<void> handleSubmit(List<String> listKategory) async {
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
    String DOBCustomer = UserRepository.instance.getUserModelDateOfBirth();
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
    print("User Category");
    print(listKategory);
    print("Selected Category");
    print(selectedCategories);
    print("Temp Category");
    print(tempCategory);
    List<String> removeCategories = []; //ToDO Data Hilang
    List<String> filteredCategories = categories.where((category) => tempCategory.contains(category)).toList(); //ToDO Data baru
    // print(filteredCategories);
    if (tempCategory.length >= 3) { // kategori yg sekarang dipilih
      for (String category in userCategory) {
        if (!filteredCategories.contains(category)) {
          removeCategories.add(category);
        }
      }
      for(int i=0; i<filteredCategories.length; i++){
        tempIndexFavorit = listCategoryController.listToScore(filteredCategories[i]);
        if(tempIndexFavorit == 1){
          kategoriCustomer1 = kategoriCustomer1>=1000?kategoriCustomer1:1000;
        } else if(tempIndexFavorit == 2){
          kategoriCustomer2 = kategoriCustomer2>=1000?kategoriCustomer2:1000;
        } else if(tempIndexFavorit == 3){
          kategoriCustomer3 = kategoriCustomer3>=1000?kategoriCustomer3:1000;
        }else if(tempIndexFavorit == 4){
          kategoriCustomer4 = kategoriCustomer4>=1000?kategoriCustomer4:1000;
        }else if(tempIndexFavorit == 5){
          kategoriCustomer5 = kategoriCustomer5>=1000?kategoriCustomer5:1000;
        }else if(tempIndexFavorit == 6){
          kategoriCustomer6 = kategoriCustomer6>=1000?kategoriCustomer6:1000;
        }else if(tempIndexFavorit == 7){
          kategoriCustomer7 = kategoriCustomer7>=1000?kategoriCustomer7:1000;
        }else if(tempIndexFavorit == 8){
          kategoriCustomer8 = kategoriCustomer8>=1000?kategoriCustomer8:1000;
        }else if(tempIndexFavorit == 9){
          kategoriCustomer9 = kategoriCustomer9>=1000?kategoriCustomer9:1000;
        }else if(tempIndexFavorit == 10){
          kategoriCustomer10 = kategoriCustomer10>=1000?kategoriCustomer10:1000;
        } else if(tempIndexFavorit == 11){
          kategoriCustomer11 = kategoriCustomer11>=1000?kategoriCustomer11:1000;
        } else if(tempIndexFavorit == 12){
          kategoriCustomer12 = kategoriCustomer12>=1000?kategoriCustomer12:1000;
        } else if(tempIndexFavorit == 13){
          kategoriCustomer13 = kategoriCustomer13>=1000?kategoriCustomer13:1000;
        }else if(tempIndexFavorit == 14){
          kategoriCustomer14 = kategoriCustomer14>=1000?kategoriCustomer14:1000;
        }else if(tempIndexFavorit == 15){
          kategoriCustomer15 = kategoriCustomer15>=1000?kategoriCustomer15:1000;
        }else if(tempIndexFavorit == 16){
          kategoriCustomer16 = kategoriCustomer16>=1000?kategoriCustomer16:1000;
        }else if(tempIndexFavorit == 17){
          kategoriCustomer17 = kategoriCustomer17>=1000?kategoriCustomer17:1000;
        }else if(tempIndexFavorit == 18){
          kategoriCustomer18 = kategoriCustomer18>=1000?kategoriCustomer18:1000;
        }else if(tempIndexFavorit == 19){
          kategoriCustomer19 = kategoriCustomer19>=1000?kategoriCustomer19:1000;
        }else if(tempIndexFavorit == 20){
          kategoriCustomer20 = kategoriCustomer20>=1000?kategoriCustomer20:1000;
        } else if(tempIndexFavorit == 21){
          kategoriCustomer21 = kategoriCustomer21>=1000?kategoriCustomer21:1000;
        } else if(tempIndexFavorit == 22){
          kategoriCustomer22 = kategoriCustomer22>=1000?kategoriCustomer22:1000;
        } else if(tempIndexFavorit == 23){
          kategoriCustomer23 = kategoriCustomer23>=1000?kategoriCustomer23:1000;
        }else if(tempIndexFavorit == 24){
          kategoriCustomer24 = kategoriCustomer24>=1000?kategoriCustomer24:1000;
        }else if(tempIndexFavorit == 25){
          kategoriCustomer25 = kategoriCustomer25>=1000?kategoriCustomer25:1000;
        }else if(tempIndexFavorit == 26){
          kategoriCustomer26 = kategoriCustomer26>=1000?kategoriCustomer26:1000;
        }else if(tempIndexFavorit == 27){
          kategoriCustomer27 = kategoriCustomer27>=1000?kategoriCustomer27:1000;
        }else if(tempIndexFavorit == 28){
          kategoriCustomer28 = kategoriCustomer28>=1000?kategoriCustomer28:1000;
        }else if(tempIndexFavorit == 29){
          kategoriCustomer29 = kategoriCustomer29>=1000?kategoriCustomer29:1000;
        }else if(tempIndexFavorit == 30){
          kategoriCustomer30 = kategoriCustomer30>=1000?kategoriCustomer30:1000;
        } else if(tempIndexFavorit == 31){
          kategoriCustomer31 = kategoriCustomer31>=1000?kategoriCustomer31:1000;
        } else if(tempIndexFavorit == 32){
          kategoriCustomer32 = kategoriCustomer32>=1000?kategoriCustomer32:1000;
        } else if(tempIndexFavorit == 33){
          kategoriCustomer33 = kategoriCustomer33>=1000?kategoriCustomer33:1000;
        }else if(tempIndexFavorit == 34){
          kategoriCustomer34 = kategoriCustomer34>=1000?kategoriCustomer34:1000;
        }else if(tempIndexFavorit == 35){
          kategoriCustomer35 = kategoriCustomer35>=1000?kategoriCustomer35:1000;
        }else if(tempIndexFavorit == 36){
          kategoriCustomer36 = kategoriCustomer36>=1000?kategoriCustomer36:1000;
        }else if(tempIndexFavorit == 37){
          kategoriCustomer37 = kategoriCustomer37>=1000?kategoriCustomer37:1000;
        }else if(tempIndexFavorit == 38){
          kategoriCustomer38 = kategoriCustomer38>=1000?kategoriCustomer38:1000;
        }
      }
      for(int i=0; i<removeCategories.length; i++){
        tempIndexRemover = listCategoryController.listToScore(removeCategories[i]);
        if(tempIndexRemover == 1){
          kategoriCustomer1-=1000;
        } else if(tempIndexRemover == 2){
          kategoriCustomer2-=1000;
        } else if(tempIndexRemover == 3){
          kategoriCustomer3-=1000;
        }else if(tempIndexRemover == 4){
          kategoriCustomer4-=1000;
        }else if(tempIndexRemover == 5){
          kategoriCustomer5-=1000;
        }else if(tempIndexRemover == 6){
          kategoriCustomer6-=1000;
        }else if(tempIndexRemover == 7){
          kategoriCustomer7-=1000;
        }else if(tempIndexRemover == 8){
          kategoriCustomer8-=1000;
        }else if(tempIndexRemover == 9){
          kategoriCustomer9-=1000;
        }else if(tempIndexRemover == 10){
          kategoriCustomer10-=1000;
        } else if(tempIndexRemover == 11){
          kategoriCustomer11-=1000;
        } else if(tempIndexRemover == 12){
          kategoriCustomer12-=1000;
        } else if(tempIndexRemover == 13){
          kategoriCustomer13-=1000;
        }else if(tempIndexRemover == 14){
          kategoriCustomer14-=1000;
        }else if(tempIndexRemover == 15){
          kategoriCustomer15-=1000;
        }else if(tempIndexRemover == 16){
          kategoriCustomer16-=1000;
        }else if(tempIndexRemover == 17){
          kategoriCustomer17-=1000;
        }else if(tempIndexRemover == 18){
          kategoriCustomer18-=1000;
        }else if(tempIndexRemover == 19){
          kategoriCustomer19-=1000;
        }else if(tempIndexRemover == 20){
          kategoriCustomer20-=1000;
        } else if(tempIndexRemover == 21){
          kategoriCustomer21-=1000;
        } else if(tempIndexRemover == 22){
          kategoriCustomer22-=1000;
        } else if(tempIndexRemover == 23){
          kategoriCustomer23-=1000;
        }else if(tempIndexRemover == 24){
          kategoriCustomer24-=1000;
        }else if(tempIndexRemover == 25){
          kategoriCustomer25-=1000;
        }else if(tempIndexRemover == 26){
          kategoriCustomer26-=1000;
        }else if(tempIndexRemover == 27){
          kategoriCustomer27-=1000;
        }else if(tempIndexRemover == 28){
          kategoriCustomer28-=1000;
        }else if(tempIndexRemover == 29){
          kategoriCustomer29-=1000;
        }else if(tempIndexRemover == 30){
          kategoriCustomer30-=1000;
        } else if(tempIndexRemover == 31){
          kategoriCustomer31-=1000;
        } else if(tempIndexRemover == 32){
          kategoriCustomer32-=1000;
        } else if(tempIndexRemover == 33){
          kategoriCustomer33-=1000;
        }else if(tempIndexRemover == 34){
          kategoriCustomer34-=1000;
        }else if(tempIndexRemover == 35){
          kategoriCustomer35-=1000;
        }else if(tempIndexRemover == 36){
          kategoriCustomer36-=1000;
        }else if(tempIndexRemover == 37){
          kategoriCustomer37-=1000;
        }else if(tempIndexRemover == 38){
          kategoriCustomer38-=1000;
        }
      }

      final user = UserModel(
        fullName: fullnameCustomer,
        email: emailCustomer,
        userName: usernameCustomer,
        province: provinceCustomer,
        dateOfBirth: DOBCustomer,
        joinDate: joinDateCustomer,
        profilePicture: profilPicturePathCustomer,
        scoreKategori1: kategoriCustomer1<0?0:kategoriCustomer1,
        scoreKategori2: kategoriCustomer2<0?0:kategoriCustomer2,
        scoreKategori3: kategoriCustomer3<0?0:kategoriCustomer3,
        scoreKategori4: kategoriCustomer4<0?0:kategoriCustomer4,
        scoreKategori5: kategoriCustomer5<0?0:kategoriCustomer5,
        scoreKategori6: kategoriCustomer6<0?0:kategoriCustomer6,
        scoreKategori7: kategoriCustomer7<0?0:kategoriCustomer7,
        scoreKategori8: kategoriCustomer8<0?0:kategoriCustomer8,
        scoreKategori9: kategoriCustomer9<0?0:kategoriCustomer9,
        scoreKategori10: kategoriCustomer10<0?0:kategoriCustomer10,
        scoreKategori11: kategoriCustomer11<0?0:kategoriCustomer11,
        scoreKategori12: kategoriCustomer12<0?0:kategoriCustomer12,
        scoreKategori13: kategoriCustomer13<0?0:kategoriCustomer13,
        scoreKategori14: kategoriCustomer14<0?0:kategoriCustomer14,
        scoreKategori15: kategoriCustomer15<0?0:kategoriCustomer15,
        scoreKategori16: kategoriCustomer16<0?0:kategoriCustomer16,
        scoreKategori17: kategoriCustomer17<0?0:kategoriCustomer17,
        scoreKategori18: kategoriCustomer18<0?0:kategoriCustomer18,
        scoreKategori19: kategoriCustomer19<0?0:kategoriCustomer19,
        scoreKategori20: kategoriCustomer20<0?0:kategoriCustomer20,
        scoreKategori21: kategoriCustomer21<0?0:kategoriCustomer21,
        scoreKategori22: kategoriCustomer22<0?0:kategoriCustomer22,
        scoreKategori23: kategoriCustomer23<0?0:kategoriCustomer23,
        scoreKategori24: kategoriCustomer24<0?0:kategoriCustomer24,
        scoreKategori25: kategoriCustomer25<0?0:kategoriCustomer25,
        scoreKategori26: kategoriCustomer26<0?0:kategoriCustomer26,
        scoreKategori27: kategoriCustomer27<0?0:kategoriCustomer27,
        scoreKategori28: kategoriCustomer28<0?0:kategoriCustomer28,
        scoreKategori29: kategoriCustomer29<0?0:kategoriCustomer29,
        scoreKategori30: kategoriCustomer30<0?0:kategoriCustomer30,
        scoreKategori31: kategoriCustomer31<0?0:kategoriCustomer31,
        scoreKategori32: kategoriCustomer32<0?0:kategoriCustomer32,
        scoreKategori33: kategoriCustomer33<0?0:kategoriCustomer33,
        scoreKategori34: kategoriCustomer34<0?0:kategoriCustomer34,
        scoreKategori35: kategoriCustomer35<0?0:kategoriCustomer35,
        scoreKategori36: kategoriCustomer36<0?0:kategoriCustomer36,
        scoreKategori37: kategoriCustomer37<0?0:kategoriCustomer37,
        scoreKategori38: kategoriCustomer38<0?0:kategoriCustomer38,
      );

      await Future.delayed(const Duration(seconds: 2));
      await UserRepository.instance.updateUserRecord(user, idCustomer);
      await Future.delayed(const Duration(seconds: 3));
      UserRepository.instance.getSingelUserDetails(emailCustomer);
      showCustomSnackbar('Success', 'Update success!', isError: false);
      print("Data yg di dapat : $filteredCategories");
      print("Data yg di hapus : $removeCategories");
      Get.to(() => const ProfilePage());
    }
    else{
      showCustomSnackbar('Error', 'Please select at least 3 categories!', isError: true);
    }
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

}
