part of "../models.dart";

class DetailemployeeData {
  int? idDataemployee;
  String? employeeId;
  // int? employeeId;
  String? nik;
  String? status;
  String? jabatan;
  String? kontrak;
  String? jmlKeluarga;
  // int? kontrak;
  // int? jmlKeluarga;
  String? alamat;
  String? kota;
  String? provinsi;
  String? tglLahir;
  String? golDarah;
  String? currentAds;
  String? agama;
  String? gajiPokok;
  String? kpi;
  String? t3;
  // int? gajiPokok;
  // int? kpi;
  // int? t3;
  String? riwayatPkt;
  String? kendaraan;
  String? sim;
  String? noPlat;
  String? tb;
  String? bb;
  // int? tb;
  // int? bb;
  String? kacamata;
  String? marital;
  String? jmlAnak;
  // int? jmlAnak;
  String? hotline;
  String? noBpjs;
  String? level;
  String? pph;
  String? reward;
  String? dedOth;
  // int? pph;
  // int? reward;
  // int? dedOth;
  String? bpjsKes;
  int? createdAt;
  int? updatedAt;

  DetailemployeeData(
    {
    this.idDataemployee,
    this.employeeId,
    this.nik,
    this.status,
    this.jabatan,
    this.kontrak,
    this.jmlKeluarga,
    this.alamat,
    this.kota,
    this.provinsi,
    this.tglLahir,
    this.golDarah,
    this.currentAds,
    this.agama,
    this.gajiPokok,
    this.kpi,
    this.t3,
    this.riwayatPkt,
    this.kendaraan,
    this.sim,
    this.noPlat,
    this.tb,
    this.bb,
    this.kacamata,
    this.marital,
    this.jmlAnak,
    this.hotline,
    this.noBpjs,
    this.level,
    this.pph,
    this.reward,
    this.dedOth,
    this.bpjsKes,
    this.createdAt,
    this.updatedAt,
    });

  DetailemployeeData.fromJson(Map<String, dynamic> json) {
    try {
      idDataemployee= json['id_detailemployee'];
      employeeId= json['employee_id'];
      nik= json['nik'];
      status= json['status'];
      jabatan= json['jabatan'];
      kontrak= json['kontrak'];
      jmlKeluarga= json['jml_keluarga'];
      alamat= json['alamat'];
      kota= json['kota'];
      provinsi= json['provinsi'];
      tglLahir= json['tgl_lahir'];
      golDarah= json['gol_darah'];
      currentAds= json['current_ads'];
      agama= json['agama'];
      gajiPokok= json['gaji_pokok'];
      kpi= json['kpi'];
      t3= json['t3'];
      riwayatPkt= json['riwayat_pkt'];
      kendaraan= json['kendaraan'];
      sim= json['sim'];
      noPlat= json['no_plat'];
      tb= json['tb'];
      bb= json['bb'];
      kacamata= json['kacamata'];
      marital= json['marital'];
      jmlAnak= json['jml_anak'];
      hotline= json['hotline'];
      noBpjs= json['no_bpjs'];
      level= json['level'];
      pph= json['pph'];
      reward= json['reward'];
      dedOth= json['ded_oth'];
      bpjsKes= json['bpjs_kes'];
      createdAt= json['created_at'];
      updatedAt= json['updated_at'];
    } catch (e) {
      log('Something wrong with this response inventory');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_detailemployee'] = idDataemployee;
    data['employee_id'] = employeeId;
    data['nik'] =  nik;
    data['status'] = status;
    data['jabatan'] = jabatan;
    data['kontrak'] = kontrak;
    data['jml_keluarga'] = jmlKeluarga;
    data['alamat'] = alamat;
    data['kota'] = kota;
    data['provinsi'] = provinsi;
    data['tgl_lahir'] = tglLahir;
    data['gol_darah'] = golDarah;
    data['current_ads'] = currentAds;
    data['agama'] = agama;
    data['gaji_pokok'] = gajiPokok;
    data['kpi'] = kpi;
    data['t3'] = t3;
    data['riwayat_pkt'] = riwayatPkt;
    data['kendaraan']= kendaraan;
    data['sim'] = sim;
    data['no_plat'] = noPlat;
    data['tb'] = tb;
    data['bb'] = bb;
    data['kacamata'] = kacamata;
    data['marital'] = marital;
    data['jml_anak'] = jmlAnak;
    data['hotline'] = hotline;
    data['no_bpjs'] = noBpjs;
    data['level'] = level;
    data['pph'] = pph;
    data['reward'] = reward;
    data['ded_oth'] = dedOth;
    data['bpjs_kes'] = bpjsKes;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
