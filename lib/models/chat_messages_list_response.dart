class ChatMessageListResponse {
  String? messsage;
  int? status;
  List<ChatMessageListData>? data;

  ChatMessageListResponse({this.messsage, this.data, this.status});

  ChatMessageListResponse.fromJson(Map<String, dynamic> json) {
    messsage = json['messsage'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ChatMessageListData>[];
      json['data'].forEach((v) {
        data!.add(ChatMessageListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messsage'] = messsage;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatMessageListData {
  String? sId;
  String? chatroomId;
  String? sender;
  String? recipient;
  String? text;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ChatMessageListData(
      {this.sId,
      this.chatroomId,
      this.sender,
      this.recipient,
      this.text,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ChatMessageListData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    chatroomId = json['chatroomId'];
    sender = json['sender'];
    recipient = json['recipient'];
    text = json['text'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['chatroomId'] = chatroomId;
    data['sender'] = sender;
    data['recipient'] = recipient;
    data['text'] = text;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
