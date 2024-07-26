part of "../models.dart";

class WhistleblowingData {
  int? idWhistleblowing;
  String? userId;
  // int? userId;
  String? name;
  String? comment;
  String? answer;
  int? createdAt;
  int? updatedAt;
  UserData? user;

  WhistleblowingData({
    this.idWhistleblowing, 
    this.userId, 
    this.name, 
    this.comment,
    this.answer,
    this.createdAt, 
    this.updatedAt, 
    this.user
    });

  WhistleblowingData.fromJson(Map<String, dynamic> json) {
    idWhistleblowing = json['id_whistleblowing'];
    userId = json['user_id'];
    name = json['name'];
    comment = json['comment'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_whistleblowing'] = idWhistleblowing;
    data['user_id'] = userId;
    data['name'] = name;
    data['comment'] = comment;
    data['answer'] = answer;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toJsonSend() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['comment'] = comment;
    return data;
  }
}
