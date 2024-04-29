class BotResponse {
  String? sender;
  String? message;

  BotResponse({this.sender, this.message});

  BotResponse.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender'] = sender;
    data['message'] = message;
    return data;
  }
}
