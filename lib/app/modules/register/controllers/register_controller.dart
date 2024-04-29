import 'package:amigo/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  RxBool isLoading = false.obs;

  void validateFields() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      callRegisterApi();
    }
  }

  void callRegisterApi() {
    Get.toNamed(Routes.VERIFY_O_T_P,
        arguments: {AppConstants.userPhone: mobileController.text});
  }
}
