part of "../models.dart";

class WarnletterData {
  int? idWarnletter;
  String? warncategoryId;
  String? userId;
  String? penerbitId;
  // int? warncategoryId;
  // int? userId;
  // int? penerbitId;
  String? letter;
  String? keterangan;
  int? createdAt;
  int? updatedAt;
  UserData? user;
  WarncategoryData? warncategory;
  PenerbitData? penerbit;

  WarnletterData({this.idWarnletter, this.warncategoryId, this.userId, this.penerbitId, this.letter, this.keterangan, this.createdAt, this.updatedAt, this.user, this.warncategory, this.penerbit});

  WarnletterData.fromJson(Map<String, dynamic> json) {
    idWarnletter = json['id_warnletter'];
    warncategoryId = json['warncategory_id'];
    userId = json['user_id'];
    penerbitId = json['penerbit_id'];
    letter = json['letter'];
    keterangan = json['keterangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
    warncategory = json['warncategory'] != null ? WarncategoryData.fromJson(json['warncategory']) : null;
    penerbit = json['penerbit'] != null ? PenerbitData.fromJson(json['penerbit']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_warnletter'] = idWarnletter;
    data['warncategory_id'] = warncategoryId;
    data['user_id'] = userId;
    data['penerbit_id'] = penerbitId;
    data['letter'] = letter;
    data['keterangan'] = keterangan;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (warncategory != null) {
      data['warncategory'] = warncategory!.toJson();
    }
    if (penerbit != null) {
      data['penerbit'] = penerbit!.toJson();
    }
    return data;
  }
}
