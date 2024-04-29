import 'package:amigo/apis/api_handler.dart';
import 'package:amigo/constants/app_constants.dart';
import 'package:amigo/models/profile_create_response.dart';
import 'package:amigo/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getProfileDetails();
    super.onInit();
  }

  void getProfileDetails() {}

  void validateFields() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      callUpdateUserData();
    }
  }

  callUpdateUserData() async {
    try {
      isLoading.value = true;
      final body = {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "bio": bioController.text,
        "userName": usernameController.text
      };
      final ProfileCreateResponse? response =
          await ApiHandler().callCreateUserProfile(body);
      isLoading.value = false;
      if (response != null && response.data != null) {
        AppPreferences appPreferences = await AppPreferences.getInstance();
        appPreferences.saveSharedPreferences(
            AppConstants.firstName, response.data?.firstName ?? '');
        appPreferences.saveSharedPreferences(
            AppConstants.userEmail, response.data?.userName ?? '');
        appPreferences.saveSharedPreferences(
            AppConstants.userId, response.data?.userId ?? '');
        Get.toNamed(Routes.ADD_ROLE);
      }
    } on Exception catch (e) {
      isLoading.value = false;
      debugPrint('callSendOTPApi exception $e');
    }
  }
}
