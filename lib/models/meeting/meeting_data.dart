part of "../models.dart";

class MeetingData {
  int? idMeeting;
  String? idMt;
  String? stmeetingId;
  String? forwardId;
  String? ownerId;
  String? title;
  String? date;
  String? notes;
  String? pmSign;
  String? signDate;
  String? clientSign;
  String? narasi;
  String? password;
  int? createdAt;
  int? updatedAt;
  StmeetingData? stmeeting;
  UserData? forward;
  UserData? owner;

  MeetingData({
    this.idMeeting,
    this.idMt,
    this.stmeetingId,
    this.forwardId,
    this.ownerId,
    this.title,
    this.date,
    this.notes,
    this.pmSign,
    this.signDate,
    this.clientSign,
    this.narasi,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.stmeeting,
    this.forward,
    this.owner,
  });

  MeetingData.fromJson(Map<String, dynamic> json) {
    try {
      idMeeting = json['id_meeting'];
      idMt = json['id_mt'];
      stmeetingId = json['stmeeting_id'];
      forwardId = json['forward_id'];
      ownerId = json['owner_id'];
      title = json['title'];
      date = json['date'];
      notes = json['notes'];
      pmSign = json['pm_sign'];
      signDate = json['sign_date'];
      clientSign = json['client_sign'];
      narasi = json['narasi'];
      password = json['password'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      stmeeting = json['stmeeting'] != null
          ? StmeetingData.fromJson(json['stmeeting'])
          : null;
      forward = json['forward'] != null
          ? UserData.fromJson(json['forward'])
          : null;
      owner =
          json['owner'] != null 
          ? UserData.fromJson(json['owner']) 
          : null;
    } catch (e) {
      log('Something wrong with this response meeting category');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_meeting'] = idMeeting;
    data['id_mt'] = idMt;
    data['stmeeting_id'] = stmeetingId;
    data['forward_id'] = forwardId;
    data['owner_id'] = ownerId;
    data['title'] = title;
    data['date'] = date;
    data['notes'] = notes;
    data['pm_sign'] = pmSign;
    data['sign_date'] = signDate;
    data['client_sign'] = clientSign;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (stmeeting != null) {
      data['stmeeting'] = stmeeting!.toJson();
    }
    if (forward != null) {
      data['forward'] = forward!.toJson();
    }
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toJsonSend() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['owner_id'] = ownerId;
    data['stmeeting_id'] = stmeetingId;
    data['forward_id'] = forwardId;
    data['title'] = title;
    data['date'] = date;
    data['notes'] = notes;
    data['password'] = password;
    return data;
  }
}
