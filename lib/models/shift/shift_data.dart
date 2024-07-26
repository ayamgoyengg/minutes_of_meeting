part of "../models.dart";

class ShiftData {
  int? idShift;
  String? name;
  String? startTime;
  String? endTime;
  String? startBreakTime;
  String? endBreakTime;
  int? createdAt;
  int? updatedAt;

  ShiftData({this.idShift, this.name, this.startTime, this.endTime, this.startBreakTime, this.endBreakTime, this.createdAt, this.updatedAt});

  ShiftData.fromJson(Map<String, dynamic> json) {
    idShift = json['id_shift'];
    name = json['name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    startBreakTime = json['start_break_time'];
    endBreakTime = json['end_break_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_shift'] = idShift;
    data['name'] = name;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['start_break_time'] = startBreakTime;
    data['end_break_time'] = endBreakTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
