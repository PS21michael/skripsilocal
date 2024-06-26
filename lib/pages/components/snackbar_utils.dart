import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtils {
  static void showCustomSnackbar(String title, String message, {bool isError = true}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      borderRadius: 10.0,
      duration: const Duration(seconds: 3),
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
