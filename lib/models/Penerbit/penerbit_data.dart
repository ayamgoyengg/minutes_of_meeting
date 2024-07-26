part of "../models.dart";

class PenerbitData {
  int? id;
  String? name;
  Null? personGroup;
  Null? employeeId;
  String? email;
  Null? emailVerifiedAt;
  Null? twoFactorConfirmedAt;
  String? currentTeamId;
  // int? currentTeamId;
  String? profilePhotoPath;
  String? phone;
  String? roles;
  int? createdAt;
  int? updatedAt;
  String? profilePhotoUrl;

  PenerbitData(
      {this.id,
      this.name,
      this.personGroup,
      this.employeeId,
      this.email,
      this.emailVerifiedAt,
      this.twoFactorConfirmedAt,
      this.currentTeamId,
      this.profilePhotoPath,
      this.phone,
      this.roles,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoUrl});

  PenerbitData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    personGroup = json['person_group'];
    employeeId = json['employee_id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    phone = json['phone'];
    roles = json['roles'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['person_group'] = personGroup;
    data['employee_id'] = employeeId;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['two_factor_confirmed_at'] = twoFactorConfirmedAt;
    data['current_team_id'] = currentTeamId;
    data['profile_photo_path'] = profilePhotoPath;
    data['phone'] = phone;
    data['roles'] = roles;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_photo_url'] = profilePhotoUrl;
    return data;
  }
}
