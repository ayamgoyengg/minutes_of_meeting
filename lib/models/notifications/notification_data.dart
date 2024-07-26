part of "../models.dart";

class NotificationData {
  int? idNotification;
  String? title;
  String? description;
  String? direction;
  String? division;
  String? thumbnail;
  String? penerbit;
  int? createdAt;
  int? updatedAt;

  NotificationData({
    this.idNotification, 
    this.title, 
    this.description, 
    this.direction, 
    this.division,
    this.thumbnail,
    this.penerbit,
    this.createdAt, 
    this.updatedAt});

  NotificationData.fromJson(Map<String, dynamic> json) {
    idNotification = json['id_notification'];
    title = json['title'];
    description = json['description'];
    direction = json['direction'];
    division = json['division'];
    thumbnail = json['thumbnail'];
    penerbit = json['penerbit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_notification'] = idNotification;
    data['title'] = title;
    data['description'] = description;
    data['direction'] = direction;
    data['division'] = division;
    data['thumbnail'] = thumbnail;
    data['penerbit'] = penerbit;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
