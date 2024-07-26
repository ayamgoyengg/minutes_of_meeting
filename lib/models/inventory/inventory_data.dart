part of "../models.dart";

class InventoryData {
  int? idInventory;
  String? code;
  String? name;
  String? specification;
  String? freeText;
  String? lantai;
  String? qty;
  // int? qty;
  String? satuan;
  String? rcvd;
  String? latestCheck;
  String? frequencyCheck;
  String? nextCheck;
  String? condition;
  String? note;
  int? createdAt;
  int? updatedAt;

  InventoryData(
      {this.idInventory,
      this.code,
      this.name,
      this.specification,
      this.freeText,
      this.lantai,
      this.qty,
      this.satuan,
      this.rcvd,
      this.latestCheck,
      this.frequencyCheck,
      this.nextCheck,
      this.condition,
      this.note,
      this.createdAt,
      this.updatedAt,});

  InventoryData.fromJson(Map<String, dynamic> json) {
    try {
      idInventory = json['id_inventory'];
      code = json['code'];
      name = json['name'];
      specification = json['specification'];
      freeText = json['free_text'];
      lantai = json['lantai'];
      qty = json['qty'];
      satuan = json['satuan'];
      rcvd = json['rcvd'];
      latestCheck = json['latest_check'];
      frequencyCheck = json['frequency_check'];
      nextCheck = json['next_check'];
      condition = json['condition'];
      note = json['note'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
    } catch (e) {
      log('Something wrong with this response inventory');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_inventory'] = idInventory;
    data['code'] = code;
    data['name'] = name;
    data['specification'] = specification;
    data['free_text'] = freeText;
    data['lantai'] = lantai;
    data['qty'] = qty;
    data['satuan'] = satuan;
    data['rcvd'] = rcvd;
    data['latest_check'] = latestCheck;
    data['frequency_check'] = frequencyCheck;
    data['next_check'] = nextCheck;
    data['condition'] = condition;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
