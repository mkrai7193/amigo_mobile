class CreateMessageResponse {
  String? messsage;
  int? status;
  CreateMessageData? data;

  CreateMessageResponse({this.messsage, this.data, this.status});

  CreateMessageResponse.fromJson(Map<String, dynamic> json) {
    messsage = json['messsage'];
    status = json['status'];
    data =
        json['data'] != null ? CreateMessageData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messsage'] = messsage;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CreateMessageData {
  String? chatroomId;
  String? sender;
  String? recipient;
  String? text;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CreateMessageData(
      {this.chatroomId,
      this.sender,
      this.recipient,
      this.text,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CreateMessageData.fromJson(Map<String, dynamic> json) {
    chatroomId = json['chatroomId'];
    sender = json['sender'];
    recipient = json['recipient'];
    text = json['text'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatroomId'] = chatroomId;
    data['sender'] = sender;
    data['recipient'] = recipient;
    data['text'] = text;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
