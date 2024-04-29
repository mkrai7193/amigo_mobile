import 'dart:convert';

import 'package:amigo/app/modules/signInBot/models/bot_register_response.dart';
import 'package:amigo/constants/app_constants.dart';
import 'package:amigo/models/chat_messages_list_response.dart';
import 'package:amigo/models/chat_room_create_response.dart';
import 'package:amigo/models/check_contacts_response.dart';
import 'package:amigo/models/create_message_response.dart';
import 'package:amigo/models/get_chat_room_id_response.dart';
import 'package:amigo/models/get_contacts_response.dart';
import 'package:amigo/models/get_user_profile_response.dart';
import 'package:amigo/models/profile_create_response.dart';
import 'package:amigo/utils/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../widgets/snack_bar.dart';
import 'app_urls.dart';

class ApiHandler {
  static ApiHandler handler = ApiHandler();
  Dio? dio;

  ApiHandler() {
    initDio();
  }

  void initDio() {
    dio = Dio();
    dio!.options
      ..connectTimeout = const Duration(milliseconds: 60000)
      ..receiveTimeout = const Duration(milliseconds: 60000);
    dio?.interceptors.add(
        LogInterceptor(responseBody: true, error: true, requestBody: true));
  }

  Future<BotRegisterResponse?> botRegister(body) async {
    try {
      if (dio == null) initDio();
      final Response<dynamic> response =
          await dio!.post(AppUrls.botRegister, data: jsonEncode(body));
      return BotRegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<BotRegisterResponse?> callRegisterEmailByBot(
      body, String token) async {
    try {
      final accessToken = 'Bearer $token';
      if (dio == null) initDio();
      final Response<dynamic> response = await dio!.post(
          AppUrls.botRegisterEmail,
          data: jsonEncode(body),
          options: Options(headers: <String, String>{
            'Authorization': accessToken,
            'Accept': 'application/json'
          }));
      return BotRegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<BotRegisterResponse?> callVerifyOTPApi(body) async {
    try {
      if (dio == null) initDio();
      final Response<dynamic> response =
          await dio!.post(AppUrls.verifyOTP, data: jsonEncode(body));
      return BotRegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<ProfileCreateResponse?> callCreateUserProfile(body) async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String token =
        appPreferences.getSharedPreferences(AppConstants.accessTokenKey);
    try {
      final accessToken = 'Bearer $token';
      if (dio == null) initDio();
      final Response<dynamic> response = await dio!.post(AppUrls.createUser,
          data: jsonEncode(body),
          options: Options(headers: <String, String>{
            'Authorization': accessToken,
            'Accept': 'application/json'
          }));
      debugPrint('callCreateUserProfile ${response.data}');
      return ProfileCreateResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<BotRegisterResponse?> callUpdateUserProfile(body) async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String token =
        appPreferences.getSharedPreferences(AppConstants.accessTokenKey);
    try {
      final accessToken = 'Bearer $token';
      if (dio == null) initDio();
      final Response<dynamic> response = await dio!.patch(AppUrls.updateUser,
          data: jsonEncode(body),
          options: Options(headers: <String, String>{
            'Authorization': accessToken,
            'Accept': 'application/json'
          }));
      debugPrint('callUpdateUserProfile ${response.data}');
      return BotRegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<GetUserProfileResponse?> getUserProfile() async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String token =
        appPreferences.getSharedPreferences(AppConstants.accessTokenKey);
    try {
      final accessToken = 'Bearer $token';
      debugPrint('getUserProfile $accessToken');
      if (dio == null) initDio();
      final Response<dynamic> response = await dio!.get(AppUrls.getUser,
          options: Options(headers: <String, String>{
            'Authorization': accessToken,
            'Accept': 'application/json'
          }));
      debugPrint('getUserProfile ${response.data}');
      return GetUserProfileResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<CheckContactsResponse?> checkContacts(body) async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String token =
        appPreferences.getSharedPreferences(AppConstants.accessTokenKey);
    try {
      final accessToken = 'Bearer $token';
      if (dio == null) initDio();
      final Response<dynamic> response = await dio!.post(AppUrls.checkContacts,
          data: jsonEncode(body),
          options: Options(headers: <String, String>{
            'Authorization': accessToken,
            'Accept': 'application/json'
          }));
      return CheckContactsResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<GetContactsResponse?> getContacts() async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String token =
        appPreferences.getSharedPreferences(AppConstants.accessTokenKey);
    try {
      final accessToken = 'Bearer $token';
      if (dio == null) initDio();
      final Response<dynamic> response = await dio!.get(AppUrls.getContacts,
          options: Options(headers: <String, String>{
            'Authorization': accessToken,
            'Accept': 'application/json'
          }));
      debugPrint('getContacts ${response.data}');
      return GetContactsResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<ChatRoomCreateResponse?> createChatRoom(body) async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String token =
        appPreferences.getSharedPreferences(AppConstants.accessTokenKey);
    try {
      final accessToken = 'Bearer $token';
      if (dio == null) initDio();
      final Response<dynamic> response = await dio!.post(AppUrls.createChatRoom,
          data: jsonEncode(body),
          options: Options(headers: <String, String>{
            'Authorization': accessToken,
            'Accept': 'application/json'
          }));
      debugPrint('createChatRoom ${response.data}');
      return ChatRoomCreateResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<GetChatRoomIdResponse?> getChatRoomId(String receiverUserId) async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String token =
        appPreferences.getSharedPreferences(AppConstants.accessTokenKey);
    try {
      final accessToken = 'Bearer $token';
      if (dio == null) initDio();
      final Response<dynamic> response = await dio!.get(
          '${AppUrls.getChatRoomId}$receiverUserId',
          options: Options(headers: <String, String>{
            'Authorization': accessToken,
            'Accept': 'application/json'
          }));
      debugPrint('getChatRoomId ${response.data}');
      return GetChatRoomIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<ChatMessageListResponse?> getChatMessagesByChatRoomId(
      String receiverUserId) async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String token =
        appPreferences.getSharedPreferences(AppConstants.accessTokenKey);
    try {
      final accessToken = 'Bearer $token';
      if (dio == null) initDio();
      final Response<dynamic> response = await dio!.get(
          '${AppUrls.getChatMessagesByChatRoomId}$receiverUserId',
          options: Options(headers: <String, String>{
            'Authorization': accessToken,
            'Accept': 'application/json'
          }));
      return ChatMessageListResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  Future<CreateMessageResponse?> createMessage(body) async {
    AppPreferences appPreferences = await AppPreferences.getInstance();
    String token =
        appPreferences.getSharedPreferences(AppConstants.accessTokenKey);
    try {
      final accessToken = 'Bearer $token';
      if (dio == null) initDio();
      final Response<dynamic> response = await dio!.post(AppUrls.createMessage,
          data: jsonEncode(body),
          options: Options(headers: <String, String>{
            'Authorization': accessToken,
            'Accept': 'application/json'
          }));
      debugPrint('createMessage ${response.data}');
      return CreateMessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('Exception $e');
      _handleError(e);
    }
    return null;
  }

  void _handleError(DioException e) async {
    Snack.show(
        content: e.response!.data!,
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating);
  }
}
