part of "../models.dart";

class CalenderData {
  int? idCalendar;
  // int? userId;
  String? userId;
  String? name;
  String? date;
  int? createdAt;
  int? updatedAt;
  UserData? user;

  CalenderData({this.idCalendar, this.userId, this.name, this.date, this.createdAt, this.updatedAt, this.user});

  CalenderData.fromJson(Map<String, dynamic> json) {
    idCalendar = json['id_calendar'];
    userId = json['user_id'];
    name = json['name'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_calendar'] = idCalendar;
    data['user_id'] = userId;
    data['name'] = name;
    data['date'] = date;
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
    data['date'] = date;
    return data;
  }
}
