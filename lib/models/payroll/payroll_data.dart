part of "../models.dart";

class PayrollData {
  int? idPayroll;
  String? userId;
  String? employeeId;
  String? name;
  String? division;
  String? date;
  String? sick;
  String? unpaidLeave;
  String? annualLeave;
  String? alpha;
  String? totKerja;
  String? totHari;
  String? lembur;
  String? reward;
  String? gaji;
  String? t2;
  String? t3;
  String? total1;
  String? bpjsTk;
  String? jp;
  String? bpjsKes;
  String? lateness;
  String? penalty;
  String? dedOth;
  String? total2;
  String? subTotal;
  String? pph;
  String? grandTotal;
  String? status;
  String? thr;
  String? natura;
  int? createdAt;
  int? updatedAt;
  UserData? user;

  PayrollData(
      {this.idPayroll,
      this.userId,
      this.employeeId,
      this.name,
      this.division,
      this.date,
      this.sick,
      this.unpaidLeave,
      this.annualLeave,
      this.alpha,
      this.totKerja,
      this.totHari,
      this.lembur,
      this.reward,
      this.gaji,
      this.t2,
      this.t3,
      this.total1,
      this.bpjsTk,
      this.jp,
      this.bpjsKes,
      this.lateness,
      this.penalty,
      this.dedOth,
      this.total2,
      this.subTotal,
      this.pph,
      this.grandTotal,
      this.status,
      this.thr,
      this.natura,
      this.createdAt,
      this.updatedAt,
      this.user});

  PayrollData.fromJson(Map<String, dynamic> json) {
    try {
      idPayroll = json['id_payroll'];
      userId = json['user_id'];
      employeeId = json['employee_id'];
      name = json['name'];
      division = json['division'];
      date = json['date'];
      sick = json['sick'];
      unpaidLeave = json['unpaid_leave'];
      annualLeave = json['annual_leave'];
      alpha = json['alpha'];
      totKerja = json['tot_kerja'];
      totHari = json['tot_hari'];
      lembur = json['lembur'];
      reward = json['reward'];
      gaji = json['gaji'];
      t2 = json['t2'];
      t3 = json['t3'];
      total1 = json['total_1'];
      bpjsTk = json['bpjs_tk'];
      jp = json['jp'];
      bpjsKes = json['bpjs_kes'];
      lateness = json['lateness'];
      penalty = json['penalty'];
      dedOth = json['ded_oth'];
      total2 = json['total_2'];
      subTotal = json['sub_total'];
      pph = json['pph'];
      grandTotal = json['grand_total'];
      status = json['status'];
      thr = json['thr'];
      natura = json['natura'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    } catch (e) {
      log('Something wrong with this response payroll');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_payroll'] = idPayroll;
    data['user_id'] = userId;
    data['employee_id'] = employeeId;
    data['name'] = name;
    data['division'] = division;
    data['date'] = date;
    data['sick'] = sick;
    data['unpaid_leave'] = unpaidLeave;
    data['annual_leave'] = annualLeave;
    data['alpha'] = alpha;
    data['tot_kerja'] = totKerja;
    data['tot_hari'] = totHari;
    data['lembur'] = lembur;
    data['reward'] = reward;
    data['gaji'] = gaji;
    data['t2'] = t2;
    data['t3'] = t3;
    data['total_1'] = total1;
    data['bpjs_tk'] = bpjsTk;
    data['jp'] = jp;
    data['bpjs_kes'] = bpjsKes;
    data['lateness'] = lateness;
    data['penalty'] = penalty;
    data['ded_oth'] = dedOth;
    data['total_2'] = total2;
    data['sub_total'] = subTotal;
    data['pph'] = pph;
    data['grand_total'] = grandTotal;
    data['status'] = status;
    data['thr'] = thr;
    data['natura'] = natura;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toJsonSend() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = 'Iya';
    return data;
  }
}
