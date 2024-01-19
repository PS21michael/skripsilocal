import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/components/my_tile.dart';
import 'package:skripsilocal/pages/data/calon.dart';
import 'package:skripsilocal/pages/home_detail2/home_detail2.dart';
import 'package:skripsilocal/pages/home_detail_1/home_detail1.dart';
import 'package:skripsilocal/pages/home_detail3/home_detail3.dart';
import 'package:skripsilocal/pages/profile/core/profile_creen.dart';
import '../src/features/authentication/controller/signup_controller.dart';
import '../src/repository/authentication_repository/authentication_repository.dart';
import 'components/my_header.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = Get.put(SignUpController());

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
          GestureDetector(
            onTap: (){
              Get.to(()=>ProfileScreen());
              // SignUpController.instace.logout();
              // AuthenticationRepository.instance.logout();
            },

            child: Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text("SO/Profile",
                  style: TextStyle(
                      color: Colors.white),
                ),
              ),
            ),
          )

        ],
      ),
      bottomNavigationBar: MyNavBar(index: 0),
    );
  }
}
