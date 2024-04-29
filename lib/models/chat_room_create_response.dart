class ChatRoomCreateResponse {
  String? message;
  String? data;

  ChatRoomCreateResponse({this.message, this.data});

  ChatRoomCreateResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
