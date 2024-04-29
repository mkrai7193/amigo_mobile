class CheckContactsResponse {
  String? message;
  int? status;
  CheckContacts? data;

  CheckContactsResponse({this.message, this.status, this.data});

  CheckContactsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? CheckContacts.fromJson(json['data']) : null;
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

class CheckContacts {
  String? userId;
  List<String>? contactNum;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CheckContacts(
      {this.userId,
      this.contactNum,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CheckContacts.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    contactNum = json['contactNum'].cast<String>();
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['contactNum'] = contactNum;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
