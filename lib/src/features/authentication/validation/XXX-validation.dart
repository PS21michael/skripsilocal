import 'package:get/get.dart';

class Validation extends GetxController{
  
  static String? validateEmail (String? value){
    if(value == null || value.isEmpty){
      return 'Email is Required';
    }
    
    // Regular expression
    final emailRegExp = RegExp(r'/^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$/gm');

    if(!emailRegExp.hasMatch(value)){
      return 'Invalid email address.';
    }

    return null;
  }

}