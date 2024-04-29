class ProfileCreateResponse {
  String? message;
  ProfileData? data;

  ProfileCreateResponse({this.message, this.data});

  ProfileCreateResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileData {
  String? sId;
  String? userId;
  List<UserMoreData>? userMoreData;
  String? userProfile;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? userAccountType;
  String? bio;
  String? firstName;
  bool? isDarkMode;
  bool? isNotificationEnable;
  bool? isPhoneVisible;
  String? lastName;
  String? userName;

  ProfileData(
      {this.sId,
      this.userId,
      this.userMoreData,
      this.userProfile,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.userAccountType,
      this.bio,
      this.firstName,
      this.isDarkMode,
      this.isNotificationEnable,
      this.isPhoneVisible,
      this.lastName,
      this.userName});

  ProfileData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    if (json['userMoreData'] != null) {
      userMoreData = <UserMoreData>[];
      json['userMoreData'].forEach((v) {
        userMoreData!.add(UserMoreData.fromJson(v));
      });
    }
    userProfile = json['userProfile'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    userAccountType = json['userAccountType'];
    bio = json['bio'];
    firstName = json['firstName'];
    isDarkMode = json['isDarkMode'];
    isNotificationEnable = json['isNotificationEnable'];
    isPhoneVisible = json['isPhoneVisible'];
    lastName = json['lastName'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    if (userMoreData != null) {
      data['userMoreData'] = userMoreData!.map((v) => v.toJson()).toList();
    }
    data['userProfile'] = userProfile;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['userAccountType'] = userAccountType;
    data['bio'] = bio;
    data['firstName'] = firstName;
    data['isDarkMode'] = isDarkMode;
    data['isNotificationEnable'] = isNotificationEnable;
    data['isPhoneVisible'] = isPhoneVisible;
    data['lastName'] = lastName;
    data['userName'] = userName;
    return data;
  }
}

class UserMoreData {
  String? email;
  String? phone;

  UserMoreData({this.email, this.phone});

  UserMoreData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
