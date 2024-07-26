part of "../models.dart";

class TncData {
  int? idTnc;
  String? narasi;
  int? createdAt;
  int? updatedAt;

  TncData({this.idTnc, this.narasi, this.createdAt, this.updatedAt});

  TncData.fromJson(Map<String, dynamic> json) {
    idTnc = json['id_tnc'];
    narasi = json['narasi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_tnc'] = idTnc;
    data['narasi'] = narasi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
