part of "../models.dart";

class EmpovertimeData {
  int? idEmpovertime;
  String? employeeId;
  // int? userId;
  String? userId;
  String? accesorId;
  String? date;
  String? timeMasuk;
  String? timePulang;
  String? upah;
  // double? upah;
  String? status;
  String? nh;
  String? divisi;
  String? gajiPokok;
  int? createdAt;
  int? updatedAt;
  UserData? user;

  EmpovertimeData({
    this.idEmpovertime, 
    this.employeeId, 
    this.userId, 
    this.accesorId, 
    this.date, 
    this.timeMasuk, 
    this.timePulang,
    this.upah, 
    this.status, 
    this.nh, 
    this.divisi, 
    this.gajiPokok, 
    this.createdAt, 
    this.updatedAt, 
    this.user
  });

  EmpovertimeData.fromJson(Map<String, dynamic> json) {
    try {
      idEmpovertime = json['id_empovertime'];
      employeeId = json['employee_id'];
      userId = json['user_id'];
      accesorId = json['accesor_id'];
      date = json['date'];
      timeMasuk = json['time_masuk'];
      timePulang = json['time_pulang'];
      upah = json['upah'];
      status = json['status'];
      nh = json['nh'];
      divisi = json['divisi'];
      gajiPokok = json['gaji_pokok'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    } catch (e) {
      log('Something wrong with the response EmpovertimeData');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_empovertime'] = idEmpovertime;
    data['employee_id'] = employeeId;
    data['user_id'] = userId;
    data['accesor_id'] = accesorId;
    data['date'] = date;
    data['time_masuk'] = timeMasuk;
    data['time_pulang'] = timePulang;
    data['upah'] = upah;
    data['status'] = status;
    data['nh'] = nh;
    data['divisi'] = divisi;
    data['gaji_pokok'] = gajiPokok;
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
    data['user_id'] = userId;
    data['date'] = date;
    data['time_masuk'] = timeMasuk;
    data['time_pulang'] = timePulang;
    data['nh'] = nh;
    data['divisi'] = divisi;
    data['gaji_pokok'] = gajiPokok;
    return data;
  }
}
