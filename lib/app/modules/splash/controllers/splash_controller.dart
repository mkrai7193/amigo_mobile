import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/app_constants.dart';
import '../../../../utils/shared_preferences.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    getAccessToken();
    super.onInit();
  }

  Future<void> getAccessToken() async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String authToken =
        appPreferences.getSharedPreferences(AppConstants.accessTokenKey);
    String firstName =
        appPreferences.getSharedPreferences(AppConstants.firstName);
    String accountType =
        appPreferences.getSharedPreferences(AppConstants.accountType);
    bool isLoggedIn =
        appPreferences.getBoolSharedPreferences(AppConstants.isLoggedIn);
    debugPrint(
        'authToken $authToken,\n firstName $firstName \n accountType $accountType');
    await 3.delay();
    if (authToken.isNotEmpty) {
      if (firstName.isNotEmpty) {
        if (accountType.isNotEmpty) {
          Get.offAllNamed(Routes.HOME);
        } else {
          Get.offAllNamed(Routes.ADD_ROLE);
        }
      } else {
        Get.offAllNamed(Routes.PROFILE);
      }
    } else {
      Get.offAllNamed(Routes.SIGN_IN_BOT);
    }
  }
}
