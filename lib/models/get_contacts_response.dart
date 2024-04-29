class GetContactsResponse {
  String? message;
  int? status;
  List<GetContacts>? data;

  GetContactsResponse({this.message, this.status, this.data});

  GetContactsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <GetContacts>[];
      json['data'].forEach((v) {
        data!.add(GetContacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetContacts {
  String? sId;
  String? phone;
  bool? isOnline;
  String? firstName;
  String? lastName;
  String? userProfile;

  GetContacts(
      {this.sId,
      this.phone,
      this.isOnline,
      this.firstName,
      this.lastName,
      this.userProfile});

  GetContacts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    isOnline = json['isOnline'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userProfile = json['userProfile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phone'] = phone;
    data['isOnline'] = isOnline;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userProfile'] = userProfile;
    return data;
  }
}
