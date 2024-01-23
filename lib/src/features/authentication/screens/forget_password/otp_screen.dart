
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget{
  const OTPScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CO\nDE"
            ),
            Text(
              "Verification"
            ),
          ],
        ),
      ),
    );
  }


}