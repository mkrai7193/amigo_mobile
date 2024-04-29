import 'dart:io';

import 'package:amigo/apis/api_handler.dart';
import 'package:amigo/app/modules/signInBot/models/bot_register_response.dart';
import 'package:amigo/constants/app_constants.dart';
import 'package:amigo/utils/input_validator.dart';
import 'package:amigo/utils/shared_preferences.dart';
import 'package:amigo/utils/utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:mobile_number/mobile_number.dart';

import '../../../../models/bot_response.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../routes/app_pages.dart';

class SignInBotController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController messageController = TextEditingController();
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  RxMap<String, dynamic> deviceData = <String, dynamic>{}.obs;
  RxList<BotResponse> botList = <BotResponse>[].obs;
  RxBool isLoading = false.obs;
  RxString mobileNumber = ''.obs;
  RxString ipAddressText = ''.obs;
  RxString email = ''.obs;
  Rx<BotRegisterResponse> botResponse = BotRegisterResponse().obs;

  @override
  void onInit() {
    getDeviceId();
    getPhoneNumber();
    super.onInit();
  }

  getPhoneNumber() async {
    bool isPermissionGranted = await MobileNumber.hasPhonePermission;
    if (isPermissionGranted) {
      mobileNumber.value = (await MobileNumber.mobileNumber) ?? '';
      messageController.text = mobileNumber.value;
      debugPrint('isPermissionGranted ${mobileNumber.value}');
    } else {
      await MobileNumber.requestPhonePermission;
      getPhoneNumber();
    }
  }

  getIpAddress() async {
    try {
      var ipAddress = IpAddress(type: RequestType.text);
      ipAddressText.value = await ipAddress.getIpAddress();
    } on IpAddressException catch (exception) {
      /// Handle the exception.
      debugPrint(exception.message);
    }
  }

  Future<void> getDeviceId() async {
    Map<String, dynamic>? data = <String, dynamic>{};
    try {
      data = switch (defaultTargetPlatform) {
        TargetPlatform.android =>
          Utils().readAndroidBuildData(await deviceInfoPlugin.androidInfo),
        TargetPlatform.iOS =>
          Utils().readIosDeviceInfo(await deviceInfoPlugin.iosInfo),
        TargetPlatform.fuchsia => null,
        TargetPlatform.linux => null,
        TargetPlatform.macOS => null,
        TargetPlatform.windows => null
      };
    } on PlatformException {
      data = <String, dynamic>{'Error:': 'Failed to get platform version.'};
    }
    deviceData.value = data!;
    sendBotMessage();
  }

  sendBotMessage() {
    if (botList.isEmpty) {
      botList.add(BotResponse(
          message: 'Please enter your mobile number', sender: 'bot'));
    }
  }

  validateFields() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      if (botList[0].sender == 'bot' &&
          (botList[0].message == 'Please enter your mobile number' ||
              botList[0].message == 'Please enter another phone number')) {
        callSendOTPApi();
      } else if (botList[0].sender == 'bot' &&
          botList[0].message == 'Please enter your email') {
        callRegisterEmailByBot();
      } else {
        callVerifyOTPApi();
      }
    }
  }

  callRegisterEmailByBot() async {
    try {
      isLoading.value = true;
      final body = {"email": messageController.text};
      email.value = messageController.text;
      botList.insert(
          0, BotResponse(message: messageController.text, sender: 'user'));
      final BotRegisterResponse? response = await ApiHandler()
          .callRegisterEmailByBot(body, botResponse.value.data ?? '');
      isLoading.value = false;
      messageController.text = '';
      if (response!.message!.contains('OTP send')) {
        botList.insert(
            0, BotResponse(message: '${response.message}', sender: 'bot'));
        botList.insert(
            0, BotResponse(message: 'Please enter otp', sender: 'bot'));
      } else {
        botList.insert(
            0, BotResponse(message: response.message!, sender: 'bot'));
      }
    } on Exception catch (e) {
      isLoading.value = false;
      debugPrint('callSendOTPApi exception $e');
    }
  }

  validateInput(String value) {
    if (botList[0].sender == 'bot' &&
        botList[0].message == 'Please enter your mobile number') {
      return InputValidator().isValidPhoneNumber(value);
    } else if (botList[0].sender == 'bot' &&
        botList[0].message!.contains('Congratulation')) {
      return InputValidator().isValidEmail(value);
    }
  }

  callSendOTPApi() async {
    try {
      isLoading.value = true;
      final body = {
        "phone": messageController.text,
        "deviceInfo": {
          "deviceId": Platform.isAndroid
              ? "${deviceData['id']}"
              : "${deviceData['identifierForVendor']}",
          "deviceType": Platform.isAndroid ? 'Android' : 'iOS',
          "deviceIP": ipAddressText.value
        }
      };
      botList.insert(0,
          BotResponse(message: '+91${messageController.text}', sender: 'user'));
      final BotRegisterResponse? response =
          await ApiHandler().botRegister(body);
      isLoading.value = false;
      if (response != null && response.message != null) {
        botResponse.value = response;
        botList.insert(
            0, BotResponse(message: '${response.message}', sender: 'bot'));
        if (response.message!.contains('Congratulation')) {
          botList.insert(0,
              BotResponse(message: 'Please enter your email', sender: 'bot'));
          AppPreferences appPreferences = await AppPreferences.getInstance();
          appPreferences.saveSharedPreferences(
              AppConstants.accessTokenKey, response.data!);
        } else {
          botList.insert(
              0,
              BotResponse(
                  message: 'Please enter another phone number', sender: 'bot'));
        }
      } else {
        botList.insert(
            0, BotResponse(message: response!.message!, sender: 'bot'));
      }
      botList.refresh();
      messageController.text = '';
    } on Exception catch (e) {
      isLoading.value = false;
      debugPrint('callSendOTPApi exception $e');
    }
  }

  callVerifyOTPApi() async {
    try {
      isLoading.value = true;
      final body = {
        "email": email.value,
        "otp": int.parse(messageController.text)
      };
      botList.insert(
          0, BotResponse(message: messageController.text, sender: 'user'));
      final BotRegisterResponse? response =
          await ApiHandler().callVerifyOTPApi(body);
      isLoading.value = false;
      if (response != null &&
          response.message != null &&
          response.message!.contains('OTP verified')) {
        AppPreferences appPreferences = await AppPreferences.getInstance();
        appPreferences.saveBoolSharedPreferences(AppConstants.isLoggedIn, true);
        appPreferences.saveSharedPreferences(
            AppConstants.accessTokenKey, response.token!);
        Get.offAllNamed(Routes.PROFILE);
        Snack.show(
            content: 'OTP verified successfully',
            snackType: SnackType.info,
            behavior: SnackBarBehavior.floating);
      } else {
        botList.insert(
            0, BotResponse(message: response!.message!, sender: 'bot'));
      }
    } on Exception catch (e) {
      isLoading.value = false;
      debugPrint('callSendOTPApi exception $e');
    }
  }
}
