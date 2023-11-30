import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/components/my_tile.dart';
import 'package:skripsilocal/pages/data/calon.dart';
import 'package:skripsilocal/pages/home_detail2.dart';
import 'package:skripsilocal/pages/home_detail1.dart';
import 'package:skripsilocal/pages/home_detail3.dart';
import 'components/my_header.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List calon = [
    Calon(
        nomorUrut: 'Pasangan Nomor Urut #1',
        namaCapres: 'Anies Baswedan',
        namaCawapres: 'Muhaimin Iskandar',
        imagePath: 'assets/1246755_720.jpg',
    ),
    Calon(
        nomorUrut: 'Pasangan Nomor Urut #2',
        namaCapres: 'Prabowo Subianto',
        namaCawapres: 'Gibran Rakabuming',
        imagePath: 'assets/Didukung-Banyak-Tokoh-Berpengaruh-Prabowo-Gibran-Makin-Kuat-di-Jabar.jpg'
    ),
    Calon(
        nomorUrut: 'Pasangan Nomor Urut #3',
        namaCapres: 'Ganjar Pranowo',
        namaCawapres: 'Mahmud MD',
        imagePath: 'assets/rakernas-iv-pdip-5_169-1.jpeg'
    ),
  ];

  void navigateHomeDetail(int index){
    if(index == 0){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeDetail_1(),
        ),
      );
    }
    else if(index == 1){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeDetail_2(),
        ),
      );
    }
    else{
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeDetail_3(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyHeader(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
              ),
              child: ListView.builder(
                itemCount: calon.length,
                itemBuilder: (context, index) => MyTile(
                  calon: calon[index],
                  onTap: () => navigateHomeDetail(index),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: myNavBar(),
    );
  }
}
