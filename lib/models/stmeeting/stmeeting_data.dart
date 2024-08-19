part of "../models.dart";

class StmeetingData {
  int? idStmeeting;
  String? name;
  int? createdAt;
  int? updatedAt;
  List<MeetingData>? meetings;

  StmeetingData({
    this.idStmeeting,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.meetings,
  });

  StmeetingData.fromJson(Map<String, dynamic> json) {
    try {
      idStmeeting = json['id_stmeeting'];
      name = json['name'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      if (json['meeting'] != null) {
        meetings = <MeetingData>[];
        json['meeting'].forEach((v) {
          meetings!.add(MeetingData.fromJson(v));
        });
      }
    } catch (e) {
      log('Something wrong with this response meeting category: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_stmeeting'] = idStmeeting;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (meetings != null) {
      data['meeting'] = meetings!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toJsonSend(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
