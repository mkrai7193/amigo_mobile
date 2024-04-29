class GetUserProfileResponse {
  String? message;
  int? status;
  UserProfile? data;

  GetUserProfileResponse({this.message, this.status, this.data});

  GetUserProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? UserProfile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserProfile {
  String? sId;
  String? phone;
  bool? isOnline;
  String? firstName;
  String? lastName;
  String? userProfile;
  String? userName;
  String? bio;
  bool? isDarkMode;
  String? userAccountType;
  bool? isNotificationEnable;
  bool? isPhoneVisible;

  UserProfile(
      {this.sId,
      this.phone,
      this.isOnline,
      this.firstName,
      this.lastName,
      this.userProfile,
      this.userName,
      this.bio,
      this.isDarkMode,
      this.userAccountType,
      this.isNotificationEnable,
      this.isPhoneVisible});

  UserProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    isOnline = json['isOnline'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userProfile = json['userProfile'];
    userName = json['userName'];
    bio = json['bio'];
    isDarkMode = json['isDarkMode'];
    userAccountType = json['userAccountType'];
    isNotificationEnable = json['isNotificationEnable'];
    isPhoneVisible = json['isPhoneVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phone'] = phone;
    data['isOnline'] = isOnline;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userProfile'] = userProfile;
    data['userName'] = userName;
    data['bio'] = bio;
    data['isDarkMode'] = isDarkMode;
    data['userAccountType'] = userAccountType;
    data['isNotificationEnable'] = isNotificationEnable;
    data['isPhoneVisible'] = isPhoneVisible;
    return data;
  }
}
