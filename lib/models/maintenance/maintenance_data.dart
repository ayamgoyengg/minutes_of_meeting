part of "../models.dart";

class MaintenanceData {
  int? idMaintenance;
  String? title;
  String? description;
  String? link;
  String? status;
  int? createdAt;
  int? updatedAt;

  MaintenanceData({this.idMaintenance, this.title, this.description, this.link, this.status, this.createdAt, this.updatedAt});

  MaintenanceData.fromJson(Map<String, dynamic> json) {
    idMaintenance = json['id_maintenance'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_maintenance'] = idMaintenance;
    data['title'] = title;
    data['description'] = description;
    data['link'] = link;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
