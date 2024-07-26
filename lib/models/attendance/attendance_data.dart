part of "../models.dart";

class AttendanceData {
  int? idAttendance;
  String? userId;
  String? name;
  String? employeeId;
  Null? temperature;
  Null? skin;
  String? date;
  String? time;
  Null? day;
  String? division;
  String? status;
  String? shiftName;
  Null? timetable;
  Null? tglMasukOri;
  Null? timeMasukOri;
  Null? tglPulangOri;
  Null? timePulangOri;
  Null? jamKerjaOri;
  Null? jamKerja;
  Null? tglMasuk;
  Null? timeMasuk;
  Null? tglPulang;
  Null? timePulang;
  String? terlambat;
  Null? pulangAwal;
  Null? durasiAbsen;
  Null? durasiIstirahat;
  Null? durasiCuti;
  Null? ot1;
  Null? ot2;
  Null? ot3;
  Null? durasiLembur;
  Null? kerjaValid;
  int? createdAt;
  int? updatedAt;
  UserData? user;

  AttendanceData(
      {this.idAttendance,
      this.userId,
      this.name,
      this.employeeId,
      this.temperature,
      this.skin,
      this.date,
      this.time,
      this.day,
      this.division,
      this.status,
      this.shiftName,
      this.timetable,
      this.tglMasukOri,
      this.timeMasukOri,
      this.tglPulangOri,
      this.timePulangOri,
      this.jamKerjaOri,
      this.jamKerja,
      this.tglMasuk,
      this.timeMasuk,
      this.tglPulang,
      this.timePulang,
      this.terlambat,
      this.pulangAwal,
      this.durasiAbsen,
      this.durasiIstirahat,
      this.durasiCuti,
      this.ot1,
      this.ot2,
      this.ot3,
      this.durasiLembur,
      this.kerjaValid,
      this.createdAt,
      this.updatedAt,
      this.user});

  AttendanceData.fromJson(Map<String, dynamic> json) {
    idAttendance = json['id_attendance'];
    userId = json['user_id'];
    name = json['name'];
    employeeId = json['employee_id'];
    temperature = json['temperature'];
    skin = json['skin'];
    date = json['date'];
    time = json['time'];
    day = json['day'];
    division = json['division'];
    status = json['status'];
    shiftName = json['shift_name'];
    timetable = json['timetable'];
    tglMasukOri = json['tgl_masuk_ori'];
    timeMasukOri = json['time_masuk_ori'];
    tglPulangOri = json['tgl_pulang_ori'];
    timePulangOri = json['time_pulang_ori'];
    jamKerjaOri = json['jam_kerja_ori'];
    jamKerja = json['jam_kerja'];
    tglMasuk = json['tgl_masuk'];
    timeMasuk = json['time_masuk'];
    tglPulang = json['tgl_pulang'];
    timePulang = json['time_pulang'];
    terlambat = json['terlambat'];
    pulangAwal = json['pulang_awal'];
    durasiAbsen = json['durasi_absen'];
    durasiIstirahat = json['durasi_istirahat'];
    durasiCuti = json['durasi_cuti'];
    ot1 = json['ot1'];
    ot2 = json['ot2'];
    ot3 = json['ot3'];
    durasiLembur = json['durasi_lembur'];
    kerjaValid = json['kerja_valid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_attendance'] = idAttendance;
    data['user_id'] = userId;
    data['name'] = name;
    data['employee_id'] = employeeId;
    data['temperature'] = temperature;
    data['skin'] = skin;
    data['date'] = date;
    data['time'] = time;
    data['day'] = day;
    data['division'] = division;
    data['status'] = status;
    data['shift_name'] = shiftName;
    data['timetable'] = timetable;
    data['tgl_masuk_ori'] = tglMasukOri;
    data['time_masuk_ori'] = timeMasukOri;
    data['tgl_pulang_ori'] = tglPulangOri;
    data['time_pulang_ori'] = timePulangOri;
    data['jam_kerja_ori'] = jamKerjaOri;
    data['jam_kerja'] = jamKerja;
    data['tgl_masuk'] = tglMasuk;
    data['time_masuk'] = timeMasuk;
    data['tgl_pulang'] = tglPulang;
    data['time_pulang'] = timePulang;
    data['terlambat'] = terlambat;
    data['pulang_awal'] = pulangAwal;
    data['durasi_absen'] = durasiAbsen;
    data['durasi_istirahat'] = durasiIstirahat;
    data['durasi_cuti'] = durasiCuti;
    data['ot1'] = ot1;
    data['ot2'] = ot2;
    data['ot3'] = ot3;
    data['durasi_lembur'] = durasiLembur;
    data['kerja_valid'] = kerjaValid;
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
    data['employee_id'] = employeeId;
    data['date'] = date;
    data['time'] = time;
    data['division'] = division;
    data['status'] = status;
    data['shift_name'] = shiftName;
    data['terlambat'] = terlambat;
    return data;
  }
}
