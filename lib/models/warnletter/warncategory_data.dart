part of "../models.dart";

class WarncategoryData {
  int? idWarncategory;
  String? name;
  int? createdAt;
  int? updatedAt;

  WarncategoryData({this.idWarncategory, this.name, this.createdAt, this.updatedAt});

  WarncategoryData.fromJson(Map<String, dynamic> json) {
    idWarncategory = json['id_warncategory'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_warncategory'] = idWarncategory;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
