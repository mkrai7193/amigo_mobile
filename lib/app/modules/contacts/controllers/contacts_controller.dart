import 'package:amigo/apis/api_handler.dart';
import 'package:amigo/models/check_contacts_response.dart';
import 'package:amigo/models/get_contacts_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  RxList<Contact> contactsList = <Contact>[].obs;
  RxList<GetContacts> getContactsList = <GetContacts>[].obs;
  RxBool isLoading = false.obs;
  RxBool isPermissionDenied = false.obs;

  @override
  void onInit() {
    getContacts();
    super.onInit();
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
}
