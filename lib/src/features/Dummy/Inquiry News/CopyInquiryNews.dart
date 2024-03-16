import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:skripsilocal/pages/components/button.dart';

class InquiryNews extends StatefulWidget {
  const InquiryNews({Key? key}) : super(key: key);

  @override
  State<InquiryNews> createState() => _InquiryNewsState();
}

class _InquiryNewsState extends State<InquiryNews> {
  int selectedIndex = 0;
  int selectedSecondIndex = 0;

  List<String> portal = [
    'Antara', 'CNN', 'CNBC', 'Merdeka', 'Okezone', 'Republika', 'Sindo News', 'Suara', 'Tempo'
  ];
  List<List<String>> kategori = [
    ['Politik', 'Otomotif', 'Olahraga', 'Lifestyle', 'Humaniora', 'Hukum', 'Hiburan', 'Ekonomi', 'Internasional', 'Bola', 'Teknologi'],
    ['Politik', 'Otomotif', 'Olahraga', 'Lifestyle', 'Humaniora', 'Hukum'],
    ['News', 'Market', 'Enterpreneur', 'Syariah', 'Teknologi', 'Lifestyle', 'Opini'],
    ['Jakarta', 'Dunia', 'Gaya', 'Olahrga', 'Teknologi', 'Otomotif', 'Khas', 'Sehat','Jawa Tengah'],
    ['Celebrity', 'Olahraga', 'Otomotif', 'Ekonomi', 'Teknologi', 'Lifestyle'],
    ['News', 'Daerah', 'Khazanah', 'Islam', 'Internasional', 'Bola', 'Leisure'],
    ['Nasional', 'Metro', 'Ekbis', 'Internasional', 'Daerah', 'Olahraga', 'Otomotif', 'Teknologi', 'Sains', 'Edukasi', 'Lifestyle', 'Kalam'],
    ['Bisnis', 'Bola', 'Lifestyle', 'Entertainment', 'Otomotif', 'Teknologi', 'Kesehatan'],
    ['Nasional', 'Bisnis', 'Metro', 'Dunia', 'Bola', 'Kecatikan', 'Teknologi', 'Otomotif', 'Celebrity', 'Style', 'Travel', 'Difabel', 'Creative Lab', 'Inforial', 'Event']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.jpg',
                  width: 200,
                  height: 200,
                ),
                const Text(
                  'Update news dulu!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Portal Berita :',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    value: portal[selectedIndex],
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedIndex = portal.indexOf(newValue);
                        });
                      }
                    },
                    items: portal.map<DropdownMenuItem<String>>((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    buttonStyleData: ButtonStyleData(
                      height: 60,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 16,
                      iconEnabledColor: Colors.black,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 60,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Kategori Berita :',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (selectedIndex >= 0 && selectedIndex < kategori.length)
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      value: kategori[selectedIndex][selectedSecondIndex],
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedSecondIndex = kategori[selectedIndex].indexOf(newValue);
                          });
                        }
                      },
                      items: kategori[selectedIndex].map<DropdownMenuItem<String>>((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: SizedBox(
                            width: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      buttonStyleData: ButtonStyleData(
                        height: 60,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 16,
                        iconEnabledColor: Colors.black,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 60,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(10),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                theButton(
                    text: 'Submit',
                    onTap: (){}
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
