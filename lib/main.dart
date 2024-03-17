import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:skripsilocal/firebase_options.dart';
import 'package:skripsilocal/pages/authentication/login_page.dart';
import 'package:skripsilocal/pages/authentication/mail_verification.dart';
import 'package:skripsilocal/pages/news/dummyNews.dart';
import 'package:skripsilocal/pages/home_page.dart';
import 'package:skripsilocal/pages/profile/pickCategory.dart';
import 'package:skripsilocal/pages/profile/core/manage_user_screen.dart';
import 'package:skripsilocal/pages/profile/core/profile_creen.dart';
import 'package:skripsilocal/pages/profile/fill_profile.dart';
import 'package:skripsilocal/pages/profile/profile_page.dart';
import 'package:skripsilocal/pages/authentication/reset_password_screen.dart';
import 'package:skripsilocal/pages/profile/updateCategory.dart';
import 'package:skripsilocal/pages/profile/update_profile.dart';
import 'package:skripsilocal/repository/authentication_repository/authentication_repository.dart';
import 'package:skripsilocal/src/features/Dummy/Inquiry%20News/CopyInquiryNews.dart';
import 'package:skripsilocal/src/features/Dummy/InquiryAllBookmark.dart';
import 'package:skripsilocal/src/features/authentication/screens/forget_password/password_verication.dart';

Future<void> main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  // WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).
  then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build (BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DummyBookmarkScreen(),
      // home: PickCategory(),
      // home: UpdateCategory(),
      // home: UpdateProfile_New(),
      // home : PasswordVerification(),
      // home: DummyNewsScreen(),
    );
  }
}

