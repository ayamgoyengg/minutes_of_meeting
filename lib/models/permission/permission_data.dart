part of "../models.dart";

class PermissionData {
  int? idPermission;
  String? employeeId;
  String? userId;
  // int? userId;
  String? category;
  String? totDay;
  // int? totDay;
  String? date;
  dynamic atc;
  String? accesorId;
  String? status;
  int? createdAt;
  int? updatedAt;
  UserData? user;

  PermissionData({this.idPermission, this.employeeId, this.userId, this.category, this.totDay, this.date, this.atc, this.accesorId, this.status, this.createdAt, this.updatedAt, this.user});

  PermissionData.fromJson(Map<String, dynamic> json) {
    try {
      idPermission = json['id_permission'];
      employeeId = json['employee_id'];
      userId = json['user_id'];
      category = json['category'];
      totDay = json['tot_day'];
      date = json['date'];
      atc = json['atc'];
      accesorId = json['accesor_id'];
      status = json['status'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    } catch (e) {
      log('Someth9ing wrong with the response PermissionData');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_permission'] = idPermission;
    data['employee_id'] = employeeId;
    data['user_id'] = userId;
    data['category'] = category;
    data['tot_day'] = totDay;
    data['date'] = date;
    data['atc'] = atc;
    data['accesor_id'] = accesorId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toJsonSend() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['employee_id'] = employeeId;
    data['user_id'] = userId;
    data['category'] = category;
    data['tot_day'] = totDay;
    data['date'] = date;
    data['atc'] = atc;
    return data;
  }
}
