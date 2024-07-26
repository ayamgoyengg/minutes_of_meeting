part of "../models.dart";

class ForgetattendanceData {
  int? idForgetattendance;
  String? employeeId;
  String? accesorId;
  String? tgl;
  String? time;
  String? device;
  String? name;
  String? division;
  String? status;
  String? confirm;
  String? tag;
  String? link;
  String? lokasi;
  String? keterangan;
  int? createdAt;
  int? updatedAt;
  UserData? user;

  ForgetattendanceData({
    this.idForgetattendance, 
    this.employeeId,
    this.accesorId, 
    this.tgl, 
    this.time, 
    this.device,
    this.name, 
    this.division, 
    this.status,
    this.confirm,
    this.tag,
    this.link,
    this.lokasi,
    this.keterangan,
    this.createdAt, 
    this.updatedAt, 
    this.user,
    });

  ForgetattendanceData.fromJson(Map<String, dynamic> json) {
    try {
      idForgetattendance = json['id_forgetattendance'];
      employeeId = json['employee_id'];
      accesorId = json['accesor_id'];
      tgl = json['tgl'];
      time = json['time'];
      device = json['device'];
      name = json['name'];
      division = json['division'];
      status = json['status'];
      confirm = json['confirm'];
      tag = json['tag'];
      link = json['link'];
      lokasi = json['lokasi'];
      keterangan = json['keterangan'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    } catch (e) {
      log('Something wrong with the response ForgetattendanceData');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_forgetattendance'] = idForgetattendance;
    data['employee_id'] = employeeId;
    data['accesor_id'] = accesorId;
    data['tgl'] = tgl;
    data['time'] = time;
    data['device'] = device;
    data['name'] = name;
    data['division'] = division;
    data['status'] = status;
    data['confirm'] = confirm;
    data['tag'] = tag;
    data['link'] = link;
    data['lokasi'] = lokasi;
    data['keterangan'] = keterangan;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toJsonSend() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employee_id'] = employeeId;
    data['tgl'] = tgl;
    data['time'] = time;
    data['name'] = name;
    data['division'] = division;
    data['status'] = status;
    data['tag'] = tag;
    data['lokasi'] = lokasi;
    data['keterangan'] = keterangan;
    return data;
  }
}
