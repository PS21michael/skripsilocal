import 'package:flutter/material.dart';
import 'package:skripsilocal/pages/components/button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                      onTap: (){},
                      text: "Submit"),
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

  void handleSubmit() {
    // Handle the submission logic here
    print('Kategori yang Dipilih:');
    for (String category in selectedCategories) {
      print(category);
    }
  }
}
