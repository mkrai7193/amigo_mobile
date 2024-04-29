import 'dart:async';

import 'package:amigo/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOTPController extends GetxController {
  RxString phone = ''.obs;
  RxString verificationId = ''.obs;
  RxInt countDownTimer = 60.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinEditingController = TextEditingController();
  late Timer timer;

  @override
  void onInit() {
    phone.value = Get.arguments[AppConstants.userPhone];
    super.onInit();
  }

  void validateFields() {
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      //callVerifyPhoneNumber();
    }
  }

  void callVerifyPhoneNumber() {

  }
}
