part of "../models.dart";

class MeetingData {
  int? idMeeting;
  String? name;
  String? detail;
  String? place;
  String? date;
  String? time;
  String? division;
  String? user;
  String? penerbit;
  int? createdAt;
  int? updatedAt;

  MeetingData(
      {this.idMeeting,
      this.name,
      this.detail,
      this.place,
      this.date,
      this.time,
      this.division,
      this.user,
      this.penerbit,
      this.createdAt,
      this.updatedAt,});

  MeetingData.fromJson(Map<String, dynamic> json) {
    try {
      idMeeting = json['id_meeting'];
      name = json['name'];
      detail = json['detail'];
      place = json['place'];
      date = json['date'];
      time = json['time'];
      division = json['division'];
      user = json['user'];
      penerbit = json['penerbit'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
    } catch (e) {
      log('Something wrong with this response inventory');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_meeting'] = idMeeting;
    data['name'] = name;
    data['detail'] = detail;
    data['place'] = place;
    data['date'] = date;
    data['time'] = time;
    data['division'] = division;
    data['user'] = user;
    data['penerbit'] = penerbit;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
