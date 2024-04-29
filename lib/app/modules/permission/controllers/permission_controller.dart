import 'package:amigo/app/routes/app_pages.dart';
import 'package:amigo/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class PermissionController extends GetxController {
  RxList<Contact> contactsList = <Contact>[].obs;
  RxBool isPermissionDenied = false.obs;

  @override
  void onReady() {
    _fetchContacts();
    super.onReady();
  }

  Future _fetchContacts() async {
    if (!(await FlutterContacts.requestPermission(readonly: true))) {
      isPermissionDenied.value = true;
    } else {
      final contacts = await FlutterContacts.getContacts(withProperties: true);
      contactsList.addAll(contacts);
      contactsList.refresh();
    }
  }

  void exitApp() {
    Snack.show(
        content:
            'Permission denied, you need to allow permission for contacts sync from Settings.',
        snackType: SnackType.info,
        behavior: SnackBarBehavior.floating);
    Get.back();
  }

  void navigateToHopePage() {
    Get.offAllNamed(Routes.HOME, arguments: {'contacts': contactsList});
  }
}
