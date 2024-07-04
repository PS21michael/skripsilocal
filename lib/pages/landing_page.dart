import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skripsilocal/pages/news/explore.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with  SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // Future.delayed(const Duration(milliseconds: 100));
    // UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    // Future.delayed(const Duration(milliseconds: 100));
    // UserRepository.instance.getSingelUserDetails(AuthenticationRepository.instance.getUserEmail);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const ExplorePage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey.shade400,
                Colors.grey.shade200,
                Colors.grey.shade50,
                Colors.white
              ],
              begin: Alignment.center,
              end: Alignment.bottomCenter
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo-removebg-preview.png',
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
