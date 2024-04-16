import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skripsilocal/firebase_options.dart';
import 'package:skripsilocal/pages/authentication/login_page.dart';
import 'package:skripsilocal/pages/landing_page.dart';
import 'package:skripsilocal/pages/news/explore.dart';
import 'package:skripsilocal/pages/profile/profile_page.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/repository/history_repository/history_repository.dart';
import 'package:skripsilocal/repository/rating_repository/rating_repository.dart';
import 'package:skripsilocal/repository/recommendation_repository/recommendation_repository.dart';

import 'repository/bookmark_repository/bookmark_repository.dart';

Future<void> main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).
  then((value) => Get.put(AuthenticationRepository()));
  await Get.put(BookmarkRepository());
  await Get.put(HistoryRepository());
  await Get.put(RatingRepository());
  await Get.put(RecommendationRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [GetObserver()],
      // home: ProfilePage(),
      home: LandingPage(),
      // home: PickCategory(),
      // home: UpdateCategory(),
      // home: UpdateProfile_New(),
      // home : PasswordVerification(),
      // home: DummyNewsScreen(),
    );
  }
}

