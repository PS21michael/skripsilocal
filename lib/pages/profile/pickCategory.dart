import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skripsilocal/pages/components/button.dart';
import 'package:skripsilocal/pages/home_page.dart';

class PickCategory extends StatefulWidget {
  @override
  _PickCategoryState createState() => _PickCategoryState();
}

class _PickCategoryState extends State<PickCategory> {
  List<String> categories = ['Nasional', 'Bisnis', 'Politik', 'Hukum', 'Ekonomi', 'Olahrga', 'Teknologi', 'Otomotif', 'Internasional', 'Lifestyle', 'Hiburan', 'Travel', 'Sains', 'Edukasi', 'Kesehatan', 'Bola', 'Enterpreneur', 'Event'];
  List<String> selectedCategories = [];

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
                      onTap: (){
                        handleSubmit();
                      },
                      text: "Submit"
                  ),
                  SizedBox(height: 20),
                  Text('Kategori yang Dipilih:'),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: selectedCategories
                        .map((category) => Text(category, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleSubmit() {
    // List<String> tempCategories = ['Nasional', 'Bisnis', 'Politik'];
    // List<String> tempCategories2 = ['Bisnis', 'Politik', 'Hukum'];
    // List<String> resultCategories = [];
    // for (String category in tempCategories) {
    //   if (!tempCategories2.contains(category)) {
    //     resultCategories.add(category);
    //   }
    // }
    // print('Nilai yang tidak ada di tempCategories2: $resultCategories');

    List<String> filteredCategories = categories.where((category) => selectedCategories.contains(category)).toList();
    print(filteredCategories);
    // Get.to(() => HomePage(selectedCategories: filteredCategories));
  }
}
