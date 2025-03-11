import 'package:easymotorbike/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var phoneCharacterCount = 0.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void updatePhoneCount(int count) {
    phoneCharacterCount.value = count;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      Get.offAll(() => const DashboardScreen());
    } else {
      Get.snackbar(
        "⚠️ Login Failed",
        "Please enter a valid phone number and password.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
      );
    }
  }
}
