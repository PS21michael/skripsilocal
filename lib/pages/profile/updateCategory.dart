import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/Utils/Helper/CategoryUtils.dart';
import 'package:skripsilocal/pages/components/button.dart';
import 'package:skripsilocal/pages/components/snackbar_utils.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';

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
    await Future.delayed(Duration(seconds: 2));
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
    print("Total score Awal : ${daftarScore.length}");
    if(daftarScore.length.isLowerThan(1)){
      await Future.delayed(Duration(seconds: 2));
      await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    }
    print("Total score Akhir : ${daftarScore.length}");
    UserRepository.instance.resetListScore();
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
                        selected: TempselectedCategories.contains(category), // Periksa apakah kategori ada di dalam TempselectedCategories
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
                      onTap: (){
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

  void handleSubmit(List<String> listKategory) {
    // List<String> tempCategories2 = ['Bisnis', 'Politik', 'Hukum'];
    List<String> removeCategories = [];
    List<String> filteredCategories = categories.where((category) => selectedCategories.contains(category)).toList();
    print(filteredCategories);
    if (selectedCategories.length >= 3) {
      for (String category in userCategory) {
        if (!filteredCategories.contains(category)) {
          removeCategories.add(category);
        }
      }
    }
    else{
      showCustomSnackbar('Error', 'Pilih setidaknya 3 kategori', isError: true);
    }
  }

  void showCustomSnackbar(String title, String message, {bool isError = true}) {
    SnackbarUtils.showCustomSnackbar(title, message, isError: isError);
  }

}
