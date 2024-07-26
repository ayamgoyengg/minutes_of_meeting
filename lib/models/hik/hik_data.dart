part of "../models.dart";

class HikData {
  int? idHik;
  String? employeeId;
  String? tglJam;
  String? tgl;
  String? time;
  String? device;
  String? name;
  String? division;
  String? card;
  String? suhu;
  String? statusSuhu;
  String? masker;
  String? status;
  int? createdAt;
  int? updatedAt;

  HikData(
      {this.idHik,
      this.employeeId,
      this.tglJam,
      this.tgl,
      this.time,
      this.device,
      this.name,
      this.division,
      this.card,
      this.suhu,
      this.statusSuhu,
      this.masker,
      this.status,
      this.createdAt,
      this.updatedAt,});

  HikData.fromJson(Map<String, dynamic> json) {
    try {
      idHik = json['id_hik'];
      employeeId = json['employee_id'];
      tglJam = json['tgl_jam'];
      tgl = json['tgl'];
      time = json['time'];
      device = json['device'];
      name = json['name'];
      division = json['division'];
      card = json['card'];
      suhu = json['suhu'];
      statusSuhu = json['status_suhu'];
      masker = json['masker'];
      status = json['status'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
    } catch (e) {
      log('Something wrong with this response inventory');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_hik'] = idHik;
    data['employee_id'] = employeeId;
    data['tgl_jam'] = tglJam;
    data['tgl'] = tgl;
    data['time'] = time;
    data['device'] = device;
    data['name'] = name;
    data['division'] = division;
    data['card'] = card;
    data['suhu'] = suhu;
    data['status_suhu'] = statusSuhu;
    data['masker'] = masker;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
