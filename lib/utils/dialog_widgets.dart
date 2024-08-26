import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtils {
  static void showCustomSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      borderRadius: 8,
      margin: const EdgeInsets.all(10),
      snackPosition: SnackPosition.TOP,
      boxShadows: [
        const BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 2),
          blurRadius: 6,
        ),
      ],
    );
  }
}
