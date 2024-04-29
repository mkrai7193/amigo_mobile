import 'package:amigo/apis/api_handler.dart';
import 'package:amigo/app/modules/signInBot/models/bot_register_response.dart';
import 'package:amigo/app/routes/app_pages.dart';
import 'package:amigo/constants/app_constants.dart';
import 'package:amigo/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRoleController extends GetxController {
  RxBool isLoading = false.obs;

  callUpdateUserData(String accountTpe) async {
    try {
      isLoading.value = true;
      final body = {"userAccountType": accountTpe};
      final BotRegisterResponse? response =
          await ApiHandler().callUpdateUserProfile(body);
      isLoading.value = false;
      if (response != null) {
        AppPreferences appPreferences = await AppPreferences.getInstance();
        appPreferences.saveSharedPreferences(
            AppConstants.accountType, accountTpe);
        Get.offAllNamed(Routes.PERMISSION);
      }
    } on Exception catch (e) {
      isLoading.value = false;
      debugPrint('callSendOTPApi exception $e');
    }
  }
}
