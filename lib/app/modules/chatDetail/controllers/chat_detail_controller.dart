import 'dart:convert';

import 'package:amigo/apis/api_handler.dart';
import 'package:amigo/constants/app_constants.dart';
import 'package:amigo/models/chat_messages_list_response.dart';
import 'package:amigo/models/chat_room_create_response.dart';
import 'package:amigo/models/create_message_response.dart';
import 'package:amigo/models/get_chat_room_id_response.dart';
import 'package:amigo/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../apis/socket_manager.dart';
import '../../../../models/get_contacts_response.dart';

class ChatDetailController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController messageController = TextEditingController();
  Rx<GetContacts> getUser = GetContacts().obs;
  RxString chatRoomId = ''.obs;
  RxBool showSendButton = false.obs;
  RxList<ChatMessageListData> chatList = <ChatMessageListData>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getUserId();
    super.onInit();
  }

  getUserId() {
    if (Get.arguments != null && Get.arguments[AppConstants.userId] != null) {
      getUser.value = Get.arguments[AppConstants.userId];
      getChatRoomId();
    }
  }

  void createChatRoom() async {
    isLoading.value = true;
    try {
      final body = {
        "participants": [getUser.value.sId], //userid
        "chatRoomType": "OneToOne" // Group || OneToOne
      };
      final ChatRoomCreateResponse? response =
          await ApiHandler().createChatRoom(body);
      isLoading.value = false;
      if (response != null && response.data != null) {
        chatRoomId.value = response.data!;
        SocketIOManager().emitEvent('joinRoom', chatRoomId.value);
        getChatMessagesByChatRoomId();
      }
    } on Exception catch (e) {
      isLoading.value = false;
      debugPrint('createChatRoom exception $e');
    }
  }

  void getChatRoomId() async {
    isLoading.value = true;
    try {
      final GetChatRoomIdResponse? response =
          await ApiHandler().getChatRoomId(getUser.value.sId!);
      isLoading.value = false;
      if (response != null &&
          response.status != null &&
          response.status == '401') {
        createChatRoom();
      } else {
        if (response != null && response.data != null) {
          chatRoomId.value = response.data!;
          SocketIOManager().emitEvent('joinRoom', chatRoomId.value);
          getChatMessagesByChatRoomId();
        }
      }
    } on Exception catch (e) {
      isLoading.value = false;
      debugPrint('getChatRoomId exception $e');
    }
  }

  void getChatMessagesByChatRoomId() async {
    try {
      final ChatMessageListResponse? response =
          await ApiHandler().getChatMessagesByChatRoomId(chatRoomId.value);
      if (response != null &&
          response.status == 201 &&
          response.data != null &&
          response.data!.isNotEmpty) {
        chatList.clear();
        chatList.addAll(response.data!.toList());
        chatList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        chatList.refresh();
      }
    } on Exception catch (e) {
      debugPrint('getChatMessagesByChatRoomId exception $e');
    }
  }

  void validateFields() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      callCreateMessage();
    }
  }

  void callCreateMessage() async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String sender = appPreferences.getSharedPreferences(AppConstants.userId);
    try {
      final body = {
        "chatroomId": chatRoomId.value,
        "recipient": getUser.value.sId,
        "text": messageController.text,
        "sender": sender
      };
      SocketIOManager().emitEvent('sendMessage', body);
      /*final CreateMessageResponse? response =
          await ApiHandler().createMessage(body);
      if (response != null && response.status == 201 && response.data != null) {
        showSendButton.value = false;
        messageController.text = '';
        getChatMessagesByChatRoomId();
      }*/
    } on Exception catch (e) {
      debugPrint('callCreateMessage exception $e');
    }
  }
}
