import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skripsilocal/pages/news/news.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:skripsilocal/repository/user_repository/user_repository.dart';

class RecommendHeader extends StatelessWidget implements PreferredSizeWidget {
  const RecommendHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    // final userController = Get.put(ProfileController());
    // final ratingController = Get.put(RatingController());
    // final recommendationController = Get.put(RecommendationController());
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          String idPengguna = UserRepository.instance.getUserModelId();
          HistoryRepository.instance.getAllHistoryDetailsFromIdUser(idPengguna);
          // String temp = "";
          // temp = HistoryRepository.instance.isDataAvail();
          Get.to(() => const NewsPage());
        },
      ),
      title: const Text(
        'Baca Berita',
        style: TextStyle(
          fontSize: 28,
          letterSpacing: 5,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      elevation: 5,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          height: 1,
          color: Colors.black.withOpacity(1),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

