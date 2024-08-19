part of "../models.dart";

class AlluserData {
  int? idUser;
  String? userName;
  String? email;
  String? emailVerifiedAt;
  String? nomor;
  String? twoFactorConfirmedAt;
  String? roles;
  String? currentTeamId;
  String? profilePhotoPath;
  int? createdAt;
  int? updatedAt;
  String? profilePhotoUrl;

  AlluserData({
    this.idUser,
    this.userName,
    this.email,
    this.emailVerifiedAt,
    this.nomor,
    this.twoFactorConfirmedAt,
    this.roles,
    this.currentTeamId,
    this.profilePhotoPath,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
  });

  AlluserData.fromJson(Map<String, dynamic> json) {
    try {
      idUser = json['id'];
      userName = json['name'];
      email = json['email'];
      emailVerifiedAt = json['email_verified_at'];
      nomor = json['nomor'];
      twoFactorConfirmedAt = json['two_factor_confirmed_at'];
      roles = json['roles'];
      currentTeamId = json['current_team_id'];
      profilePhotoPath = json['profile_photo_path'];
      createdAt = json['created_at'];
      updatedAt = json['updated_at'];
      profilePhotoUrl = json['profile_photo_url'];
    } catch (e) {
      log('Something wrong with this response inventory');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = idUser;
    data['name'] = userName;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['nomor'] = nomor;
    data['two_factor_confirmed_at'] = twoFactorConfirmedAt;
    data['roles'] = roles;
    data['current_team_id'] = currentTeamId;
    data['profile_photo_path'] = profilePhotoPath;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_photo_url'] = profilePhotoUrl;
    return data;
  }
}
