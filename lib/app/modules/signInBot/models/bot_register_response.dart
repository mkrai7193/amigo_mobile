class BotRegisterResponse {
  String? message;
  String? data;
  String? token;
  String? firstName;
  String? lastName;
  String? bio;
  String? userName;

  BotRegisterResponse(
      {this.message,
      this.data,
      this.token,
      this.firstName,
      this.lastName,
      this.bio,
      this.userName});

  BotRegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    token = json['token'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    bio = json['bio'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['data'] = this.data;
    data['token'] = token;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['bio'] = bio;
    data['userName'] = userName;
    return data;
  }
}
