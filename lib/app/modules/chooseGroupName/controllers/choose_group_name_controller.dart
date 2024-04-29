import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseGroupNameController extends GetxController {
  RxList<bool> membersList = List.generate(10, (index) => false).obs;
  RxInt selectedContacts = 0.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    getContactsList();
    super.onInit();
  }

  void getContactsList() {}

  void selectContacts(int index) {
    membersList[index] = !membersList[index];
    membersList.refresh();
    selectedContacts.value = membersList.where((p0) => p0).length;
  }
}
