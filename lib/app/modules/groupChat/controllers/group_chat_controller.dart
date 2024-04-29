import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupChatController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    getChatDetails();
    super.onInit();
  }

  getChatDetails() {}
}
