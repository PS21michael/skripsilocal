import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skripsilocal/pages/components/my_navbar.dart';
import 'package:skripsilocal/pages/components/my_tile.dart';
import 'package:skripsilocal/pages/data/calon.dart';
import 'package:skripsilocal/pages/home_detail_1/home_detail1.dart';
import 'package:skripsilocal/pages/news/dummyNews.dart';
import 'package:skripsilocal/pages/profile/core/profile_creen.dart';
import 'package:skripsilocal/pages/profile/fill_profile.dart';
import 'package:skripsilocal/pages/profile/updateCategory.dart';
import '../Utils/Helper/CategoryUtils.dart';
import '../Utils/Helper/TimeSavedNews.dart';
import '../controller/signup_controller.dart';
import '../repository/authentication_repository/authentication_repository.dart';
import '../repository/user_repository/user_repository.dart';
import '../src/features/Dummy/Inquiry News/InquiryNews.dart';
import '../src/features/Dummy/InquiryAllBookmark.dart';
import '../src/features/Dummy/check_username_page.dart';
import 'components/my_header.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final dateTimecontroller = Get.put(TimeSavedParser());
  final listCategoryController = Get.put(CategoryListParser());
  final controller = Get.put(SignUpController());

  List calon = [
    Calon(
        nomorUrut: 'Pasangan Nomor Urut #1',
        namaCapres: 'Anies Baswedan',
        namaCawapres: 'Muhaimin Iskandar',
        imagePath: 'assets/1246755_720.jpg',
        koalisi: 'Koalisi Perubahan'
    ),
    Calon(
        nomorUrut: 'Pasangan Nomor Urut #2',
        namaCapres: 'Prabowo Subianto',
        namaCawapres: 'Gibran Rakabuming',
        imagePath: 'assets/Didukung-Banyak-Tokoh-Berpengaruh-Prabowo-Gibran-Makin-Kuat-di-Jabar.jpg',
        koalisi : 'Koalisi Indonesia Maju'
    ),
    Calon(
        nomorUrut: 'Pasangan Nomor Urut #3',
        namaCapres: 'Ganjar Pranowo',
        namaCawapres: 'Mahmud MD',
        imagePath: 'assets/rakernas-iv-pdip-5_169-1.jpeg',
        koalisi: ''
    ),
  ];

  void navigateHomeDetail(int index){
    if(index == 0){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeDetail_1(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
            onTap: () async{
              await Future.delayed(Duration(seconds: 2));
              await UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
              List<int> daftarScore = UserRepository.instance.getListScore();
              List<int> scoreSecure = [];
              List<String> listKategory = listCategoryController.parseScoreToList(scoreSecure);
              for(int i=0; i<38; i++){
                scoreSecure.add(daftarScore[i]);
              }

              //ARRAY KIRIMAN KE PAGE SELANJUTNYA
              listCategoryController.parseScoreToList(scoreSecure);

              print("List kategori favorit : "+ listCategoryController.parseScoreToList(scoreSecure).toString());



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

              // Get.to(()=> UpdateCategory());
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
          ),
          // GestureDetector(
          //   onTap: (){
          //     Get.to(()=>const DummyNewsScreen());
          //     // SignUpController.instace.logout();
          //     // AuthenticationRepository.instance.logout();
          //   },
          //   child: Container(
          //     height: 45,
          //     width: 100,
          //     decoration: BoxDecoration(
          //       color: Colors.blue[200],
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: const Center(
          //       child: Text("News",
          //         style: TextStyle(
          //             color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
          //
          GestureDetector(
            onTap: (){
              Get.to(()=>const InquiryNews());
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
                child: Text("Inquiry News",
                  style: TextStyle(
                      color: Colors.white),
                ),
              ),
            ),
          ),

          // PENTING -- Inquiry All BookMark
          GestureDetector(
            onTap: (){
              Get.to(()=>const DummyBookmarkScreen());
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
                child: Text("Inquiry BookMark",
                  style: TextStyle(
                      color: Colors.white),
                ),
              ),
            ),
          ),

          // Check Username Never Used
          GestureDetector(
            onTap: (){
              DateTime test = DateTime.now();
              print("Tanggal yang dikirim : " + test.toString());
              // Get.to(()=>const FillProfile());
              // Get.to(()=>const checkUsernamePage());
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
                child: Text("CheckUsername",
                  style: TextStyle(
                      color: Colors.white),
                ),
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: const MyNavBar(index: 0),
    );
  }
}
