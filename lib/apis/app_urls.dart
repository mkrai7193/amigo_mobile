class AppUrls {
  static const String baseUrl = 'http://54.91.125.125:9090/api';

  ///Onboarding urls
  static const String verifyOTP = '$baseUrl/user-auth/verify-otp';
  static const String botRegisterEmail =
      '$baseUrl/bot-auth/update-user-email-by-bot';
  static const String botRegister = '$baseUrl/bot-auth/create-user-by-bot';

  ///User
  static const String updateUser = '$baseUrl/user/update-user-profile';
  static const String createUser = '$baseUrl/user-auth/create-userinfo';
  static const String getUser = '$baseUrl/user/get-user-profile';

  ///Contacts
  static const String checkContacts = '$baseUrl/user/check-number-on-server';
  static const String getContacts = '$baseUrl/user/get-user-list-of-user';

  ///Chats
  static const String createChatRoom = '$baseUrl/chat/create-chatroom';
  static const String createMessage = '$baseUrl/chat/create-message';
  static const String getChatRoomId =
      '$baseUrl/chat/get-chatroom-id?recieverUserId=';
  static const String getChatMessagesByChatRoomId =
      '$baseUrl/chat/get-chat-message-by-id?chatroomId=';
}
