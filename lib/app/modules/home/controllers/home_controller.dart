import 'dart:convert';
import 'dart:developer';

import 'package:amigo/apis/api_handler.dart';
import 'package:amigo/constants/app_constants.dart';
import 'package:amigo/models/check_contacts_response.dart';
import 'package:amigo/models/get_contacts_response.dart';
import 'package:amigo/models/get_user_profile_response.dart';
import 'package:amigo/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isDirectMessageSelected = true.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  RxList<Contact> contactsList = <Contact>[].obs;
  RxList<GetContacts> getContactsList = <GetContacts>[].obs;
  RxBool isLoading = false.obs;
  RxBool isPermissionDenied = false.obs;
  Rx<UserProfile> userProfile = UserProfile().obs;

  @override
  void onInit() {
    getUserProfile();
    getContacts();
    getAllMessages();
    super.onInit();
  }

  void getUserProfile() async {
    try {
      isLoading.value = true;
      final GetUserProfileResponse? response =
          await ApiHandler().getUserProfile();
      isLoading.value = false;
      if (response != null && response.data != null) {
        userProfile.value = response.data!;
        AppPreferences appPreferences = await AppPreferences.getInstance();
        appPreferences.saveSharedPreferences(
            AppConstants.firstName, userProfile.value.firstName ?? '');
        appPreferences.saveSharedPreferences(
            AppConstants.userFullName, userProfile.value.userName ?? '');
        appPreferences.saveSharedPreferences(
            AppConstants.userProfilePic, userProfile.value.userProfile ?? '');
      }
    } on Exception catch (e) {
      isLoading.value = false;
      debugPrint('getUserProfile exception $e');
    }
  }

  Future getContacts() async {
    if (!(await FlutterContacts.requestPermission(readonly: true))) {
      isPermissionDenied.value = true;
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      contactsList.addAll(contacts);
      contactsList.refresh();
      checkContacts();
    }
  }

  void checkContacts() async {
    try {
      isLoading.value = true;
      final body = {"contact": contactsList};
      final CheckContactsResponse? response =
          await ApiHandler().checkContacts(body);
      isLoading.value = false;
      if (response != null) {
        getUserContacts();
      }
    } on Exception catch (e) {
      isLoading.value = false;
      debugPrint('checkContacts exception $e');
    }
  }

  void getUserContacts() async {
    try {
      isLoading.value = true;
      final GetContactsResponse? response = await ApiHandler().getContacts();
      isLoading.value = false;
      if (response != null &&
          response.data != null &&
          response.data!.isNotEmpty) {
        getContactsList.addAll(response.data!);
        getContactsList.refresh();
      }
    } on Exception catch (e) {
      isLoading.value = false;
      debugPrint('getUserContacts exception $e');
    }
  }

  void getAllMessages() {}

  void selectDirectMessage(bool selection) {
    isDirectMessageSelected.value = selection;
  }
}
