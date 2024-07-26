part of "../models.dart";

class EmployeeData {
  int? idEmployee;
  String? firstName;
  String? lastName;
  String? profilPic;
  String? id;
  String? detailId;
  // int? detailId;
  String? type;
  String? personGroup;
  String? gender;
  String? start;
  String? end;
  String? card;
  String? email;
  String? phone;
  String? remark;
  String? pin;
  String? superUser;
  String? access;
  String? device;
  String? information;
  String? room;
  String? skin;
  // double? skin;
  String? temperature;
  String? akun;
  String? shiftId;
  int? createdAt;
  int? updatedAt;
  DetailemployeeData? detailemployee;
  ShiftData? shift;

  EmployeeData(
      {this.idEmployee,
      this.firstName,
      this.lastName,
      this.profilPic,
      this.id,
      this.detailId,
      this.type,
      this.personGroup,
      this.gender,
      this.start,
      this.end,
      this.card,
      this.email,
      this.phone,
      this.remark,
      this.pin,
      this.superUser,
      this.access,
      this.device,
      this.information,
      this.room,
      this.skin,
      this.temperature,
      this.akun,
      this.shiftId,
      this.createdAt,
      this.updatedAt,
      this.detailemployee,
      this.shift,});

  EmployeeData.fromJson(Map<String, dynamic> json) {
    try {
      idEmployee = json['id_employee'];
      firstName = json['first_name'];
      lastName =   json['last_name'];
      profilPic =   json['profil_pic'];
      id =   json['id'];
      detailId =   json['detailemployee_id'];
      type =   json['type'];
      personGroup =   json['person_group'];
      gender =   json['gender'];
      start =   json['start_time_of_effective_period'];
      end =   json['end_time_of_effective_period'];
      card =   json['card'];
      email =   json['email'];
      phone =   json['phone'];
      remark =   json['remark'];
      pin =   json['pin'];
      superUser =   json['super_user'];
      access =   json['extended_access'];
      device =   json['device_administrator'];
      information =   json['custom_information_to_be_applied'];
      room =   json['room_no'];
      skin =   json['skin_surface_temperature'];
      temperature =   json['temperature_status'];
      akun =   json['akun'];
      shiftId =   json['shift_id'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      detailemployee = json['detailemployee'] != null ? DetailemployeeData.fromJson(json['detailemployee']) : null;
      shift = json['shift'] != null ? ShiftData.fromJson(json['shift']) : null;
    } catch (e) {
      log('Something wrong with this response inventory');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_employee'] = idEmployee;
    data['first_name'] = firstName ;
    data['last_name'] = lastName ;
    data['profil_pic'] = profilPic ;
    data['id'] = id ;
    data['detailemployee_id'] = detailId ;
    data['type'] = type ;
    data['person_group'] = personGroup ;
    data['gender'] = gender ;
    data['start_time_of_effective_period'] = start ;
    data['end_time_of_effective_period'] = end ;
    data['card'] = card ;
    data['email'] = email ;
    data['phone'] = phone ;
    data['remark'] = remark ;
    data['pin'] = pin ;
    data['super_user'] = superUser ;
    data['extended_access'] = access ;
    data['device_administrator'] = device ;
    data['custom_information_to_be_applied'] = information ;
    data['room_no'] = room ;
    data['skin_surface_temperature'] = skin ;
    data['temperature_status'] = temperature ;
    data['akun'] = akun ;
    data['shift_id'] = shiftId ;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (detailemployee != null) {
      data['detailemployee'] = detailemployee!.toJson();
    }if (shift != null) {
      data['shift'] = shift!.toJson();
    }
    return data;
  }
}
