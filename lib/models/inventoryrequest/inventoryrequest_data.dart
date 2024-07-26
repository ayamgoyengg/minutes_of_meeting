part of "../models.dart";

class InventoryrequestData {
  int? idInventoryrequest;
  String? employeeId;
  String? userId;
  // int? userId;
  String? accesorId;
  String? inventoryId;
  // int? inventoryId;
  String? division;
  String? tglPinjam;
  String? time;
  String? qty;
  // int? qty;
  String? tglKembali;
  String? note;
  String? status;
  int? createdAt;
  int? updatedAt;
  UserData? user;
  InventoryData? inventory;

  InventoryrequestData({
    this.idInventoryrequest, 
    this.employeeId,
    this.userId, 
    this.accesorId, 
    this.inventoryId, 
    this.division, 
    this.tglPinjam, 
    this.time, 
    this.qty, 
    this.tglKembali,
    this.note,
    this.status,
    this.createdAt, 
    this.updatedAt, 
    this.user,
    this.inventory
    });

  InventoryrequestData.fromJson(Map<String, dynamic> json) {
    try {
      idInventoryrequest = json['id_inventoryrequest'];
      employeeId = json['employee_id'];
      userId = json['user_id'];
      accesorId = json['accesor_id'];
      inventoryId = json['inventory_id'];
      division = json['division'];
      tglPinjam = json['tgl_pinjam'];
      time = json['time'];
      qty = json['qty'];
      tglKembali = json['tgl_kembali'];
      note = json['note'];
      status = json['status'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      user = json['user'] != null ? UserData.fromJson(json['user']) : null;
      inventory = json['inventory'] != null ? InventoryData.fromJson(json['inventory']) : null;
    } catch (e) {
      log('Someth9ing wrong with the response InventoryrequestData');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_inventoryrequest'] = idInventoryrequest;
    data['employee_id'] = employeeId;
    data['user_id'] = userId;
    data['accesor_id'] = accesorId;
    data['inventory_id'] = inventoryId;
    data['division'] = division;
    data['tgl_pinjam'] = tglPinjam;
    data['time'] = time;
    data['qty'] = qty;
    data['tgl_kembali'] = tglKembali;
    data['note'] = note;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (inventory != null) {
      data['inventory'] = inventory!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toJsonSend() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['employee_id'] = employeeId;
    data['inventory_id'] = inventoryId;
    data['division'] = division;
    data['tgl_pinjam'] = tglPinjam;
    data['time'] = time;
    data['qty'] = qty;
    return data;
  }
}
