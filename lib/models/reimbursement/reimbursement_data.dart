part of "../models.dart";

class ReimbursementData {
  int? idReimbursement;
  String? userId;
  String? employeeId;
  String? name;
  String? title;
  String? nominal;
  dynamic atc;
  String? status;
  int? createdAt;
  int? updatedAt;
  UserData? user;

  ReimbursementData({
    this.idReimbursement, 
    this.userId, 
    this.employeeId, 
    this.name, 
    this.title, 
    this.nominal, 
    this.atc, 
    this.status, 
    this.createdAt, 
    this.updatedAt, 
    this.user
  });

  ReimbursementData.fromJson(Map<String, dynamic> json) {
    try {
      idReimbursement = json['id_reimbursement'];
      userId = json['user_id'];
      employeeId = json['employee_id'];
      name = json['name'];
      title = json['title'];
      nominal = json['nominal'];
      atc = json['atc'];
      status = json['status'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    } catch (e) {
      log('Something wrong with the response ReimbursementData');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_reimbursement'] = idReimbursement;
    data['user_id'] = userId;
    data['employee_id'] = employeeId;
    data['name'] = name;
    data['title'] = title;
    data['nominal'] = nominal;
    data['atc'] = atc;
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
    data['name'] = name;
    data['title'] = title;
    data['nominal'] = nominal;
    data['atc'] = atc;
    return data;
  }
}
